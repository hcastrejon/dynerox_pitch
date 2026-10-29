// GET /p/<code>  The investor page for one prospect.
import { requireLevel } from '../../src/lib/auth.js';
import { servePitch, notFound } from '../../src/lib/page.js';

export async function onRequest(context) {
  const access = await requireLevel(context, 'prospect', { code: context.params.code });
  if (!access.ok) return notFound();
  return servePitch(context, access.prospect);
}
