// Serves the pitch page for a prospect (or the "no code" row) and logs the request.
import { botName, clientInfo, nowIso, PUBLIC_CODE } from './request.js';

export async function servePitch(context, prospect) {
  const { request, env } = context;
  if (request.method !== 'GET' && request.method !== 'HEAD') {
    return new Response('Method not allowed', { status: 405, headers: { allow: 'GET, HEAD' } });
  }

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
    prospect: env.SHOW_PROSPECT_NAME === 'true' && prospect.code !== PUBLIC_CODE ? prospect.name : null
  };
  const inject = `<script>window.__DR__=${JSON.stringify(boot).replace(/</g, '\\u003c')};</script>`;
  const html = (await tpl.text())
    .replace('<!--DR_INJECT-->', inject)
    .replaceAll('%%SITE_URL%%', siteUrl);

  return new Response(request.method === 'HEAD' ? null : html, {
    headers: { 'content-type': 'text/html; charset=utf-8', 'cache-control': 'private, no-store' }
  });
}

const shell = (title, h1, body, status) => new Response(`<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>${title}</title><meta name="robots" content="noindex"><link rel="icon" href="/favicon.svg" type="image/svg+xml">
<style>body{margin:0;min-height:100vh;min-height:100dvh;display:grid;place-items:center;background:#061021;color:#fff;font:16px/1.55 Inter,system-ui,-apple-system,sans-serif;padding:24px max(20px,env(safe-area-inset-right)) 24px max(20px,env(safe-area-inset-left))}
main{max-width:440px}img{width:140px;height:auto;display:block;margin-bottom:32px}h1{font-size:28px;line-height:1.1;letter-spacing:-.04em;margin:0 0 12px}p{color:rgba(255,255,255,.68);margin:0}a{color:#00bc0a}</style></head>
<body><main><img src="/img/logo-light.webp" alt="Dynerox" width="140" height="32"><h1>${h1}</h1><p>${body}</p></main></body></html>`,
  { status, headers: { 'content-type': 'text/html; charset=utf-8', 'cache-control': 'no-store' } });

export const notFound = () => shell('Link not available', 'This link is not available.',
  'It may have expired or been mistyped. For access, write to <a href="mailto:partnerships@dynerox.com">partnerships@dynerox.com</a>.', 404);

export const invitationOnly = () => shell('Dynerox Investor Room', 'The Dynerox investor room is shared by invitation.',
  'If you received a personal link, open that link. To request access, write to <a href="mailto:partnerships@dynerox.com">partnerships@dynerox.com</a> or visit <a href="https://dynerox.com/">dynerox.com</a>.', 200);
