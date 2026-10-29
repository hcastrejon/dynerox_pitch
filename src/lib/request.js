// Request helpers: bot detection, device parsing, hashed IP, geo from Cloudflare.

// Link-preview fetchers, crawlers, mail scanners and scripted clients.
// A match means "not a person". These visits go to bot_hits, never to visits.
const BOT_RE = /bot\b|bot\/|crawl|spider|slurp|preview|facebookexternalhit|facebot|whatsapp|telegrambot|slackbot|slack-imgproxy|linkedinbot|twitterbot|discordbot|skypeuripreview|embedly|vkshare|pinterest|redditbot|applebot|googlebot|google-inspectiontool|bingbot|yandex|baiduspider|duckduckbot|petalbot|bytespider|gptbot|claudebot|perplexity|headlesschrome|phantomjs|python-requests|python-urllib|aiohttp|curl\/|wget|go-http-client|okhttp|java\/|httpclient|axios|node-fetch|undici|microsoft office|ms-office|outlook|safelinks|barracuda|proofpoint|mimecast|zgrab|scanner|monitor|uptime|lighthouse/i;

export function botName(ua) {
  if (!ua || ua.length < 12) return 'empty-ua';
  const m = ua.match(BOT_RE);
  return m ? m[0].toLowerCase().replace(/\W+$/, '') : null;
}

export function parseUA(ua = '') {
  const device = /iPad|Tablet|SM-T\d|Nexus (7|9|10)|Kindle|Silk/i.test(ua) ? 'tablet'
    : /Mobi|iPhone|iPod|Android.+Mobile|Windows Phone/i.test(ua) ? 'mobile' : 'desktop';
  const os = /iPhone|iPad|iPod/.test(ua) ? 'iOS'
    : /Android/.test(ua) ? 'Android'
    : /Windows NT/.test(ua) ? 'Windows'
    : /CrOS/.test(ua) ? 'ChromeOS'
    : /Mac OS X|Macintosh/.test(ua) ? 'macOS'
    : /Linux/.test(ua) ? 'Linux' : 'Other';
  const browser = /LinkedInApp/i.test(ua) ? 'LinkedIn app'
    : /FBAN|FBAV/.test(ua) ? 'Facebook app'
    : /Instagram/.test(ua) ? 'Instagram app'
    : /Telegram/i.test(ua) ? 'Telegram app'
    : /Edg\//.test(ua) ? 'Edge'
    : /OPR\/|Opera/.test(ua) ? 'Opera'
    : /SamsungBrowser/.test(ua) ? 'Samsung'
    : /CriOS/.test(ua) ? 'Chrome'
    : /FxiOS|Firefox\//.test(ua) ? 'Firefox'
    : /Chrome\//.test(ua) ? 'Chrome'
    : /Safari\//.test(ua) && /Version\//.test(ua) ? 'Safari'
    : 'Other';
  return { device, os, browser };
}

async function sha256hex(text) {
  const buf = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(text));
  return [...new Uint8Array(buf)].map(b => b.toString(16).padStart(2, '0')).join('');
}

// IPs are never stored in clear. The salt is a secret (IP_SALT), so the hash
// cannot be reversed by trying every IPv4 address.
export async function clientInfo(request, env) {
  const ua = (request.headers.get('user-agent') || '').slice(0, 400);
  const ip = request.headers.get('cf-connecting-ip') || '';
  const cf = request.cf || {};
  return {
    ua,
    ...parseUA(ua),
    ipHash: ip ? (await sha256hex((env.IP_SALT || 'set-IP_SALT') + '|' + ip)).slice(0, 32) : null,
    country: cf.country || null,
    city: cf.city || null,
    referrer: (request.headers.get('referer') || '').slice(0, 300) || null
  };
}

export const nowIso = () => new Date().toISOString();

export function json(data, status = 200, extra = {}) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'content-type': 'application/json; charset=utf-8', 'cache-control': 'no-store', ...extra }
  });
}

// Access codes: 10 characters from a 31-character alphabet without look-alikes
// (no 0/o, 1/l/i). 31^10 ≈ 8 × 10^14 combinations (~49 bits), unbiased.
const ALPHABET = 'abcdefghjkmnpqrstuvwxyz23456789';
export function newCode(len = 10) {
  let out = '';
  while (out.length < len) {
    for (const b of crypto.getRandomValues(new Uint8Array(len * 2))) {
      if (b < 248 && out.length < len) out += ALPHABET[b % 31]; // 248 = 31 × 8, rejects bias
    }
  }
  return out;
}
export const CODE_RE = /^[A-Za-z0-9]{8,12}$/;
