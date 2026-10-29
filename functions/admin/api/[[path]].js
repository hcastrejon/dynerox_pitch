// /admin/api/*  Hugo's panel. Every request passes requireLevel(context, 'admin').
//
//   GET   /admin/api/me
//   GET   /admin/api/prospects                 list with opens, last open, devices, countries...
//   POST  /admin/api/prospects                 { name, company?, notes? } -> new code + link
//   GET   /admin/api/prospects/:id             detail: summary, visits, timeline, bots
//   PATCH /admin/api/prospects/:id             { name?, company?, notes? }
//   POST  /admin/api/prospects/:id/revoke
//   POST  /admin/api/prospects/:id/activate
import { requireLevel } from '../../../src/lib/auth.js';
import { json, newCode, nowIso } from '../../../src/lib/request.js';

export async function onRequest(context) {
  const access = await requireLevel(context, 'admin');
  if (!access.ok) return json({ error: 'Sign in required', reason: access.reason }, access.status);

  const { request, env, params } = context;
  const parts = Array.isArray(params.path) ? params.path : [params.path].filter(Boolean);
  const method = request.method;
  const siteUrl = (env.SITE_URL || new URL(request.url).origin).replace(/\/$/, '');
  const link = code => `${siteUrl}/p/${code}`;

  try {
    if (parts[0] === 'me' && method === 'GET') return json({ ok: true, via: access.admin.via, email: access.admin.email || null });

    if (parts[0] !== 'prospects') return json({ error: 'Not found' }, 404);

    if (parts.length === 1 && method === 'GET') {
      const { results } = await env.DB.prepare(LIST_SQL).all();
      return json({ prospects: results.map(r => ({ ...r, link: link(r.code), forwarded: isForwarded(r) })) });
    }

    if (parts.length === 1 && method === 'POST') {
      const b = await request.json().catch(() => ({}));
      const name = String(b.name || '').trim().slice(0, 120);
      if (!name) return json({ error: 'Name is required' }, 400);
      const company = String(b.company || '').trim().slice(0, 120) || null;
      const notes = String(b.notes || '').trim().slice(0, 2000) || null;
      for (let attempt = 0; attempt < 5; attempt++) {
        const code = newCode();
        try {
          const row = await env.DB.prepare('INSERT INTO prospects (code, name, company, notes, created_at) VALUES (?,?,?,?,?) RETURNING *')
            .bind(code, name, company, notes, nowIso()).first();
          return json({ prospect: { ...row, link: link(code) } }, 201);
        } catch (e) {
          if (!String(e).includes('UNIQUE')) throw e;
        }
      }
      return json({ error: 'Could not create a unique code, try again' }, 500);
    }

    const id = Number(parts[1]);
    if (!Number.isInteger(id)) return json({ error: 'Not found' }, 404);

    if (parts.length === 3 && method === 'POST' && (parts[2] === 'revoke' || parts[2] === 'activate')) {
      const on = parts[2] === 'activate';
      await env.DB.prepare('UPDATE prospects SET active = ?, revoked_at = ? WHERE id = ?').bind(on ? 1 : 0, on ? null : nowIso(), id).run();
      return json({ ok: true, active: on });
    }

    if (parts.length === 2 && method === 'PATCH') {
      const b = await request.json().catch(() => ({}));
      const cur = await env.DB.prepare('SELECT * FROM prospects WHERE id = ?').bind(id).first();
      if (!cur) return json({ error: 'Not found' }, 404);
      const pick = (k, n) => (k in b ? (String(b[k] || '').trim().slice(0, n) || null) : cur[k]);
      await env.DB.prepare('UPDATE prospects SET name = ?, company = ?, notes = ? WHERE id = ?')
        .bind(pick('name', 120) || cur.name, pick('company', 120), pick('notes', 2000), id).run();
      return json({ ok: true });
    }

    if (parts.length === 2 && method === 'GET') {
      const p = await env.DB.prepare('SELECT * FROM prospects WHERE id = ?').bind(id).first();
      if (!p) return json({ error: 'Not found' }, 404);
      const [visits, events, bots, loads] = await env.DB.batch([
        env.DB.prepare('SELECT * FROM visits WHERE prospect_id = ? ORDER BY started_at DESC LIMIT 200').bind(id),
        env.DB.prepare('SELECT sid, type, data, client_at, at FROM events WHERE prospect_id = ? ORDER BY id ASC LIMIT 3000').bind(id),
        env.DB.prepare('SELECT at, method, bot_name, country, ua FROM bot_hits WHERE prospect_id = ? ORDER BY id DESC LIMIT 100').bind(id),
        env.DB.prepare('SELECT at, country, city, device, os, browser, referrer FROM page_loads WHERE prospect_id = ? ORDER BY id DESC LIMIT 100').bind(id)
      ]);
      return json({
        prospect: { ...p, link: link(p.code) },
        visits: visits.results,
        events: events.results.map(e => ({ ...e, data: safeParse(e.data) })),
        bots: bots.results,
        loads: loads.results
      });
    }

    return json({ error: 'Not found' }, 404);
  } catch (err) {
    console.error(err);
    return json({ error: 'Server error' }, 500);
  }
}

const safeParse = s => { try { return JSON.parse(s); } catch { return {}; } };

// Forwarded link: more than one country, more than one kind of device, or 3+ networks.
const isForwarded = r => (r.countries || 0) > 1 || (r.devices || 0) > 1 || (r.networks || 0) > 2;

const LIST_SQL = `
SELECT p.id, p.code, p.name, p.company, p.notes, p.created_at, p.active, p.revoked_at,
  (SELECT COUNT(*) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS opens,
  (SELECT MAX(v.human_at) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS last_open,
  (SELECT COUNT(DISTINCT v.country) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS countries,
  (SELECT GROUP_CONCAT(DISTINCT v.country) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS country_list,
  (SELECT COUNT(DISTINCT v.device || '|' || v.os || '|' || v.browser) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS devices,
  (SELECT COUNT(DISTINCT v.ip_hash) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS networks,
  (SELECT COALESCE(SUM(v.active_ms), 0) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS active_ms,
  (SELECT COALESCE(MAX(v.max_scroll), 0) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS max_scroll,
  (SELECT COALESCE(MAX(v.video_max_pct), 0) FROM visits v WHERE v.prospect_id = p.id) AS video_pct,
  (SELECT COUNT(DISTINCT json_extract(e.data, '$.id')) FROM events e WHERE e.prospect_id = p.id AND e.type = 'section_view') AS sections_seen,
  (SELECT GROUP_CONCAT(DISTINCT json_extract(e.data, '$.id')) FROM events e WHERE e.prospect_id = p.id AND e.type = 'section_view') AS section_list,
  (SELECT COUNT(DISTINCT json_extract(e.data, '$.slide')) FROM events e WHERE e.prospect_id = p.id AND e.type = 'slide_view') AS slides_seen,
  (SELECT COUNT(*) FROM bot_hits b WHERE b.prospect_id = p.id) AS bot_hits,
  (SELECT COUNT(*) FROM page_loads l WHERE l.prospect_id = p.id) AS page_loads
FROM prospects p
ORDER BY COALESCE((SELECT MAX(v.human_at) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1), p.created_at) DESC`;
