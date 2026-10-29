// Runs for every request that reaches Functions (see public/_routes.json).
// Static files get the same headers from public/_headers.
const SECURITY_HEADERS = {
  'X-Robots-Tag': 'noindex, nofollow, noarchive, nosnippet',
  'Referrer-Policy': 'strict-origin',          // links out never carry /p/<code>
  'X-Content-Type-Options': 'nosniff',
  'X-Frame-Options': 'DENY',
  'Permissions-Policy': 'camera=(), microphone=(), geolocation=()'
};

export async function onRequest(context) {
  const url = new URL(context.request.url);

  // The page template is read by /p/<code> only; never served directly.
  if (url.pathname.startsWith('/_tpl/')) {
    return new Response('Not found', { status: 404, headers: SECURITY_HEADERS });
  }

  let res;
  try {
    res = await context.next();
  } catch (err) {
    console.error(err);
    res = new Response('Something went wrong. Please try again in a minute.', { status: 500 });
  }
  res = new Response(res.body, res);
  for (const [k, v] of Object.entries(SECURITY_HEADERS)) res.headers.set(k, v);
  return res;
}
