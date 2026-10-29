// POST /api/event  Batched tracking events from the investor page.
import { requireLevel } from '../../src/lib/auth.js';
import { botName, clientInfo, nowIso } from '../../src/lib/request.js';

const TYPES = new Set([
  'js_loaded', 'human_open', 'heartbeat', 'scroll_depth', 'section_view', 'section_dwell',
  'link_click', 'slide_view', 'slide_dwell', 'video_play', 'video_progress', 'video_pause', 'video_end'
]);
const SID_RE = /^[A-Za-z0-9-]{10,64}$/;
const MAX_EVENTS = 60;

export async function onRequestPost(context) {
  const { request, env } = context;
  if (Number(request.headers.get('content-length') || 0) > 64 * 1024) return new Response(null, { status: 413 });

  let body;
  try { body = await request.json(); } catch { return new Response(null, { status: 400 }); }
  if (!body || !SID_RE.test(String(body.sid || '')) || !Array.isArray(body.events)) return new Response(null, { status: 400 });

  const access = await requireLevel(context, 'prospect', { code: body.code });
  if (!access.ok) return new Response(null, { status: 404 });
  const pid = access.prospect.id;
  const sid = body.sid;
  const info = await clientInfo(request, env);
  const at = nowIso();

  const bot = botName(info.ua);
  if (bot) {
    await env.DB.prepare('INSERT INTO bot_hits (prospect_id, at, method, bot_name, ip_hash, country, ua) VALUES (?,?,?,?,?,?,?)')
      .bind(pid, at, 'JS', bot, info.ipHash, info.country, info.ua).run();
    return new Response(null, { status: 204 });
  }

  const DB = env.DB;
  const stmts = [
    // Create the visit on first contact. A sid can never move to another prospect.
    DB.prepare(`INSERT INTO visits (sid, prospect_id, started_at, last_at, ip_hash, country, city, device, os, browser, ua)
                VALUES (?,?,?,?,?,?,?,?,?,?,?)
                ON CONFLICT(sid) DO UPDATE SET last_at = excluded.last_at WHERE visits.prospect_id = excluded.prospect_id`)
      .bind(sid, pid, at, at, info.ipHash, info.country, info.city, info.device, info.os, info.browser, info.ua)
  ];
  const where = 'WHERE sid = ? AND prospect_id = ?';
  const num = v => Math.max(0, Math.min(Number(v) || 0, 1e9));
  const str = (v, n = 120) => (v == null ? null : String(v).slice(0, n));

  for (const ev of body.events.slice(0, MAX_EVENTS)) {
    if (!ev || !TYPES.has(ev.type)) continue;
    const d = ev.data && typeof ev.data === 'object' ? ev.data : {};
    const clientAt = Number.isFinite(ev.at) && Math.abs(ev.at - Date.now()) < 864e5 ? new Date(ev.at).toISOString() : null;
    let data = JSON.stringify(d);
    if (data.length > 1000) data = '{}';

    switch (ev.type) {
      case 'heartbeat':   // time on page: only the visit total, no event row
        stmts.push(DB.prepare(`UPDATE visits SET active_ms = MAX(active_ms, ?) ${where}`).bind(num(d.activeMs), sid, pid));
        continue;
      case 'human_open':
        stmts.push(DB.prepare(`UPDATE visits SET human = 1, human_at = COALESCE(human_at, ?), referrer = ?, lang = ?, tz = ?, screen = ? ${where}`)
          .bind(at, str(d.referrer, 300), str(d.lang, 20), str(d.tz, 60), str(d.screen, 20), sid, pid));
        break;
      case 'scroll_depth':
        stmts.push(DB.prepare(`UPDATE visits SET max_scroll = MAX(max_scroll, ?) ${where}`).bind(Math.min(100, num(d.pct)), sid, pid));
        break;
      case 'video_progress':
        stmts.push(DB.prepare(`UPDATE visits SET video_max_pct = MAX(video_max_pct, ?) ${where}`).bind(Math.min(100, num(d.pct)), sid, pid));
        break;
    }
    stmts.push(DB.prepare('INSERT INTO events (sid, prospect_id, type, data, client_at, at) VALUES (?,?,?,?,?,?)')
      .bind(sid, pid, ev.type, data, clientAt, at));
  }

  await DB.batch(stmts);
  return new Response(null, { status: 204 });
}
