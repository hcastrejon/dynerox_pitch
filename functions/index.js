// GET /  The page without a code (QR codes, the general link).
// Visits are counted under the "Sin código" row in the panel.
// Revoking that row in the panel turns this off: / then shows the "by invitation" page.
import { requireLevel } from '../src/lib/auth.js';
import { servePitch, invitationOnly } from '../src/lib/page.js';

export async function onRequest(context) {
  const access = await requireLevel(context, 'public');
  if (!access.ok) return invitationOnly();
  return servePitch(context, access.prospect);
}
