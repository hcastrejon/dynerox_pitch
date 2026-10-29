-- Dynerox investor room: phase 1 schema.

-- One row per person you send a link to.
CREATE TABLE prospects (
  id          INTEGER PRIMARY KEY,
  code        TEXT    NOT NULL UNIQUE,          -- 10 random characters, the link is /p/<code>
  name        TEXT    NOT NULL,
  company     TEXT,
  notes       TEXT,
  created_at  TEXT    NOT NULL,
  active      INTEGER NOT NULL DEFAULT 1,       -- 0 = revoked, the link returns 404
  revoked_at  TEXT
);

-- A browser session that ran the page's JavaScript (one per page load).
-- human = 1 only after a real signal: scroll or input at least 1.2 s after load.
CREATE TABLE visits (
  sid           TEXT    PRIMARY KEY,
  prospect_id   INTEGER NOT NULL REFERENCES prospects(id),
  started_at    TEXT    NOT NULL,
  last_at       TEXT    NOT NULL,
  human         INTEGER NOT NULL DEFAULT 0,
  human_at      TEXT,
  ip_hash       TEXT,                           -- salted SHA-256, never the IP itself
  country       TEXT,
  city          TEXT,
  device        TEXT,
  os            TEXT,
  browser       TEXT,
  ua            TEXT,
  referrer      TEXT,
  lang          TEXT,
  tz            TEXT,
  screen        TEXT,
  active_ms     INTEGER NOT NULL DEFAULT 0,
  max_scroll    INTEGER NOT NULL DEFAULT 0,
  video_max_pct INTEGER NOT NULL DEFAULT 0
);
CREATE INDEX idx_visits_prospect ON visits(prospect_id, human);

-- Things a visitor did: sections viewed, slides, video, clicks.
CREATE TABLE events (
  id          INTEGER PRIMARY KEY,
  sid         TEXT    NOT NULL,
  prospect_id INTEGER NOT NULL REFERENCES prospects(id),
  type        TEXT    NOT NULL,
  data        TEXT,                             -- small JSON object
  client_at   TEXT,
  at          TEXT    NOT NULL
);
CREATE INDEX idx_events_prospect ON events(prospect_id, type);
CREATE INDEX idx_events_sid ON events(sid);

-- Server-side page requests from browsers (before we know if a person is there).
CREATE TABLE page_loads (
  id          INTEGER PRIMARY KEY,
  prospect_id INTEGER NOT NULL REFERENCES prospects(id),
  at          TEXT    NOT NULL,
  ip_hash     TEXT,
  country     TEXT,
  city        TEXT,
  device      TEXT,
  os          TEXT,
  browser     TEXT,
  ua          TEXT,
  referrer    TEXT
);
CREATE INDEX idx_loads_prospect ON page_loads(prospect_id);

-- Link previews and bots (WhatsApp, Slack, LinkedIn, mail scanners...). Kept apart.
CREATE TABLE bot_hits (
  id          INTEGER PRIMARY KEY,
  prospect_id INTEGER NOT NULL REFERENCES prospects(id),
  at          TEXT    NOT NULL,
  method      TEXT,
  bot_name    TEXT,
  ip_hash     TEXT,
  country     TEXT,
  ua          TEXT
);
CREATE INDEX idx_bots_prospect ON bot_hits(prospect_id);
