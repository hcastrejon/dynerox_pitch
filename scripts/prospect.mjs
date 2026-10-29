#!/usr/bin/env node
// Create, list and revoke prospect links from your computer.
// Uses Wrangler against the remote D1 database (run `npx wrangler login` once).
//
//   npm run prospect -- add "Jane Doe" "Acme Ventures" "Met at Stablecoin Conference"
//   npm run prospect -- list
//   npm run prospect -- revoke <code>
//   npm run prospect -- activate <code>
//
// Add --local to work against the local development database instead.
import { execFileSync } from 'node:child_process';
import { readFileSync } from 'node:fs';
import { randomInt } from 'node:crypto';

const args = process.argv.slice(2);
const local = args.includes('--local');
const [cmd, ...rest] = args.filter(a => a !== '--local');

const toml = readFileSync(new URL('../wrangler.toml', import.meta.url), 'utf8');
const DB_NAME = (toml.match(/database_name\s*=\s*"([^"]+)"/) || [])[1] || 'dynerox-dataroom';
const SITE_URL = ((toml.match(/SITE_URL\s*=\s*"([^"]+)"/) || [])[1] || 'https://pitchdeck.dynerox.com').replace(/\/$/, '');

const q = v => (v == null || v === '' ? 'NULL' : `'${String(v).replace(/'/g, "''")}'`);

function sql(command) {
  const out = execFileSync('npx', ['wrangler', 'd1', 'execute', DB_NAME, local ? '--local' : '--remote', '--json', '--command', command],
    { encoding: 'utf8', stdio: ['ignore', 'pipe', 'inherit'] });
  const parsed = JSON.parse(out.slice(out.indexOf('[')));
  return parsed[0]?.results || [];
}

function newCode(len = 10) {
  const A = 'abcdefghjkmnpqrstuvwxyz23456789';
  return Array.from({ length: len }, () => A[randomInt(A.length)]).join('');
}

switch (cmd) {
  case 'add': {
    const [name, company, notes] = rest;
    if (!name) { console.error('Usage: npm run prospect -- add "Name" ["Company"] ["Notes"]'); process.exit(1); }
    const code = newCode();
    sql(`INSERT INTO prospects (code, name, company, notes, created_at) VALUES (${q(code)}, ${q(name)}, ${q(company)}, ${q(notes)}, ${q(new Date().toISOString())})`);
    console.log(`\n${name}${company ? ' · ' + company : ''}\n${SITE_URL}/p/${code}\n`);
    break;
  }
  case 'list': {
    const rows = sql(`SELECT p.code, p.name, p.company, p.active,
      (SELECT COUNT(*) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS opens,
      (SELECT MAX(v.human_at) FROM visits v WHERE v.prospect_id = p.id AND v.human = 1) AS last_open
      FROM prospects p ORDER BY p.id DESC`);
    console.table(rows.map(r => ({ name: r.name, company: r.company || '', opens: r.opens, last_open: r.last_open || '', status: r.active ? 'active' : 'revoked', link: `${SITE_URL}/p/${r.code}` })));
    break;
  }
  case 'revoke':
  case 'activate': {
    const code = rest[0];
    if (!code) { console.error(`Usage: npm run prospect -- ${cmd} <code>`); process.exit(1); }
    const on = cmd === 'activate';
    sql(`UPDATE prospects SET active = ${on ? 1 : 0}, revoked_at = ${on ? 'NULL' : q(new Date().toISOString())} WHERE code = ${q(code)}`);
    console.log(`${code}: ${on ? 'active' : 'revoked'}`);
    break;
  }
  default:
    console.log('Commands: add "Name" ["Company"] ["Notes"] | list | revoke <code> | activate <code>   (add --local for the dev database)');
}
