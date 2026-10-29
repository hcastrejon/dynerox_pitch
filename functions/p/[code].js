// GET /p/<code>  The investor page for one prospect.
import { requireLevel } from '../../src/lib/auth.js';
import { botName, clientInfo, nowIso } from '../../src/lib/request.js';

export async function onRequest(context) {
  const { request, env, params } = context;
  if (request.method !== 'GET' && request.method !== 'HEAD') {
    return new Response('Method not allowed', { status: 405, headers: { allow: 'GET, HEAD' } });
  }

  const access = await requireLevel(context, 'prospect', { code: params.code });
  if (!access.ok) return notFound();
  const { prospect } = access;

  const info = await clientInfo(request, env);
  const bot = botName(info.ua) || (request.method === 'HEAD' ? 'head-request' : null);
  const at = nowIso();

  // Log without making the visitor wait.
  context.waitUntil((bot
    ? env.DB.prepare('INSERT INTO bot_hits (prospect_id, at, method, bot_name, ip_hash, country, ua) VALUES (?,?,?,?,?,?,?)')
        .bind(prospect.id, at, request.method, bot, info.ipHash, info.country, info.ua)
    : env.DB.prepare('INSERT INTO page_loads (prospect_id, at, ip_hash, country, city, device, os, browser, ua, referrer) VALUES (?,?,?,?,?,?,?,?,?,?)')
        .bind(prospect.id, at, info.ipHash, info.country, info.city, info.device, info.os, info.browser, info.ua, info.referrer)
  ).run().catch(err => console.error('log failed', err)));

  const tpl = await env.ASSETS.fetch(new URL('/_tpl/pitch.tpl', request.url));
  if (!tpl.ok) return new Response('Template missing', { status: 500 });
  const siteUrl = (env.SITE_URL || new URL(request.url).origin).replace(/\/$/, '');

  const boot = {
    code: prospect.code,
    videoUrl: env.VIDEO_URL || '',
    prospect: env.SHOW_PROSPECT_NAME === 'true' ? prospect.name : null
  };
  const inject = `<script>window.__DR__=${JSON.stringify(boot).replace(/</g, '\\u003c')};</script>`;
  const html = (await tpl.text())
    .replace('<!--DR_INJECT-->', inject)
    .replaceAll('%%SITE_URL%%', siteUrl);

  return new Response(request.method === 'HEAD' ? null : html, {
    headers: { 'content-type': 'text/html; charset=utf-8', 'cache-control': 'private, no-store' }
  });
}

function notFound() {
  return new Response(`<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Link not available</title><meta name="robots" content="noindex">
<style>body{margin:0;min-height:100vh;display:grid;place-items:center;background:#061021;color:#fff;font:16px/1.5 system-ui,-apple-system,sans-serif;padding:24px}
main{max-width:420px}h1{font-size:28px;letter-spacing:-.03em;margin:0 0 12px}a{color:#00bc0a}</style></head>
<body><main><h1>This link is not available.</h1><p>It may have expired or been mistyped. For access, write to <a href="mailto:partnerships@dynerox.com">partnerships@dynerox.com</a>.</p></main></body></html>`,
    { status: 404, headers: { 'content-type': 'text/html; charset=utf-8', 'cache-control': 'no-store' } });
}
