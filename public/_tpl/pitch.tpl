<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>Dynerox Investor Room</title>
<meta name="claude:viewport-fit-sides" content="cover">
<meta name="robots" content="noindex, nofollow, noarchive, nosnippet, noimageindex">
<meta name="description" content="Dynerox investor pitch.">
<meta name="theme-color" content="#061021">
<meta name="format-detection" content="telephone=no">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Geist+Mono:wght@500;600&display=swap">
<style>
/* Layout: dark navy bands alternate with cream bands, like dynerox.com; one green band carries traction.
   The page follows the order of the spoken pitch. Single brand theme on purpose. */
:root {
  --navy: #061021;
  --navy-0: #040a16;
  --navy-2: #0c1a33;
  --navy-3: #13244a;
  --cream: #f7f7f2;
  --green: #00bc0a;
  --green-ink: #0b7a16;
  --green-band: #3fb63a;
  --blue: #00a8e8;
  --amber: #f2c94c;
  --ink: #061021;
  --ink-2: #445066;
  --on-dark: #ffffff;
  --on-dark-2: rgba(255,255,255,.68);
  --on-dark-3: rgba(255,255,255,.44);
  --line-dark: rgba(255,255,255,.10);
  --line-light: rgba(6,16,33,.10);
  --chip: #262b33;
  --font-display: "Inter", system-ui, -apple-system, "Segoe UI", sans-serif;
  --font-body: "Inter", system-ui, -apple-system, "Segoe UI", sans-serif;
  --font-mono: "Geist Mono", ui-monospace, "SFMono-Regular", Menlo, monospace;
  --r-btn: 14px;
  --r-card: 18px;
  --wrap: 1120px;
  --nav-h: 68px;
  color-scheme: dark;
}
* { box-sizing: border-box; }
[hidden] { display: none !important; }
html { -webkit-text-size-adjust: 100%; text-size-adjust: 100%; overflow-x: clip; }
body {
  background: var(--navy);
  color: var(--on-dark);
  font-family: var(--font-body);
  font-size: 16px;
  line-height: 1.55;
  -webkit-font-smoothing: antialiased;
  overflow-x: clip;
  -webkit-tap-highlight-color: transparent;
}
body::before { content: ""; position: fixed; inset: 0 0 auto; height: env(safe-area-inset-top, 0px); z-index: 60; background: var(--navy); }
h1, h2, h3 { font-family: var(--font-display); font-weight: 700; letter-spacing: -0.045em; line-height: 1.04; margin: 0; text-wrap: balance; }
p { margin: 0; }
a { color: inherit; }
img { max-width: 100%; display: block; }
button { font: inherit; color: inherit; }
:focus-visible { outline: 2px solid var(--blue); outline-offset: 3px; border-radius: 6px; }
section[id] { scroll-margin-top: calc(var(--nav-h) + env(safe-area-inset-top, 0px)); }

.wrap {
  width: 100%;
  max-width: calc(var(--wrap) + 64px);
  margin: 0 auto;
  padding-left: max(16px, env(safe-area-inset-left, 0px));
  padding-right: max(16px, env(safe-area-inset-right, 0px));
}
@media (min-width: 720px) { .wrap { padding-left: max(32px, env(safe-area-inset-left, 0px)); padding-right: max(32px, env(safe-area-inset-right, 0px)); } }

.band { position: relative; padding-block: clamp(72px, 10vw, 128px); overflow: hidden; }
.band--cream { background: var(--cream); color: var(--ink); }
.band--navy { background: var(--navy); color: var(--on-dark); }
.band--green { background: var(--green-band); color: var(--on-dark); }

.eyebrow {
  font-family: var(--font-mono); font-size: 12px; font-weight: 600; letter-spacing: .12em; text-transform: uppercase;
  color: var(--green); display: inline-flex; align-items: center; gap: 10px;
}
.band--cream .eyebrow { color: var(--green-ink); }
.eyebrow::before { content: ""; width: 22px; height: 2px; background: currentColor; border-radius: 2px; flex: none; }
.h-section { font-size: clamp(32px, 5.2vw, 60px); margin-top: 18px; max-width: 18ch; }
.lede { font-size: clamp(17px, 1.6vw, 20px); color: var(--on-dark-2); max-width: 58ch; margin-top: 20px; }
.band--cream .lede { color: var(--ink-2); }

/* Spoken line: what Hugo said on stage, attached to each section */
.said { display: flex; gap: 14px; align-items: flex-start; margin-top: 28px; max-width: 760px; }
.said img { width: 36px; height: 36px; border-radius: 50%; object-fit: cover; flex: none; margin-top: 2px; box-shadow: 0 0 0 2px var(--green); }
.said p { font-size: clamp(17px, 1.7vw, 20px); line-height: 1.5; font-style: italic; color: var(--on-dark-2); }
.said p::before { content: "“"; } .said p::after { content: "”"; }
.band--cream .said p { color: var(--ink-2); }

/* Buttons, same family as dynerox.com */
.btn {
  display: inline-flex; align-items: center; justify-content: center; gap: 10px;
  min-height: 52px; padding: 0 26px; border-radius: var(--r-btn);
  font: 600 15px/1 var(--font-body); text-decoration: none; cursor: pointer; border: 0;
  transition: transform .2s ease, box-shadow .2s ease, background .2s ease;
  touch-action: manipulation;
}
.btn svg { width: 16px; height: 16px; flex: none; }
.btn--green { background: var(--green); color: #fff; box-shadow: 0 0 18px rgba(0,188,10,.28); }
.btn--green:hover { transform: translateY(-2px); box-shadow: 0 0 28px rgba(0,188,10,.45); }
.btn--ghost { background: rgba(255,255,255,.06); color: #fff; box-shadow: inset 0 0 0 1px var(--line-dark); }
.btn--ghost:hover { background: rgba(255,255,255,.12); }
.btn--ink { background: var(--navy); color: #fff; }

/* Nav */
.nav {
  position: sticky; top: env(safe-area-inset-top, 0px); z-index: 50;
  background: rgba(6,16,33,.94);
  -webkit-backdrop-filter: saturate(140%) blur(14px);
  backdrop-filter: saturate(140%) blur(14px);
  border-bottom: 1px solid var(--line-dark);
}
.nav__in { display: flex; align-items: center; justify-content: space-between; gap: 12px; height: var(--nav-h); }
.nav__logo { display: flex; align-items: center; min-height: 44px; }
.nav__logo img { height: 24px; width: auto; }
.nav__links { display: none; gap: 26px; font-size: 14px; font-weight: 500; color: var(--on-dark-2); }
.nav__links a { text-decoration: none; transition: color .2s; }
.nav__links a:hover { color: #fff; }
.nav .btn { min-height: 44px; padding: 0 18px; font-size: 14px; }
@media (min-width: 960px) { .nav__links { display: flex; } }

/* Hero */
.hero { position: relative; overflow: hidden; padding-block: clamp(76px, 12vw, 160px) clamp(64px, 9vw, 116px); isolation: isolate; }
.hero::before {
  content: ""; position: absolute; inset: -20% -10% auto; height: 120%; z-index: -2;
  background:
    radial-gradient(48% 40% at 20% 10%, rgba(0,168,232,.16), transparent 70%),
    radial-gradient(40% 36% at 85% 30%, rgba(0,188,10,.12), transparent 70%);
}
.hero__inner { position: relative; z-index: 2; text-align: center; display: flex; flex-direction: column; align-items: center; }
.hero h1 { font-size: clamp(38px, 7.4vw, 88px); letter-spacing: -0.055em; max-width: 15ch; margin-top: 22px; }
.hero h1 .accent { color: var(--green); }
.hero .lede { margin-inline: auto; text-align: center; }
.hero__ctas { display: flex; flex-wrap: wrap; gap: 12px; justify-content: center; margin-top: 36px; }
.hero__note { margin-top: 14px; font: 500 12px/1.4 var(--font-mono); letter-spacing: .06em; color: var(--on-dark-3); text-transform: uppercase; }
.hero__proof { margin-top: 48px; display: flex; flex-wrap: wrap; justify-content: center; gap: 10px 12px; font-size: 13px; color: var(--on-dark-2); }
.hero__proof span { display: inline-flex; align-items: center; gap: 8px; padding: 8px 14px; border-radius: 999px; background: rgba(255,255,255,.05); box-shadow: inset 0 0 0 1px var(--line-dark); }
.hero__proof span::before { content: ""; width: 7px; height: 7px; border-radius: 50%; background: var(--green); box-shadow: 0 0 10px var(--green); flex: none; }
.prepared { font-family: var(--font-mono); font-size: 12px; letter-spacing: .08em; color: var(--on-dark-3); margin-top: 18px; text-transform: uppercase; }
@media (max-width: 479px) { .hero__ctas .btn { width: 100%; } .hero__ctas { width: 100%; max-width: 340px; } }

/* Floating brand shapes */
.float-field { position: absolute; inset: 0; z-index: 1; pointer-events: none; }
.fl { position: absolute; will-change: transform; }
.fl__inner { animation: drift var(--dur, 8s) ease-in-out var(--delay, 0s) infinite alternate; }
.fl svg { display: block; overflow: visible; }
@keyframes drift {
  from { transform: translate3d(0, -8px, 0) rotate(var(--r, 0deg)); }
  to   { transform: translate3d(0, 10px, 0) rotate(calc(var(--r, 0deg) + 6deg)); }
}
@media (max-width: 719px) { .fl[data-hide-sm] { display: none; } .fl { opacity: .7; } }

/* Video */
.video-card { margin-top: 40px; border-radius: 22px; overflow: hidden; background: #000; box-shadow: 0 30px 80px rgba(0,0,0,.45), inset 0 0 0 1px var(--line-dark); aspect-ratio: 16 / 9; max-width: 100%; }
.video-card iframe, .video-card > div { width: 100%; height: 100%; border: 0; display: block; }

/* Problem */
.grid-3 { display: grid; gap: 16px; margin-top: 44px; grid-template-columns: 1fr; }
@media (min-width: 820px) { .grid-3 { grid-template-columns: repeat(3, 1fr); } }
.pcard { border-radius: var(--r-card); padding: 28px 26px 30px; background: #fff; box-shadow: inset 0 0 0 1px var(--line-light); display: flex; flex-direction: column; gap: 10px; min-width: 0; }
.pcard__big { font: 700 clamp(32px, 4vw, 48px)/1 var(--font-display); letter-spacing: -0.05em; }
.pcard__small { color: var(--ink-2); font-size: 16px; }
.pcard--dark { background: var(--navy); color: #fff; box-shadow: none; }
.pcard--dark .pcard__big { color: var(--green); }
.pcard--dark .pcard__small { color: var(--on-dark-2); }
.kicker { margin-top: 40px; font: 700 clamp(22px, 2.6vw, 30px)/1.2 var(--font-display); letter-spacing: -0.035em; }
.kicker em { font-style: normal; color: var(--green-ink); }

/* Traction */
.band--green .eyebrow { color: #fff; }
.band--green .said p { color: rgba(255,255,255,.88); }
.band--green .said img { box-shadow: 0 0 0 2px #fff; }
.traction__head { font-size: clamp(34px, 6vw, 72px); max-width: 17ch; margin-top: 18px; }
.facts { display: grid; gap: 14px; margin-top: 44px; grid-template-columns: 1fr; position: relative; z-index: 2; }
@media (min-width: 820px) { .facts { grid-template-columns: repeat(3, 1fr); } }
.fact { background: rgba(6,16,33,.92); border-radius: var(--r-card); padding: 26px 24px 28px; min-width: 0; }
.fact__label { font-family: var(--font-mono); font-size: 11px; letter-spacing: .1em; text-transform: uppercase; color: var(--on-dark-3); }
.fact__value { font: 700 clamp(26px, 2.8vw, 34px)/1.1 var(--font-display); letter-spacing: -0.04em; margin-top: 12px; }
.fact__who { margin-top: 10px; color: var(--on-dark-2); font-size: 15px; }
.fact__who b { color: #fff; font-weight: 600; }
.traction__tag { margin-top: 40px; font: 700 clamp(22px, 2.4vw, 28px)/1 var(--font-display); letter-spacing: -0.03em; }
.band--green .deco { position: absolute; pointer-events: none; opacity: .28; }

/* How it works: route */
.route {
  margin-top: 48px; position: relative; border-radius: 26px; padding: 26px 18px; background: #fff;
  box-shadow: inset 0 0 0 1px var(--line-light), 0 30px 60px rgba(6,16,33,.06);
  display: grid; gap: 18px; align-items: center; grid-template-columns: 1fr;
}
@media (min-width: 820px) { .route { grid-template-columns: 170px 1fr 170px; padding: 36px 32px; } }
.node { display: flex; flex-direction: column; align-items: center; text-align: center; gap: 6px; }
.node__icon { width: 56px; height: 56px; border-radius: 16px; background: var(--cream); display: grid; place-items: center; box-shadow: inset 0 0 0 1px var(--line-light); }
.node__icon svg { width: 26px; height: 26px; }
.node b { font-size: 15px; }
.node small { color: var(--ink-2); font-size: 13px; }
.pipe { position: relative; min-width: 0; }
.pipe__tube { position: relative; height: 72px; border-radius: 999px; background: var(--navy); overflow: hidden; box-shadow: inset 0 0 0 1px rgba(255,255,255,.08), 0 14px 30px rgba(6,16,33,.18); }
.pipe__lane { position: absolute; left: 0; right: 0; height: 12px; background-repeat: repeat-x; background-size: 26px 12px; }
.pipe__lane--a { top: 14px; animation: lane 1.6s linear infinite; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='26' height='12'%3E%3Cpath d='M6 1l6 5-6 5' fill='none' stroke='%2300bc0a' stroke-width='2.4' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E"); }
.pipe__lane--b { top: 30px; animation: lane-r 2.1s linear infinite; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='26' height='12'%3E%3Cpath d='M14 1L8 6l6 5' fill='none' stroke='%2300a8e8' stroke-width='2.4' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E"); }
.pipe__lane--c { top: 46px; animation: lane 2.6s linear infinite; background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='26' height='12'%3E%3Cpath d='M6 1l6 5-6 5' fill='none' stroke='%23f2c94c' stroke-width='2.4' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E"); }
@keyframes lane { from { background-position: 0 0; } to { background-position: 26px 0; } }
@keyframes lane-r { from { background-position: 26px 0; } to { background-position: 0 0; } }
.pipe__name { position: absolute; inset: 0; display: grid; place-items: center; font: 700 13px/1 var(--font-mono); letter-spacing: .32em; color: #fff; }
.pipe__name span { background: var(--navy); padding: 6px 12px; border-radius: 8px; box-shadow: 0 0 0 1px rgba(255,255,255,.14); }
.carry { display: flex; flex-wrap: wrap; gap: 8px; justify-content: center; margin-top: 16px; }
.carry span { display: inline-flex; align-items: center; gap: 8px; font-size: 13px; font-weight: 600; padding: 8px 14px; border-radius: 999px; background: var(--cream); box-shadow: inset 0 0 0 1px var(--line-light); }
.carry span i { width: 8px; height: 8px; border-radius: 50%; background: var(--c); }
.steps { display: grid; gap: 16px; margin-top: 20px; grid-template-columns: 1fr; }
@media (min-width: 820px) { .steps { grid-template-columns: repeat(3, 1fr); } }
.step { padding: 24px 4px 0; border-top: 1px solid var(--line-light); min-width: 0; }
.step__n { font: 600 13px/1 var(--font-mono); color: var(--green-ink); }
.step h3 { font-size: 22px; letter-spacing: -0.03em; margin-top: 12px; }
.step p { color: var(--ink-2); margin-top: 8px; font-size: 15px; }

/* Routes compose: ramp, cross-border, network */
.routes-head { margin-top: 72px; font: 700 clamp(24px, 3vw, 36px)/1.1 var(--font-display); letter-spacing: -0.04em; max-width: 24ch; }
.routes { display: grid; gap: 14px; margin-top: 28px; grid-template-columns: 1fr; }
@media (min-width: 820px) { .routes { grid-template-columns: repeat(3, 1fr); } }
.rcard { background: #fff; border-radius: var(--r-card); padding: 18px 18px 20px; box-shadow: inset 0 0 0 1px var(--line-light); min-width: 0; color: var(--ink); transition: opacity .35s ease, transform .35s ease, box-shadow .35s ease; }
.rcard svg { width: 100%; height: auto; display: block; }
.rcard__k { font: 600 11px/1 var(--font-mono); letter-spacing: .1em; text-transform: uppercase; color: var(--ink-2); margin-top: 12px; }
.rcard__v { font: 700 20px/1.15 var(--font-display); letter-spacing: -0.03em; margin-top: 6px; }
.flow { stroke-dasharray: 3 7; animation: flow 1.1s linear infinite; }
@keyframes flow { to { stroke-dashoffset: -20; } }

/* Insight */
.insight { display: grid; gap: 48px; align-items: center; grid-template-columns: 1fr; }
@media (min-width: 960px) { .insight { grid-template-columns: 1.25fr .75fr; } }
.compare { display: grid; gap: 14px; margin-top: 36px; grid-template-columns: 1fr; }
@media (min-width: 600px) { .compare { grid-template-columns: 1fr 1fr; } }
.compare__item { border-radius: 16px; padding: 22px 22px 24px; background: var(--navy-2); min-width: 0; }
.compare__item--good { background: transparent; box-shadow: inset 0 0 0 1.5px var(--green); }
.compare__label { font-family: var(--font-mono); font-size: 11px; letter-spacing: .1em; text-transform: uppercase; color: var(--on-dark-3); }
.compare__item--good .compare__label { color: var(--green); }
.compare__title { font: 600 24px/1.2 var(--font-display); letter-spacing: -0.03em; margin-top: 8px; }
.compare__sub { color: var(--on-dark-2); font-size: 15px; margin-top: 4px; }
.checkouts { margin-top: 18px; display: flex; align-items: center; gap: 6px; flex-wrap: wrap; }
.checkouts span { font-family: var(--font-mono); font-size: 12px; padding: 7px 10px; border-radius: 8px; background: rgba(255,255,255,.06); color: var(--on-dark-2); }
.checkouts i { font-style: normal; color: var(--on-dark-3); font-family: var(--font-mono); font-size: 12px; }
.phone { width: min(300px, 100%); margin: 0 auto; border-radius: 40px; padding: 12px; background: #0b0f17; box-shadow: 0 40px 90px rgba(0,0,0,.5), inset 0 0 0 1px rgba(255,255,255,.08); }
.phone__screen { border-radius: 30px; background: #f2f3f5; color: var(--ink); padding: 18px 16px 20px; display: flex; flex-direction: column; gap: 14px; min-height: 440px; }
.phone__bar { display: flex; justify-content: space-between; font: 600 13px/1 var(--font-body); padding: 2px 6px 0; }
.notif { display: flex; gap: 10px; align-items: flex-start; background: #fff; border-radius: 16px; padding: 12px; box-shadow: 0 10px 24px rgba(6,16,33,.12); animation: notif 5.5s ease-in-out infinite; }
.notif__icon { width: 34px; height: 34px; border-radius: 9px; background: var(--navy); display: grid; place-items: center; flex: none; }
.notif__icon svg { width: 18px; height: 18px; }
.notif b { font-size: 14px; display: block; }
.notif span { font-size: 13px; color: var(--ink-2); }
@keyframes notif { 0%, 8% { transform: translateY(-14px); opacity: 0; } 16%, 82% { transform: none; opacity: 1; } 92%, 100% { transform: translateY(-14px); opacity: 0; } }
.tx { text-align: center; display: flex; flex-direction: column; align-items: center; gap: 6px; padding-top: 8px; }
.tx__check { width: 52px; height: 52px; border-radius: 50%; background: #1f8a3c; display: grid; place-items: center; }
.tx__check svg { width: 24px; height: 24px; }
.tx__amt { font: 700 34px/1 var(--font-display); letter-spacing: -0.04em; font-variant-numeric: tabular-nums; }
.tx__rows { background: #fff; border-radius: 14px; padding: 12px 14px; font-size: 13px; display: grid; gap: 8px; margin: 0; }
.tx__rows div { display: flex; justify-content: space-between; gap: 10px; }
.tx__rows dt { color: var(--ink-2); }
.tx__rows dd { margin: 0; font-weight: 600; }
.phone__cap { text-align: center; font-size: 12px; color: var(--on-dark-3); margin-top: 14px; }

/* Team */
.stats { display: flex; flex-wrap: wrap; gap: 18px 48px; margin-top: 36px; }
.stat b { font: 700 clamp(36px, 4.4vw, 52px)/1 var(--font-display); letter-spacing: -0.05em; color: var(--green); font-variant-numeric: tabular-nums; }
.stat span { display: block; color: var(--on-dark-2); font-size: 15px; margin-top: 6px; }
.team { display: grid; gap: 16px; margin-top: 44px; grid-template-columns: 1fr; }
@media (min-width: 820px) { .team { grid-template-columns: repeat(3, 1fr); } }
.person { position: relative; background: var(--navy-2); border-radius: var(--r-card); padding: 24px; display: flex; gap: 18px; align-items: flex-start; min-width: 0; box-shadow: inset 0 0 0 1px var(--line-dark); }
.person > img { width: 72px; height: 72px; border-radius: 50%; object-fit: cover; flex: none; box-shadow: 0 0 0 2px var(--navy), 0 0 0 3.5px var(--green); }
.person h3 { font-size: 20px; letter-spacing: -0.03em; padding-right: 44px; }
.person .role { font: 600 12px/1 var(--font-mono); letter-spacing: .08em; color: var(--green); text-transform: uppercase; margin-top: 8px; }
.person p { color: var(--on-dark-2); font-size: 15px; margin-top: 10px; }
.person__in { position: absolute; top: 16px; right: 16px; width: 44px; height: 44px; border-radius: 12px; background: rgba(255,255,255,.07); display: grid; place-items: center; transition: background .2s; }
.person__in:hover { background: #0a66c2; }
.person__in svg { width: 18px; height: 18px; }
.logos { margin-top: 44px; padding-top: 28px; border-top: 1px solid var(--line-dark); display: flex; flex-wrap: wrap; gap: 14px 34px; align-items: center; }
.logos small { font-family: var(--font-mono); font-size: 11px; letter-spacing: .1em; text-transform: uppercase; color: var(--on-dark-3); width: 100%; }
.logos span { font: 700 18px/1 var(--font-display); letter-spacing: -0.02em; color: var(--on-dark-2); }

/* Market + model */
.market { display: grid; gap: 40px; margin-top: 44px; grid-template-columns: 1fr; align-items: center; }
@media (min-width: 960px) { .market { grid-template-columns: 1.6fr .9fr; } }
.chart { background: #fff; border-radius: 22px; padding: 22px 16px 14px; box-shadow: inset 0 0 0 1px var(--line-light); position: relative; min-width: 0; margin: 0; }
.chart__title { font-weight: 700; font-size: 16px; padding-left: 6px; }
.chart__sub { color: var(--ink-2); font-size: 13px; padding-left: 6px; }
.chart svg { width: 100%; height: auto; display: block; margin-top: 8px; }
.chart .pt { cursor: pointer; }
.chart__tip { position: absolute; pointer-events: none; background: var(--navy); color: #fff; font-size: 13px; padding: 8px 10px; border-radius: 10px; transform: translate(-50%, -110%); white-space: nowrap; opacity: 0; transition: opacity .15s; }
.chart__note { font-size: 12px; color: var(--ink-2); padding: 8px 6px 0; }
.uses { list-style: none; padding: 0; margin: 0; display: grid; gap: 10px; }
.uses li { display: flex; align-items: center; justify-content: space-between; gap: 12px; padding: 18px 20px; border-radius: 14px; background: #fff; box-shadow: inset 0 0 0 1px var(--line-light); font: 600 19px/1.2 var(--font-display); letter-spacing: -0.02em; }
.uses li small { font: 500 12px/1 var(--font-mono); color: var(--ink-2); letter-spacing: .04em; text-align: right; }
.model { margin-top: 48px; border-radius: 24px; background: var(--navy); color: #fff; padding: clamp(26px, 4vw, 44px); display: grid; gap: 22px; grid-template-columns: 1fr; align-items: center; }
@media (min-width: 820px) { .model { grid-template-columns: 1.2fr 1fr; } }
.model h3 { font-size: clamp(26px, 3.2vw, 40px); letter-spacing: -0.045em; }
.model h3 span { color: var(--green); }
.model p { color: var(--on-dark-2); font-size: 16px; }

/* Deck viewer */
.deck { margin-top: 40px; }
.deck__stage { position: relative; border-radius: 20px; overflow: hidden; background: #fff; aspect-ratio: 16 / 9; max-width: 100%; box-shadow: 0 30px 70px rgba(6,16,33,.16), inset 0 0 0 1px var(--line-light); }
.deck__stage img { width: 100%; height: 100%; object-fit: contain; transition: opacity .25s ease; }
.deck__hot { position: absolute; left: 18.9%; top: 51%; width: 29.2%; height: 19.2%; border-radius: 12px; transition: box-shadow .2s; }
.deck__hot:hover, .deck__hot:focus-visible { box-shadow: 0 0 0 3px var(--green), 0 0 26px rgba(0,188,10,.5); }
.deck__bar { display: flex; align-items: center; justify-content: space-between; gap: 12px; margin-top: 16px; flex-wrap: wrap; }
.deck__count { font: 600 14px/1 var(--font-mono); color: var(--ink-2); font-variant-numeric: tabular-nums; }
.deck__count b { color: var(--ink); }
.deck__nav { display: flex; gap: 8px; }
.icon-btn { width: 46px; height: 46px; border-radius: 12px; border: 0; cursor: pointer; display: grid; place-items: center; background: var(--navy); color: #fff; transition: transform .15s; touch-action: manipulation; }
.icon-btn:hover:not(:disabled) { transform: translateY(-2px); }
.icon-btn:disabled { opacity: .3; cursor: default; }
.icon-btn svg { width: 18px; height: 18px; }
.thumbs { display: flex; gap: 10px; overflow-x: auto; padding: 14px 2px 6px; scrollbar-width: thin; -webkit-overflow-scrolling: touch; }
.thumbs button { flex: none; width: 132px; aspect-ratio: 16 / 9; border-radius: 10px; overflow: hidden; border: 0; padding: 0; cursor: pointer; background: #fff; box-shadow: inset 0 0 0 1px var(--line-light); opacity: .55; transition: opacity .2s, box-shadow .2s; }
.thumbs button img { width: 100%; height: 100%; object-fit: cover; }
.thumbs button[aria-current="true"] { opacity: 1; box-shadow: 0 0 0 2.5px var(--green); }
.thumbs button:hover { opacity: 1; }

/* Contact */
.contact { display: grid; gap: 44px; grid-template-columns: 1fr; align-items: start; }
@media (min-width: 960px) { .contact { grid-template-columns: 1.1fr .9fr; } }
.contact h2 { font-size: clamp(34px, 6vw, 68px); letter-spacing: -0.055em; }
.contact h2 span { color: var(--green); }
.clist { display: grid; gap: 10px; min-width: 0; }
.clist__label { font-family: var(--font-mono); font-size: 11px; letter-spacing: .1em; text-transform: uppercase; color: var(--on-dark-3); margin-top: 12px; }
.crow { display: flex; align-items: center; gap: 14px; min-height: 62px; padding: 10px 12px 10px 18px; border-radius: 15px; background: var(--chip); color: #fff; text-decoration: none; min-width: 0; transition: filter .2s, transform .2s; }
a.crow:hover { filter: brightness(1.1); transform: translateY(-1px); }
.crow--wa { background: #00a80c; }
.crow--tg { background: #1196c7; }
.crow--in { background: #0a66c2; }
.crow__icon { width: 22px; height: 22px; flex: none; display: grid; place-items: center; }
.crow__icon svg { width: 20px; height: 20px; }
.crow__txt { display: flex; flex-direction: column; min-width: 0; flex: 1; }
.crow__txt b { font-size: 16px; font-weight: 600; overflow-wrap: anywhere; }
.crow__txt small { font-size: 12px; color: var(--on-dark-2); }
.crow--tg .crow__txt small, .crow--in .crow__txt small, .crow--wa .crow__txt small { color: rgba(255,255,255,.82); }
.crow__go { width: 18px; height: 18px; flex: none; opacity: .9; }
.crow__act { flex: none; min-height: 40px; padding: 0 12px; border-radius: 10px; border: 0; cursor: pointer; font: 600 13px/1 var(--font-body); background: rgba(255,255,255,.1); color: #fff; display: inline-flex; align-items: center; gap: 6px; text-decoration: none; touch-action: manipulation; }
.crow__act:hover { background: rgba(255,255,255,.18); }
.crow__email { user-select: all; -webkit-user-select: all; }
@media (max-width: 400px) { .crow__act--mail { display: none; } }
.socials { display: flex; gap: 10px; }
.socials a { width: 70px; height: 54px; border-radius: 14px; background: var(--chip); display: grid; place-items: center; }
.socials svg { width: 22px; height: 22px; }
.site-link { display: inline-flex; align-items: center; gap: 8px; font: 600 20px/1 var(--font-display); letter-spacing: -0.03em; text-decoration: none; border-bottom: 1.5px solid #fff; padding-bottom: 6px; margin-top: 14px; width: fit-content; min-height: 32px; }

/* Footer */
.foot { position: relative; overflow: hidden; border-top: 1px solid var(--line-dark); padding-block: 40px 0; padding-bottom: env(safe-area-inset-bottom, 0px); }
.foot__row { display: flex; flex-wrap: wrap; justify-content: space-between; gap: 18px 32px; font-size: 13px; color: var(--on-dark-3); }
.foot__privacy { max-width: 62ch; }
.foot__privacy a { color: var(--on-dark-2); }
.foot__mark { margin: 48px auto -4%; width: min(1100px, 92%); opacity: .18; filter: blur(3px); user-select: none; pointer-events: none; }


/* Reveal: visible at rest, animates in only after JS marks it */
.js .rv { transition: opacity .8s cubic-bezier(.2,.7,.2,1), transform .8s cubic-bezier(.2,.7,.2,1); }
.js .rv.rv--pending { opacity: 0; transform: translateY(26px); }

@media (prefers-reduced-motion: reduce) {
  .fl__inner, .notif, .pipe__lane, .flow { animation: none !important; }
  .js .rv.rv--pending { opacity: 1; transform: none; }
}
</style>

<meta property="og:type" content="website">
<meta property="og:site_name" content="Dynerox">
<meta property="og:title" content="Dynerox · Investor pitch">
<meta property="og:description" content="The banking and compliance layer for decentralized businesses.">
<meta property="og:image" content="%%SITE_URL%%/slides/slide-01.webp">
<meta name="twitter:card" content="summary_large_image">
<link rel="icon" href="/favicon.svg" type="image/svg+xml">
<!--DR_INJECT-->
</head>
<body>
<header class="nav">
  <div class="wrap nav__in">
    <a class="nav__logo" href="#top" aria-label="Dynerox, back to top"><img src="/img/logo-light.webp" alt="Dynerox" width="104" height="24"></a>
    <nav class="nav__links" aria-label="Sections">
      <a href="#problem">Problem</a>
      <a href="#traction">Traction</a>
      <a href="#how">How it works</a>
      <a href="#team">Team</a>
      <a href="#market">Market</a>
      <a href="#deck">Deck</a>
    </nav>
    <a class="btn btn--green" href="#contact" data-track-link="nav_contact">Contact us</a>
  </div>
</header>

<main id="top">
  <!-- HERO -->
  <section class="hero" data-track-section="hero" aria-labelledby="hero-title">
    <div class="float-field" id="floatField" aria-hidden="true"></div>
    <div class="wrap hero__inner">
      <span class="eyebrow">Investor pitch · 2026</span>
      <h1 id="hero-title">The banking and compliance layer for <span class="accent">decentralized</span> businesses.</h1>
      <p class="lede">Dynerox enables decentralized businesses to create routes between their customers and virtual assets. With compliance embedded and verifiable, builders can create compliant ramps and connect them into cross-border payments.</p>
      <div class="hero__ctas">
        <a class="btn btn--green" href="#problem" data-track-link="hero_deck">View the deck
          <svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M8 3v10M3.5 8.5 8 13l4.5-4.5"/></svg></a>
        <a class="btn btn--ghost" href="#contact" data-track-link="hero_contact">Contact founders</a>
      </div>
      <p class="prepared" id="preparedFor" hidden></p>
      <div class="hero__proof">
        <span>Tenbin Labs live in Mexico in days</span>
        <span>Banco Azteca approved our compliance model</span>
        <span>10+ companies applied to onboard</span>
      </div>
    </div>
  </section>

  <!-- VIDEO (hidden until DR_CONFIG.videoUrl is set) -->
  <section class="band band--navy" id="video" data-track-section="video" hidden style="padding-top:0">
    <div class="wrap">
      <span class="eyebrow">Watch</span>
      <h2 class="h-section">The pitch, from the founders.</h2>
      <div class="video-card"><div id="videoMount"></div></div>
    </div>
  </section>

  <!-- PROBLEM -->
  <section class="band band--cream" id="problem" data-track-section="problem">
    <div class="wrap">
      <span class="eyebrow">The problem</span>
      <h2 class="h-section rv">Regulation keeps DeFi businesses out of new markets.</h2>
      <div class="said rv"><img src="/img/team-hugo.webp" alt="" width="36" height="36"><p>They spend a lot of time and money to launch, or they never do, because regulation is too complex to navigate alone.</p></div>
      <div class="grid-3">
        <div class="pcard rv"><div class="pcard__big">Months or years</div><div class="pcard__small">to launch in a single new country.</div></div>
        <div class="pcard rv"><div class="pcard__big">$100,000s</div><div class="pcard__small">in licensing, legal and banking setup.</div></div>
        <div class="pcard pcard--dark rv"><div class="pcard__big">Or never</div><div class="pcard__small">when the regulation is too complex to navigate alone.</div></div>
      </div>
      <p class="kicker rv">Builders can't build. <em>Dynerox removes that wall.</em></p>
    </div>
  </section>

  <!-- TRACTION -->
  <section class="band band--green" id="traction" data-track-section="traction">
    <svg class="deco" style="right:-40px;top:40px;width:220px" viewBox="0 0 220 80" aria-hidden="true"><path d="M0 0h190l30 40-30 40H0l18-40z" fill="#fff" transform="rotate(-24 110 40)"/></svg>
    <svg class="deco" style="left:24px;bottom:28px;width:90px" viewBox="0 0 90 60" aria-hidden="true" fill="none" stroke="#fff" stroke-width="3" stroke-linecap="round"><path d="M8 52l14-14M28 44l14-14M48 36l14-14M68 28l14-14"/></svg>
    <div class="wrap">
      <span class="eyebrow">Traction · First 5 weeks</span>
      <h2 class="traction__head rv">In five weeks: a market launch in days, a bank's compliance approval, and 10+ companies applying.</h2>
      <div class="facts">
        <div class="fact rv"><div class="fact__label">New York DeFi company</div><div class="fact__value">Launched in Mexico in days</div><div class="fact__who"><b>Tenbin Labs</b>, with no local banking or compliance build.</div></div>
        <div class="fact rv"><div class="fact__label">Largest branch network in Mexico</div><div class="fact__value">Compliance model approved</div><div class="fact__who"><b>Banco Azteca</b>. Signing a cash-to-crypto pilot at its counters.</div></div>
        <div class="fact rv"><div class="fact__label">Customer pipeline</div><div class="fact__value">10+ companies</div><div class="fact__who">have applied to onboard.</div></div>
      </div>
      <p class="traction__tag">Fast and compliance ready.</p>
    </div>
  </section>

  <!-- HOW IT WORKS -->
  <section class="band band--cream" id="how" data-track-section="how">
    <div class="wrap">
      <span class="eyebrow">How it works · Like Global Entry, for your users</span>
      <h2 class="h-section rv">Users verify once, then move through a trusted route between their bank and their wallet.</h2>
      <div class="route rv" role="img" aria-label="Diagram: a bank account in local currency connects through the Dynerox trusted route to a crypto wallet holding stablecoins and crypto">
        <div class="node">
          <div class="node__icon"><svg viewBox="0 0 24 24" fill="none" stroke="#061021" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M3 10l9-6 9 6M5 10v8M9.5 10v8M14.5 10v8M19 10v8M3 20h18"/></svg></div>
          <b>Bank account</b><small>MXN · USD · EUR · COP</small>
        </div>
        <div class="pipe">
          <div class="pipe__tube">
            <div class="pipe__lane pipe__lane--a"></div><div class="pipe__lane pipe__lane--b"></div><div class="pipe__lane pipe__lane--c"></div>
            <div class="pipe__name"><span>DYNEROX</span></div>
          </div>
          <div class="carry">
            <span style="--c:#00bc0a"><i></i>Validated identity</span>
            <span style="--c:#00a8e8"><i></i>Instructions</span>
            <span style="--c:#f2c94c"><i></i>Consent</span>
          </div>
        </div>
        <div class="node">
          <div class="node__icon"><svg viewBox="0 0 24 24" fill="none" stroke="#061021" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M4 7h14a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V7zm0 0V6a2 2 0 0 1 2-2h10v3M16 13.5h.01"/></svg></div>
          <b>Crypto wallet</b><small>Stablecoins, crypto, tokenized assets</small>
        </div>
      </div>
      <div class="steps">
        <div class="step rv"><div class="step__n">01</div><h3>Verify once</h3><p>Users prove who they are a single time. The DeFi app connects through our API.</p></div>
        <div class="step rv"><div class="step__n">02</div><h3>Every conversion carries proof</h3><p>A smart contract carries the validated identity, the user's instructions and their consent.</p></div>
        <div class="step rv"><div class="step__n">03</div><h3>Any party can verify</h3><p>Parties and regulators can verify that a legitimate, trusted transaction took place, without exposing anyone's data.</p></div>
      </div>

      <h3 class="routes-head rv">Routes connect. One is a ramp. Many are a settlement network.</h3>
      <div class="routes rv" id="routesPage"></div>
    </div>
  </section>

  <!-- INSIGHT -->
  <section class="band band--navy" id="insight" data-track-section="insight">
    <div class="wrap insight">
      <div style="min-width:0">
        <span class="eyebrow">The insight</span>
        <h2 class="h-section rv">DeFi is rebuilding banking. Moving money is still too hard.</h2>
        <div class="compare">
          <div class="compare__item rv">
            <div class="compare__label">Today, every conversion is</div>
            <div class="compare__title">A new checkout</div>
            <div class="compare__sub">with different rules in every country.</div>
            <div class="checkouts"><span>Mexico</span><i>×</i><span>Colombia</span><i>×</i><span>U.S.</span></div>
          </div>
          <div class="compare__item compare__item--good rv">
            <div class="compare__label">Stablecoins should feel like</div>
            <div class="compare__title">Handling money</div>
            <div class="compare__sub">Just a bank transfer. Your crypto arrives in your wallet.</div>
          </div>
        </div>
      </div>
      <div class="rv">
        <div class="phone" role="img" aria-label="Illustrative mockup: a $500 bank transfer arrives as 0.007 BTC in the user's wallet">
          <div class="phone__screen">
            <div class="phone__bar"><span>9:41</span><span>●●●</span></div>
            <div class="notif">
              <div class="notif__icon"><svg viewBox="0 0 24 24" fill="none"><path d="M5 4h4.5l3 5.2L15.5 4H20l-5.3 8L20 20h-4.5l-3-5-3 5H5l5.3-8z" fill="#00bc0a"/></svg></div>
              <div><b>Dynerox</b><span>Your 0.007 BTC have arrived</span></div>
            </div>
            <div class="tx">
              <div class="tx__check"><svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg></div>
              <div style="font-weight:600">Transfer sent</div>
              <div class="tx__amt">$500.00</div>
            </div>
            <dl class="tx__rows">
              <div><dt>To</dt><dd>Lois BTC account</dd></div>
              <div><dt>From</dt><dd>Checking ••4821</dd></div>
            </dl>
          </div>
        </div>
        <p class="phone__cap">Illustrative mockup</p>
      </div>
    </div>
  </section>

  <!-- TEAM -->
  <section class="band band--navy" id="team" data-track-section="team" style="border-top:1px solid var(--line-dark)">
    <div class="wrap">
      <span class="eyebrow">The team</span>
      <h2 class="h-section rv">15+ years building payments in Mexico and Brazil, with a certified compliance officer as founder.</h2>
      <div class="stats">
        <div class="stat"><b>15+</b><span>years in payments</span></div>
        <div class="stat"><b>2</b><span>exits in payments</span></div>
        <div class="stat"><b>1,000s</b><span>of merchants onboarded</span></div>
      </div>
      <div class="team">
        <article class="person rv"><img src="/img/team-hugo.webp" alt="Hugo Castrejón" width="72" height="72">
          <div style="min-width:0"><h3>Hugo Castrejón</h3><div class="role">CEO</div><p>Founded Banwire and Gamecash, both exited. 15+ years in payments and 10 in crypto.</p></div>
          <a class="person__in" href="https://www.linkedin.com/in/hugo-castrejon/" target="_blank" rel="noopener" aria-label="Hugo Castrejón on LinkedIn" data-track-link="li_hugo_team"><svg viewBox="0 0 24 24" fill="#fff"><path d="M4.98 3.5a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5zM3 9.5h4V21H3zM10 9.5h3.8v1.6h.1c.5-1 1.8-2 3.8-2 4 0 4.8 2.6 4.8 6V21h-4v-5.1c0-1.2 0-2.8-1.7-2.8s-2 1.3-2 2.7V21h-4z"/></svg></a></article>
        <article class="person rv"><img src="/img/team-christian.webp" alt="Christian Ribeiro" width="72" height="72">
          <div style="min-width:0"><h3>Christian Ribeiro</h3><div class="role">Business development</div><p>Part of the UOL Boacompra exit. 15+ years in payments.</p></div></article>
        <article class="person rv"><img src="/img/team-roberto.webp" alt="Roberto Castrejón" width="72" height="72">
          <div style="min-width:0"><h3>Roberto Castrejón</h3><div class="role">COO</div><p>Certified compliance officer with 10 years in payments.</p></div>
          <a class="person__in" href="https://www.linkedin.com/in/roberto-castrejon-gonzalez/" target="_blank" rel="noopener" aria-label="Roberto Castrejón on LinkedIn" data-track-link="li_roberto_team"><svg viewBox="0 0 24 24" fill="#fff"><path d="M4.98 3.5a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5zM3 9.5h4V21H3zM10 9.5h3.8v1.6h.1c.5-1 1.8-2 3.8-2 4 0 4.8 2.6 4.8 6V21h-4v-5.1c0-1.2 0-2.8-1.7-2.8s-2 1.3-2 2.7V21h-4z"/></svg></a></article>
      </div>
      <div class="logos"><small>Where we've built</small>
        <span>Banwire</span><span>Recaudia</span><span>Gamecash</span><span>SulPayments</span><span>Boa Compra</span><span>GOWD</span>
      </div>
    </div>
  </section>

  <!-- MARKET + MODEL -->
  <section class="band band--cream" id="market" data-track-section="market">
    <div class="wrap">
      <span class="eyebrow">Market</span>
      <h2 class="h-section rv">Stablecoins are expanding beyond crypto into markets worth trillions.</h2>
      <div class="said rv"><img src="/img/team-hugo.webp" alt="" width="36" height="36"><p>Every app entering a new market needs local banking and compliance.</p></div>
      <div class="market">
        <figure class="chart rv">
          <figcaption><div class="chart__title">Stablecoin usage growth</div><div class="chart__sub">Adjusted transaction volume, US$ trillions</div></figcaption>
          <svg id="mktChart" viewBox="0 0 640 300" role="img" aria-label="Line chart: about 0.95 trillion dollars in 2023, 1.4 trillion in 2024, 2.3 trillion in 2025, and an estimated 3.4 trillion in 2026"></svg>
          <div class="chart__tip" id="mktTip"></div>
          <p class="chart__note">2026 is an estimate.</p>
        </figure>
        <ul class="uses rv" aria-label="Where stablecoins are used">
          <li>Crypto <small>trading rails</small></li>
          <li>Payments <small>cross-border</small></li>
          <li>Tokenized assets <small>stocks, funds</small></li>
          <li>Investments <small>yield, savings</small></li>
        </ul>
      </div>
      <div class="model rv">
        <h3>We give builders the infrastructure, and <span>earn as their users transact.</span></h3>
        <p>So they can focus on building the future of finance. Every new app in a new market is a new set of users moving money through Dynerox routes.</p>
      </div>
    </div>
  </section>

  <!-- DECK -->
  <section class="band band--cream" id="deck" data-track-section="deck" style="border-top:1px solid var(--line-light)">
    <div class="wrap">
      <span class="eyebrow">The deck</span>
      <h2 class="h-section">Go through it at your own pace.</h2>
      <div class="deck">
        <div class="deck__stage">
          <img id="deckImg" src="/slides/slide-01.webp" alt="Slide 1" width="1467" height="825">
          <a class="deck__hot" id="deckHot" href="#contact" aria-label="Contact us" data-track-link="deck_contact"></a>
        </div>
        <div class="deck__bar">
          <div class="deck__count" aria-live="polite"><b id="deckN">01</b> / <span id="deckT">08</span></div>
          <div class="deck__nav">
            <button class="icon-btn" id="deckPrev" type="button" aria-label="Previous slide"><svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M10 3 5 8l5 5"/></svg></button>
            <button class="icon-btn" id="deckNext" type="button" aria-label="Next slide"><svg viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m6 3 5 5-5 5"/></svg></button>
          </div>
        </div>
        <div class="thumbs" id="deckThumbs" role="tablist" aria-label="Slides"></div>
      </div>
    </div>
  </section>

  <!-- CONTACT -->
  <section class="band band--navy" id="contact" data-track-section="contact">
    <div class="wrap contact">
      <div>
        <span class="eyebrow">Contact</span>
        <h2 style="margin-top:18px">We are not another crypto service. <span>We are infrastructure.</span></h2>
        <p class="lede">Questions about the round, the product or compliance? Write to us and a founder will answer.</p>
      </div>
      <div class="clist">
        <div class="clist__label" style="margin-top:0">Founders on LinkedIn</div>
        <a class="crow crow--in" href="https://www.linkedin.com/in/hugo-castrejon/" target="_blank" rel="noopener" data-track-link="li_hugo">
          <span class="crow__icon"><svg viewBox="0 0 24 24" fill="#fff"><path d="M4.98 3.5a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5zM3 9.5h4V21H3zM10 9.5h3.8v1.6h.1c.5-1 1.8-2 3.8-2 4 0 4.8 2.6 4.8 6V21h-4v-5.1c0-1.2 0-2.8-1.7-2.8s-2 1.3-2 2.7V21h-4z"/></svg></span>
          <span class="crow__txt"><b>Hugo Castrejón</b><small>CEO</small></span>
          <svg class="crow__go" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M5 11 11 5M6 5h5v5"/></svg>
        </a>
        <a class="crow crow--in" href="https://www.linkedin.com/in/roberto-castrejon-gonzalez/" target="_blank" rel="noopener" data-track-link="li_roberto">
          <span class="crow__icon"><svg viewBox="0 0 24 24" fill="#fff"><path d="M4.98 3.5a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5zM3 9.5h4V21H3zM10 9.5h3.8v1.6h.1c.5-1 1.8-2 3.8-2 4 0 4.8 2.6 4.8 6V21h-4v-5.1c0-1.2 0-2.8-1.7-2.8s-2 1.3-2 2.7V21h-4z"/></svg></span>
          <span class="crow__txt"><b>Roberto Castrejón</b><small>COO · Compliance</small></span>
          <svg class="crow__go" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M5 11 11 5M6 5h5v5"/></svg>
        </a>
        <div class="clist__label">Email</div>
        <div class="crow">
          <span class="crow__icon"><svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="1.8"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="m4 7 8 6 8-6"/></svg></span>
          <span class="crow__txt"><b class="crow__email">partnerships@dynerox.com</b><small>Partnerships · investors</small></span>
          <button class="crow__act" type="button" data-copy="partnerships@dynerox.com" data-track-link="copy_partnerships">Copy</button>
          <a class="crow__act crow__act--mail" href="mailto:partnerships@dynerox.com?subject=Dynerox%20investor%20inquiry" data-track-link="mail_partnerships">Email</a>
        </div>
        <div class="crow">
          <span class="crow__icon"><svg viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="1.8"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="m4 7 8 6 8-6"/></svg></span>
          <span class="crow__txt"><b class="crow__email">compliance@dynerox.com</b><small>KYC · regulatory</small></span>
          <button class="crow__act" type="button" data-copy="compliance@dynerox.com" data-track-link="copy_compliance">Copy</button>
          <a class="crow__act crow__act--mail" href="mailto:compliance@dynerox.com" data-track-link="mail_compliance">Email</a>
        </div>
        <div class="clist__label">Chat</div>
        <a class="crow crow--tg" id="cTelegram" href="#" target="_blank" rel="noopener" data-track-link="telegram" hidden>
          <span class="crow__icon"><svg viewBox="0 0 24 24" fill="#fff"><path d="M21.4 3.6 2.9 10.7c-1.3.5-1.2 1.2-.2 1.5l4.7 1.5 1.8 5.6c.2.6.4.8.8.8s.6-.2.9-.5l2.3-2.2 4.8 3.5c.9.5 1.5.2 1.7-.8l3.1-14.7c.3-1.3-.5-1.9-1.4-1.5zM9.8 14.3l-.4 4.2-1.6-5 9.6-6.1z"/></svg></span>
          <span class="crow__txt"><b>Telegram</b><small id="cTelegramHandle">@dynerox</small></span>
          <svg class="crow__go" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M3 8h10M9 4l4 4-4 4"/></svg>
        </a>
        <a class="crow crow--wa" id="cWhatsapp" href="#" target="_blank" rel="noopener" data-track-link="whatsapp" hidden>
          <span class="crow__icon"><svg viewBox="0 0 24 24" fill="#fff"><path d="M12 2a10 10 0 0 0-8.6 15.1L2 22l5-1.3A10 10 0 1 0 12 2zm0 18.2c-1.5 0-3-.4-4.2-1.1l-.3-.2-3 .8.8-2.9-.2-.3A8.2 8.2 0 1 1 12 20.2zm4.5-6.1c-.2-.1-1.5-.7-1.7-.8s-.4-.1-.6.1-.6.8-.8 1-.3.2-.5.1a6.7 6.7 0 0 1-3.3-2.9c-.3-.4.2-.4.7-1.4.1-.2 0-.3 0-.4l-.8-1.8c-.2-.5-.4-.4-.6-.4h-.5a1 1 0 0 0-.7.3 3 3 0 0 0-.9 2.2c0 1.3.9 2.5 1.1 2.7.1.2 1.8 2.8 4.4 3.9 1.6.7 2.3.8 3.1.6.5-.1 1.5-.6 1.7-1.2.2-.6.2-1.1.1-1.2l-.7-.6z"/></svg></span>
          <span class="crow__txt"><b>WhatsApp</b><small>Fast response</small></span>
          <svg class="crow__go" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M3 8h10M9 4l4 4-4 4"/></svg>
        </a>
        <div class="socials" id="cSocials" hidden>
          <a id="cLinkedin" href="#" target="_blank" rel="noopener" aria-label="Dynerox on LinkedIn" data-track-link="linkedin_company" hidden><svg viewBox="0 0 24 24" fill="#fff"><path d="M4.98 3.5a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5zM3 9.5h4V21H3zM10 9.5h3.8v1.6h.1c.5-1 1.8-2 3.8-2 4 0 4.8 2.6 4.8 6V21h-4v-5.1c0-1.2 0-2.8-1.7-2.8s-2 1.3-2 2.7V21h-4z"/></svg></a>
          <a id="cX" href="#" target="_blank" rel="noopener" aria-label="Dynerox on X" data-track-link="x" hidden><svg viewBox="0 0 24 24" fill="#fff"><path d="M17.8 3h3.1l-6.8 7.7L22 21h-6.2l-4.9-6.3L5.3 21H2.2l7.2-8.3L2 3h6.4l4.4 5.8zm-1.1 16.2h1.7L7.4 4.7H5.6z"/></svg></a>
        </div>
        <a class="site-link" href="https://dynerox.com/" target="_blank" rel="noopener" data-track-link="website">Visit dynerox.com
          <svg width="16" height="16" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M5 11 11 5M6 5h5v5"/></svg></a>
      </div>
    </div>
  </section>
</main>

<footer class="foot">
  <div class="wrap foot__row">
    <p>© 2026 Dynerox Protocol, S.A.P.I. de C.V.</p>
    <p class="foot__privacy">This link is personal. We record how it is used (sections viewed, time on page, video playback, country and device type) to follow up with investors. IP addresses are stored only as a one-way hash. <a href="https://dynerox.com/terms-conditions-privacy" target="_blank" rel="noopener" data-track-link="privacy">Privacy notice</a></p>
  </div>
  <img class="foot__mark" src="/img/logo-light.webp" alt="" aria-hidden="true">
</footer>


<script>
/* ============ CONFIG: edit these, nothing else ============ */
const DR_CONFIG = {
  videoUrl: (window.__DR__ && window.__DR__.videoUrl) || '',  // set VIDEO_URL in Cloudflare, or a link here. Empty = hidden.
  whatsapp: '',                       // e.g. https://wa.me/52XXXXXXXXXX (empty = hidden)
  telegram: 'https://t.me/dynerox',   // handle shown on dynerox.com/contact (link not verified)
  linkedin: '',                       // company page (empty = hidden)
  x: '',                              // empty = hidden
  endpoint: '/api/event'
};
/* The server may inject window.__DR__ = { code, prospect } on /p/<code>. */

document.documentElement.classList.add('js');

/* ============ TRACKER ============
   Inert unless the page is served at /p/<code> (8-12 chars). Events are batched and sent
   every 15 s and when the tab is hidden. A visit only counts as human after JS runs AND
   the person scrolls or interacts at least 1.2 s after load. */
const DR = (() => {
  const m = location.pathname.match(/^\/p\/([A-Za-z0-9]{8,12})\/?$/);
  const injected = window.__DR__ || {};
  const code = injected.code || (m ? m[1] : null);
  const enabled = !!code;
  const sid = (window.crypto && crypto.randomUUID) ? crypto.randomUUID() : String(Math.random()).slice(2) + Date.now();
  const t0 = Date.now();
  let queue = [], human = false, activeMs = 0, lastActive = Date.now(), lastTick = Date.now();

  function push(type, data) {
    queue.push({ type, data: data || {}, at: Date.now() });
    if (!enabled && window.console) console.debug('[track:off]', type, data || '');
  }
  function flush(beacon) {
    if (!enabled || !queue.length) return;
    const body = JSON.stringify({ code, sid, human, events: queue.splice(0) });
    try {
      if (beacon && navigator.sendBeacon) navigator.sendBeacon(DR_CONFIG.endpoint, new Blob([body], { type: 'application/json' }));
      else fetch(DR_CONFIG.endpoint, { method: 'POST', headers: { 'content-type': 'application/json' }, body, keepalive: true }).catch(() => {});
    } catch (e) {}
  }
  function markHuman(via) {
    if (human || Date.now() - t0 < 1200) return;
    human = true;
    let tz = ''; try { tz = Intl.DateTimeFormat().resolvedOptions().timeZone || ''; } catch (e) {}
    push('human_open', { via, referrer: document.referrer || '', lang: navigator.language || '', tz,
      screen: screen.width + 'x' + screen.height, vw: innerWidth, touch: ('ontouchstart' in window) });
    flush(false);
  }
  function activity() { lastActive = Date.now(); }

  setInterval(() => {
    const now = Date.now();
    if (document.visibilityState === 'visible' && now - lastActive < 30000) activeMs += now - lastTick;
    lastTick = now;
  }, 1000);
  setInterval(() => { if (human) push('heartbeat', { activeMs }); flush(false); }, 15000);
  document.addEventListener('visibilitychange', () => {
    if (document.visibilityState === 'hidden') { push('heartbeat', { activeMs, final: true }); flush(true); }
  });
  addEventListener('pagehide', () => { push('heartbeat', { activeMs, final: true }); flush(true); });

  let scrollMax = 0;
  addEventListener('scroll', () => {
    activity();
    const d = document.documentElement;
    const pct = Math.round(100 * (scrollY + innerHeight) / d.scrollHeight);
    if (scrollY > 40) markHuman('scroll');
    if (pct >= scrollMax + 25 || (pct >= 98 && scrollMax < 98)) { scrollMax = pct; push('scroll_depth', { pct }); }
  }, { passive: true });
  ['pointerdown', 'keydown', 'wheel', 'touchstart'].forEach(ev => addEventListener(ev, () => { activity(); markHuman(ev); }, { passive: true }));
  addEventListener('pointermove', activity, { passive: true });

  const seen = {}, entered = {};
  const io = new IntersectionObserver(entries => {
    entries.forEach(e => {
      const id = e.target.dataset.trackSection;
      if (e.isIntersecting) { entered[id] = Date.now(); if (!seen[id]) { seen[id] = 1; push('section_view', { id }); } }
      else if (entered[id]) { push('section_dwell', { id, ms: Date.now() - entered[id] }); entered[id] = 0; }
    });
  }, { threshold: 0.35 });
  document.querySelectorAll('[data-track-section]').forEach(s => io.observe(s));

  document.addEventListener('click', e => {
    const a = e.target.closest('[data-track-link]');
    if (a) push('link_click', { id: a.dataset.trackLink, href: a.getAttribute('href') || '' });
  });

  push('js_loaded', { path: location.pathname });
  return { push, flush, get enabled() { return enabled; }, code, injected };
})();

/* In-page links: scroll by script so they also work inside embedded viewers */
document.addEventListener('click', e => {
  const a = e.target.closest('a[href^="#"]');
  if (!a) return;
  const id = a.getAttribute('href').slice(1);
  const t = id === 'top' ? document.body : document.getElementById(id);
  if (!t) return;
  e.preventDefault();
  const reduce = matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (id === 'top') scrollTo({ top: 0, behavior: reduce ? 'auto' : 'smooth' });
  else t.scrollIntoView({ behavior: reduce ? 'auto' : 'smooth', block: 'start' });
});

if (DR.injected.prospect) { const p = document.getElementById('preparedFor'); p.textContent = 'Prepared for ' + DR.injected.prospect; p.hidden = false; }

/* Contact links from config + copy buttons */
(() => {
  const set = (id, url) => { const el = document.getElementById(id); if (url) { el.href = url; el.hidden = false; } return !!url; };
  set('cWhatsapp', DR_CONFIG.whatsapp);
  if (set('cTelegram', DR_CONFIG.telegram)) {
    const h = (DR_CONFIG.telegram.match(/t\.me\/([\w]+)/) || [])[1]; if (h) document.getElementById('cTelegramHandle').textContent = '@' + h;
  }
  const li = set('cLinkedin', DR_CONFIG.linkedin), xx = set('cX', DR_CONFIG.x);
  document.getElementById('cSocials').hidden = !(li || xx);
  document.querySelectorAll('[data-copy]').forEach(b => b.addEventListener('click', () => {
    const txt = b.dataset.copy;
    const done = () => { b.textContent = 'Copied'; setTimeout(() => b.textContent = 'Copy', 1600); };
    const fallback = () => { const s = getSelection(), r = document.createRange(); r.selectNodeContents(b.parentElement.querySelector('b')); s.removeAllRanges(); s.addRange(r); b.textContent = 'Selected'; setTimeout(() => b.textContent = 'Copy', 1600); };
    try { navigator.clipboard.writeText(txt).then(done, fallback); } catch (e) { fallback(); }
  }));
})();

/* ============ ROUTES VISUAL (ramp, cross-border, network) ============ */
function routesMarkup() {
  const node = (x, y, label, c) => `<g><circle cx="${x}" cy="${y}" r="15" fill="${c}"/><text x="${x}" y="${y + 33}" text-anchor="middle" font-size="12" font-weight="600" fill="#061021" font-family="Inter, sans-serif">${label}</text></g>`;
  const line = (x1, y1, x2, y2, c) => `<line x1="${x1}" y1="${y1}" x2="${x2}" y2="${y2}" stroke="${c}" stroke-opacity=".2" stroke-width="6" stroke-linecap="round"/><line class="flow" x1="${x1}" y1="${y1}" x2="${x2}" y2="${y2}" stroke="${c}" stroke-width="2.5" stroke-linecap="round"/>`;
  const G = '#00bc0a', B = '#00a8e8', N = '#061021';
  const ramp = `<svg viewBox="0 0 300 120" aria-hidden="true">${line(70, 48, 230, 48, G)}${node(70, 48, 'MXN bank', N)}${node(230, 48, 'USDT wallet', B)}</svg>`;
  const xb = `<svg viewBox="0 0 300 120" aria-hidden="true">${line(45, 48, 150, 48, G)}${line(150, 48, 255, 48, G)}${node(45, 48, 'MXN', N)}${node(150, 48, 'USDT', B)}${node(255, 48, 'BRL', N)}</svg>`;
  const pts = [[40, 30, 'MX'], [150, 18, ''], [260, 30, 'BR'], [70, 82, 'US'], [190, 74, ''], [262, 88, 'CO']];
  const edges = [[0, 1], [1, 2], [0, 3], [1, 4], [3, 4], [4, 2], [4, 5], [2, 5]];
  const net = `<svg viewBox="0 0 300 120" aria-hidden="true">${edges.map(([a, b]) => line(pts[a][0], pts[a][1], pts[b][0], pts[b][1], G)).join('')}${pts.map(p => `<g><circle cx="${p[0]}" cy="${p[1]}" r="${p[2] ? 13 : 8}" fill="${p[2] ? N : B}"/>${p[2] ? `<text x="${p[0]}" y="${p[1] + 4}" text-anchor="middle" font-size="9" font-weight="700" fill="#fff" font-family="Geist Mono, monospace">${p[2]}</text>` : ''}</g>`).join('')}</svg>`;
  return `<div class="rcard">${ramp}<div class="rcard__k">One route</div><div class="rcard__v">A ramp</div></div>`
       + `<div class="rcard">${xb}<div class="rcard__k">Two connected routes</div><div class="rcard__v">A cross-border payment</div></div>`
       + `<div class="rcard">${net}<div class="rcard__k">Many routes</div><div class="rcard__v">A settlement network for verified senders and receivers</div></div>`;
}
document.getElementById('routesPage').innerHTML = routesMarkup();


/* ============ VIDEO (YouTube or Vimeo, tracked by quartile) ============ */
(() => {
  const url = (DR_CONFIG.videoUrl || '').trim();
  if (!url) return;
  const yt = url.match(/(?:youtu\.be\/|youtube\.com\/(?:watch\?v=|embed\/|shorts\/))([\w-]{11})/);
  const vm = url.match(/vimeo\.com\/(?:video\/)?(\d+)(?:\/(\w+))?/);
  if (!yt && !vm) return;
  document.getElementById('video').hidden = false;
  const mount = document.getElementById('videoMount');
  let maxPct = 0, started = false;
  const marks = [25, 50, 75, 95];
  function progress(cur, dur) {
    if (!dur) return;
    const pct = Math.min(100, Math.round(100 * cur / dur));
    marks.forEach(mk => { if (pct >= mk && maxPct < mk) DR.push('video_progress', { pct: mk }); });
    if (pct > maxPct) maxPct = pct;
  }
  function onPlay() { if (!started) { started = true; DR.push('video_play', {}); } }
  function load(src, cb) { const s = document.createElement('script'); s.src = src; s.onload = cb; document.head.appendChild(s); }
  if (yt) {
    const div = document.createElement('div'); div.id = 'ytPlayer'; mount.appendChild(div);
    window.onYouTubeIframeAPIReady = () => {
      let poll;
      const p = new YT.Player('ytPlayer', {
        videoId: yt[1], playerVars: { rel: 0, modestbranding: 1, playsinline: 1 },
        events: { onStateChange: e => {
          if (e.data === 1) { onPlay(); clearInterval(poll); poll = setInterval(() => progress(p.getCurrentTime(), p.getDuration()), 2000); }
          else { clearInterval(poll); progress(p.getCurrentTime(), p.getDuration()); }
          if (e.data === 2) DR.push('video_pause', { pct: maxPct });
          if (e.data === 0) DR.push('video_end', {});
        } }
      });
    };
    load('https://www.youtube.com/iframe_api');
  } else {
    const ifr = document.createElement('iframe');
    ifr.src = 'https://player.vimeo.com/video/' + vm[1] + (vm[2] ? '?h=' + vm[2] + '&' : '?') + 'dnt=1&title=0&byline=0&portrait=0&playsinline=1';
    ifr.allow = 'autoplay; fullscreen; picture-in-picture'; ifr.allowFullscreen = true; ifr.title = 'Dynerox pitch video';
    mount.replaceWith(ifr);
    load('https://player.vimeo.com/api/player.js', () => {
      const p = new Vimeo.Player(ifr);
      p.on('play', onPlay);
      p.on('timeupdate', d => progress(d.seconds, d.duration));
      p.on('pause', () => DR.push('video_pause', { pct: maxPct }));
      p.on('ended', () => DR.push('video_end', {}));
    });
  }
})();

/* ============ DECK VIEWER ============ */
(() => {
  const N = 8;
  const alts = [
    'Cover: The banking and compliance layer for decentralized businesses',
    'The problem: regulation keeps DeFi businesses out of new markets',
    'Traction: first 5 weeks',
    'How it works: users verify once, then move through a trusted route',
    'The insight: moving money is still too hard',
    'The team',
    'Market: stablecoin usage growth',
    'Closing: contact us'
  ];
  const src = i => '/slides/slide-' + String(i + 1).padStart(2, '0') + '.webp';
  const img = document.getElementById('deckImg'), nEl = document.getElementById('deckN'), tEl = document.getElementById('deckT');
  const prev = document.getElementById('deckPrev'), next = document.getElementById('deckNext'), thumbs = document.getElementById('deckThumbs');
  const hot = document.getElementById('deckHot');
  tEl.textContent = String(N).padStart(2, '0');
  let cur = 0, since = Date.now(); const viewed = new Set();
  for (let i = 0; i < N; i++) {
    const b = document.createElement('button'); b.type = 'button'; b.setAttribute('role', 'tab'); b.setAttribute('aria-label', 'Slide ' + (i + 1) + ': ' + alts[i]);
    b.innerHTML = '<img src="' + src(i) + '" alt="" loading="lazy" width="132" height="74">';
    b.addEventListener('click', () => go(i, 'thumb'));
    thumbs.appendChild(b);
  }
  function go(i, via) {
    if (i < 0 || i >= N) return;
    if (i !== cur) DR.push('slide_dwell', { slide: cur + 1, ms: Date.now() - since });
    cur = i; since = Date.now();
    img.style.opacity = .2;
    const pre = new Image(); pre.onload = pre.onerror = () => { img.src = src(i); img.alt = 'Slide ' + (i + 1) + ': ' + alts[i]; img.style.opacity = 1; }; pre.src = src(i);
    nEl.textContent = String(i + 1).padStart(2, '0');
    prev.disabled = i === 0; next.disabled = i === N - 1;
    hot.hidden = !(i === 0 || i === N - 1);
    [...thumbs.children].forEach((t, k) => t.setAttribute('aria-current', k === i ? 'true' : 'false'));
    if (via) { const t = thumbs.children[i], r = thumbs.getBoundingClientRect(), tr = t.getBoundingClientRect(); thumbs.scrollBy({ left: tr.left - r.left - r.width / 2 + tr.width / 2, behavior: 'smooth' }); }
    if (!viewed.has(i) && via) { viewed.add(i); DR.push('slide_view', { slide: i + 1, via }); }
  }
  prev.addEventListener('click', () => go(cur - 1, 'button'));
  next.addEventListener('click', () => go(cur + 1, 'button'));
  document.addEventListener('keydown', e => {
    const r = document.getElementById('deck').getBoundingClientRect();
    if (r.top > innerHeight * .6 || r.bottom < innerHeight * .3) return;
    if (e.key === 'ArrowRight') go(cur + 1, 'key'); if (e.key === 'ArrowLeft') go(cur - 1, 'key');
  });
  let sx = null, sy = null; const stage = img.parentElement;
  stage.addEventListener('touchstart', e => { sx = e.touches[0].clientX; sy = e.touches[0].clientY; }, { passive: true });
  stage.addEventListener('touchend', e => {
    if (sx == null) return;
    const dx = e.changedTouches[0].clientX - sx, dy = e.changedTouches[0].clientY - sy;
    if (Math.abs(dx) > 40 && Math.abs(dx) > Math.abs(dy)) go(cur + (dx < 0 ? 1 : -1), 'swipe');
    sx = sy = null;
  });
  go(0);
  new IntersectionObserver((es, o) => { if (es[0].isIntersecting) { viewed.add(0); DR.push('slide_view', { slide: 1, via: 'scroll' }); o.disconnect(); } }, { threshold: .5 }).observe(stage);
})();

/* ============ MARKET CHART ============ */
(() => {
  const svg = document.getElementById('mktChart'), tip = document.getElementById('mktTip');
  const NS = 'http://www.w3.org/2000/svg';
  const data = [
    { y: '2023', v: 0.95 }, { y: '2024', v: 1.4, g: '+50%' }, { y: '2025', v: 2.3, g: '+61%' }, { y: '2026E', v: 3.4, g: '~+49%', est: true }
  ];
  const X = i => 70 + i * 170, Y = v => 252 - v / 4 * 210;
  const el = (n, a, txt) => { const e = document.createElementNS(NS, n); for (const k in a) e.setAttribute(k, a[k]); if (txt != null) e.textContent = txt; svg.appendChild(e); return e; };
  [1, 2, 3, 4].forEach(t => {
    el('line', { x1: 40, x2: 620, y1: Y(t), y2: Y(t), stroke: 'rgba(6,16,33,.07)', 'stroke-width': 1 });
    el('text', { x: 36, y: Y(t) + 4, 'text-anchor': 'end', 'font-size': 11, fill: '#6b7385', 'font-family': 'Geist Mono, monospace' }, '$' + t + 'T');
  });
  el('line', { x1: 40, x2: 620, y1: Y(0), y2: Y(0), stroke: 'rgba(6,16,33,.25)', 'stroke-width': 1 });
  const act = data.slice(0, 3).map((d, i) => X(i) + ',' + Y(d.v)).join(' ');
  el('polygon', { points: X(0) + ',' + Y(0) + ' ' + act + ' ' + X(2) + ',' + Y(0), fill: 'rgba(11,122,22,.10)' });
  el('polyline', { points: act, fill: 'none', stroke: '#0b7a16', 'stroke-width': 2.5, 'stroke-linejoin': 'round', 'stroke-linecap': 'round' });
  el('line', { x1: X(2), y1: Y(2.3), x2: X(3), y2: Y(3.4), stroke: '#0b7a16', 'stroke-width': 2.5, 'stroke-dasharray': '6 6', 'stroke-linecap': 'round' });
  data.forEach((d, i) => {
    el('text', { x: X(i), y: 284, 'text-anchor': 'middle', 'font-size': 13, 'font-weight': 700, fill: '#061021', 'font-family': 'Inter, sans-serif' }, d.y);
    el('text', { x: X(i), y: Y(d.v) - 16, 'text-anchor': 'middle', 'font-size': 17, 'font-weight': 700, fill: '#061021', 'font-family': 'Inter, sans-serif' }, '~$' + d.v + 'T');
    if (d.g) el('text', { x: (X(i) + X(i - 1)) / 2, y: (Y(d.v) + Y(data[i - 1].v)) / 2 + 26, 'text-anchor': 'middle', 'font-size': 12, 'font-weight': 600, fill: '#0b7a16', 'font-family': 'Geist Mono, monospace' }, d.g + (d.est ? ' est.' : ''));
    el('circle', { cx: X(i), cy: Y(d.v), r: 6, fill: d.est ? '#ffffff' : '#0b7a16', stroke: d.est ? '#0b7a16' : '#ffffff', 'stroke-width': 2.5 });
    const hit = el('circle', { class: 'pt', cx: X(i), cy: Y(d.v), r: 22, fill: 'transparent', tabindex: 0 });
    const show = () => {
      const b = svg.getBoundingClientRect(), s = b.width / 640, p = svg.parentElement.getBoundingClientRect();
      tip.textContent = d.y + ': ~$' + d.v + 'T' + (d.g ? '  (' + d.g + ')' : '') + (d.est ? ' estimate' : '');
      tip.style.left = (b.left - p.left + X(i) * s) + 'px'; tip.style.top = (b.top - p.top + Y(d.v) * s - 10) + 'px'; tip.style.opacity = 1;
    };
    hit.addEventListener('pointerenter', show); hit.addEventListener('focus', show);
    hit.addEventListener('pointerleave', () => tip.style.opacity = 0); hit.addEventListener('blur', () => tip.style.opacity = 0);
  });
})();

/* ============ HERO FLOATING SHAPES ============ */
(() => {
  const field = document.getElementById('floatField');
  const ticket = c => `<svg width="96" height="34" viewBox="0 0 96 34"><path d="M0 0h80l16 17-16 17H0l9-17z" fill="${c}"/></svg>`;
  const chev = c => `<svg width="64" height="26" viewBox="0 0 64 26" fill="none" stroke="${c}" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"><path d="M4 3l9 10-9 10M20 3l9 10-9 10M36 3l9 10-9 10M52 3l9 10-9 10"/></svg>`;
  const coin = sym => `<svg width="40" height="40" viewBox="0 0 40 40"><circle cx="20" cy="20" r="18" fill="#13244a" stroke="rgba(255,255,255,.18)"/><text x="20" y="26" text-anchor="middle" font-size="16" font-weight="700" fill="rgba(255,255,255,.75)" font-family="Inter, sans-serif">${sym}</text></svg>`;
  const dot = (c, s) => `<svg width="${s}" height="${s}"><circle cx="${s/2}" cy="${s/2}" r="${s/2}" fill="${c}"/></svg>`;
  const shapes = [
    { x: 6,  y: 16, html: ticket('#00bc0a'), r: -58, d: .6 },
    { x: 86, y: 66, html: ticket('#00bc0a'), r: -22, d: .9 },
    { x: 11, y: 74, html: ticket('#00a8e8'), r: -64, d: .5 },
    { x: 38, y: 95, html: ticket('#00a8e8'), r: -55, d: 1.1 },
    { x: 89, y: 30, html: chev('#00bc0a'), r: -30, d: .7 },
    { x: 80, y: 93, html: chev('#00bc0a'), r: -12, d: .4 },
    { x: 13, y: 40, html: coin('₮'), r: 0, d: .8 },
    { x: 90, y: 47, html: coin('₿'), r: 0, d: .6 },
    { x: 26, y: 9,  html: coin('$'), r: 0, d: .3 },
    { x: 74, y: 11, html: dot('#00a8e8', 14), r: 0, d: .9, sm: 1 },
    { x: 4,  y: 55, html: dot('#ffffff', 10), r: 0, d: .5, sm: 1 },
    { x: 95, y: 82, html: dot('#ffffff', 8), r: 0, d: .7, sm: 1 }
  ];
  const nodes = shapes.map((s, i) => {
    const w = document.createElement('div'); w.className = 'fl'; if (!s.sm) w.dataset.hideSm = '';
    w.style.left = s.x + '%'; w.style.top = s.y + '%';
    w.innerHTML = `<div class="fl__inner" style="--r:${s.r}deg;--dur:${6 + (i % 5)}s;--delay:-${i * .7}s">${s.html}</div>`;
    field.appendChild(w); return { w, d: s.d };
  });
  if (matchMedia('(prefers-reduced-motion: reduce)').matches) return;
  let mx = 0, my = 0, raf = 0;
  const apply = () => { raf = 0; const sy = Math.min(scrollY, 900); nodes.forEach(n => { n.w.style.transform = `translate3d(${mx * n.d * 18}px, ${my * n.d * 14 - sy * n.d * .35}px, 0)`; }); };
  const req = () => { if (!raf) raf = requestAnimationFrame(apply); };
  addEventListener('pointermove', e => { if (e.pointerType === 'mouse') { mx = e.clientX / innerWidth - .5; my = e.clientY / innerHeight - .5; req(); } }, { passive: true });
  addEventListener('scroll', req, { passive: true });
})();

/* ============ REVEAL ON SCROLL (content is visible without JS) ============ */
(() => {
  if (matchMedia('(prefers-reduced-motion: reduce)').matches) return;
  const els = [...document.querySelectorAll('.rv')].filter(e => e.getBoundingClientRect().top > innerHeight * .9);
  els.forEach(e => e.classList.add('rv--pending'));
  const io = new IntersectionObserver(es => es.forEach(e => {
    if (e.isIntersecting) { const sib = [...e.target.parentElement.children].filter(c => c.classList.contains('rv')); e.target.style.transitionDelay = (Math.max(0, sib.indexOf(e.target)) * 80) + 'ms'; e.target.classList.remove('rv--pending'); io.unobserve(e.target); }
  }), { rootMargin: '0px 0px -8% 0px' });
  els.forEach(e => io.observe(e));
  setTimeout(() => els.forEach(e => e.classList.remove('rv--pending')), 4000);
})();
</script>
</body>
</html>
