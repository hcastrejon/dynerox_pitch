// One function decides what a request may see: requireLevel(context, level, opts).
// Every route calls it; no route checks access on its own.
//
// Levels, lowest to highest:
//   'public'   : no code (QR, general link). Counted under the "Sin código" row
//   'prospect' : a valid, active access code (/p/<code>, /api/event)
//   'investor' : phase 2, signed-in person approved by Hugo who accepted the NDA (not built yet)
//   'admin'    : Hugo. A valid Cloudflare Access token, or the ADMIN_TOKEN as a Bearer token
//
// Returns { ok: true, level, prospect?, admin? } or { ok: false, status, reason }.

import { CODE_RE, PUBLIC_CODE, nowIso } from './request.js';

export async function requireLevel(context, level, opts = {}) {
  const { env } = context;
  switch (level) {
    case 'public': {
      const sel = env.DB.prepare('SELECT id, code, name, company, active FROM prospects WHERE code = ?').bind(PUBLIC_CODE);
      let prospect = await sel.first();
      if (!prospect) {
        await env.DB.prepare('INSERT OR IGNORE INTO prospects (code, name, company, notes, created_at) VALUES (?,?,?,?,?)')
          .bind(PUBLIC_CODE, 'Sin código', 'QR / link general', 'Visitas a la página sin código personal.', nowIso()).run();
        prospect = await sel.first();
      }
      if (!prospect || !prospect.active) return deny(404, 'public-disabled');
      return { ok: true, level, prospect };
    }
    case 'prospect': {
      const code = String(opts.code || '');
      if (!CODE_RE.test(code)) return deny(404, 'bad-code');
      const prospect = await env.DB.prepare(
        'SELECT id, code, name, company, active FROM prospects WHERE code = ?'
      ).bind(code).first();
      if (!prospect || !prospect.active) return deny(404, 'unknown-or-revoked');
      return { ok: true, level, prospect };
    }
    case 'investor':
      // Phase 2: look up the signed-in investor session, check approved = 1 and
      // nda_accepted_at IS NOT NULL. Until then nobody has this level.
      return deny(403, 'investor-level-not-enabled');
    case 'admin': {
      const admin = await adminIdentity(context.request, env);
      if (admin) return { ok: true, level, admin };
      // Tell the panel why, so setup problems are visible.
      const accessOn = !!(env.ACCESS_TEAM_DOMAIN && env.ACCESS_AUD);
      const token = String(env.ADMIN_TOKEN || '').trim();
      const sent = (context.request.headers.get('authorization') || '').startsWith('Bearer ');
      if (!token && !accessOn) return deny(401, 'admin-not-configured');
      if (token && token.length < 24 && !accessOn) return deny(401, 'admin-token-too-short');
      return deny(401, sent ? 'admin-token-wrong' : 'admin-required');
    }
    default:
      return deny(500, 'unknown-level');
  }
}

const deny = (status, reason) => ({ ok: false, status, reason });

async function adminIdentity(request, env) {
  // 1) Cloudflare Access (production). Access already blocks unauthenticated visitors
  //    at the edge; checking the token here also protects the *.pages.dev address.
  if (env.ACCESS_TEAM_DOMAIN && env.ACCESS_AUD) {
    const jwt = request.headers.get('cf-access-jwt-assertion');
    if (jwt) {
      const payload = await verifyAccessJwt(jwt, env).catch(() => null);
      if (payload) {
        const allowed = (env.ADMIN_EMAILS || '').toLowerCase().split(',').map(s => s.trim()).filter(Boolean);
        const email = String(payload.email || '').toLowerCase();
        if (!allowed.length || allowed.includes(email)) return { via: 'access', email };
      }
    }
  }
  // 2) Bearer token (setup and the command-line script).
  const auth = request.headers.get('authorization') || '';
  const token = String(env.ADMIN_TOKEN || '').trim();
  if (token.length >= 24 && auth.startsWith('Bearer ')) {
    if (await safeEqual(auth.slice(7).trim(), token)) return { via: 'token' };
  }
  return null;
}

async function safeEqual(a, b) {
  const enc = new TextEncoder();
  const [ha, hb] = await Promise.all([crypto.subtle.digest('SHA-256', enc.encode(a)), crypto.subtle.digest('SHA-256', enc.encode(b))]);
  const x = new Uint8Array(ha), y = new Uint8Array(hb);
  let diff = 0; for (let i = 0; i < x.length; i++) diff |= x[i] ^ y[i];
  return diff === 0;
}

// --- Cloudflare Access JWT (RS256, keys published at <team>/cdn-cgi/access/certs) ---
let certCache = { at: 0, keys: [] };

function b64urlToBytes(s) {
  s = s.replace(/-/g, '+').replace(/_/g, '/'); while (s.length % 4) s += '=';
  return Uint8Array.from(atob(s), c => c.charCodeAt(0));
}

async function verifyAccessJwt(token, env) {
  const team = env.ACCESS_TEAM_DOMAIN.replace(/^https?:\/\//, '').replace(/\/$/, '');
  const [h, p, sig] = token.split('.');
  if (!h || !p || !sig) return null;
  const header = JSON.parse(new TextDecoder().decode(b64urlToBytes(h)));
  const payload = JSON.parse(new TextDecoder().decode(b64urlToBytes(p)));
  if (header.alg !== 'RS256') return null;

  if (Date.now() - certCache.at > 3600_000 || !certCache.keys.some(k => k.kid === header.kid)) {
    const res = await fetch(`https://${team}/cdn-cgi/access/certs`);
    const data = await res.json();
    certCache = { at: Date.now(), keys: data.keys || [] };
  }
  const jwk = certCache.keys.find(k => k.kid === header.kid);
  if (!jwk) return null;
  const key = await crypto.subtle.importKey('jwk', jwk, { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' }, false, ['verify']);
  const valid = await crypto.subtle.verify('RSASSA-PKCS1-v1_5', key, b64urlToBytes(sig), new TextEncoder().encode(h + '.' + p));
  if (!valid) return null;

  const now = Math.floor(Date.now() / 1000);
  const aud = Array.isArray(payload.aud) ? payload.aud : [payload.aud];
  if (!aud.includes(env.ACCESS_AUD)) return null;
  if (payload.iss !== `https://${team}`) return null;
  if (!payload.exp || payload.exp < now) return null;
  return payload;
}
