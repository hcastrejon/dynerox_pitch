// Builds public/_tpl/pitch.tpl from src/page/page.html.
// page.html is the same file used for the Claude artifact preview (a body fragment with
// relative asset paths). This script wraps it in a full HTML document, adds the social
// preview tags and makes asset paths absolute so they work under /p/<code>.
//
// Run after editing the page:  npm run build:template
import { readFileSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const src = readFileSync(join(root, 'src/page/page.html'), 'utf8');

const splitAt = src.indexOf('</style>') + '</style>'.length;
let head = src.slice(0, splitAt);
let body = src.slice(splitAt);

const absolutize = s => s
  .replaceAll('src="slides/', 'src="/slides/')
  .replaceAll('src="img/', 'src="/img/')
  .replaceAll("'slides/slide-", "'/slides/slide-");

head = absolutize(head);
body = absolutize(body);

const social = `
<meta property="og:type" content="website">
<meta property="og:site_name" content="Dynerox">
<meta property="og:title" content="Dynerox · Investor pitch">
<meta property="og:description" content="The banking and compliance layer for decentralized businesses.">
<meta property="og:image" content="%%SITE_URL%%/slides/slide-01.webp">
<meta name="twitter:card" content="summary_large_image">
<link rel="icon" href="/favicon.svg" type="image/svg+xml">`;

const out = `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
${head.trim()}
${social}
<!--DR_INJECT-->
</head>
<body>
${body.trim()}
</body>
</html>
`;

writeFileSync(join(root, 'public/_tpl/pitch.tpl'), out);
console.log('Wrote public/_tpl/pitch.tpl (' + out.length + ' bytes)');
