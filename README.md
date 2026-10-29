# Dynerox · Investor room

Página pública del pitch con un link por prospecto (`/p/<código>`), registro de lo que hace cada visitante y un panel privado en `/admin/`.

Stack: Cloudflare Pages (página y funciones) + D1 (base de datos). Sin build: lo que está en `public/` se publica tal cual.

## Qué hay en el repositorio

```
public/                     Lo que Cloudflare publica
  _tpl/pitch.tpl            La página del pitch (plantilla; solo la lee /p/<código>)
  admin/index.html          Panel de prospectos
  slides/, img/             Slides del deck, logos, fotos del equipo
  _headers, robots.txt      noindex y cabeceras de seguridad
  _routes.json              Qué rutas ejecutan funciones (el resto es estático y gratis)
functions/                  Lógica de servidor
  index.js                  / sin código (QR, link general): misma página, se cuenta como "Sin código"
  p/[code].js               Sirve la página al prospecto y registra la carga
  api/event.js              Recibe los eventos del navegador
  admin/api/[[path]].js     API del panel
  _middleware.js            Cabeceras de seguridad, bloquea /_tpl/
src/lib/auth.js             requireLevel(): la única función que decide quién ve qué
src/lib/request.js          Bots, dispositivo, IP con hash
src/page/page.html          Fuente de la página (la misma del artefacto de diseño)
migrations/0001_init.sql    Esquema de D1
scripts/                    build-template.mjs y prospect.mjs (opcional, por terminal)
wrangler.toml               Configuración: base de datos y variables
```

## Desplegar (primera vez)

### 1. Base de datos D1
1. Cloudflare → **Storage & Databases → D1 SQL Database → Create**. Nombre: `dynerox-dataroom`.
2. Copia el **Database ID**.
3. Abre la pestaña **Console** de la base, pega todo el contenido de `migrations/0001_init.sql` y ejecútalo.
   (Si prefieres terminal: `npm run db:migrate`. Usa una de las dos formas, no ambas.)
4. En GitHub, edita `wrangler.toml` y reemplaza `REPLACE_WITH_DATABASE_ID` por el ID. Commit.

### 2. Proyecto de Pages conectado a GitHub
1. Cloudflare → **Workers & Pages → Create → Pages → Connect to Git** y elige este repositorio.
2. Configuración de build:
   - Framework preset: **None**
   - Build command: *(vacío)*
   - Build output directory: `public`
3. **Save and Deploy**.
4. En el proyecto → **Settings → Variables and Secrets**, agrega para **Production**, tipo **Secret**:
   - `IP_SALT`: texto aleatorio largo (40+ caracteres). Sirve para que el hash de la IP no se pueda revertir. No lo cambies después o las redes dejarán de coincidir.
   - `ADMIN_TOKEN`: otro texto aleatorio de 32+ caracteres. Es tu llave temporal del panel.
5. **Deployments → Retry deployment** (o haz cualquier commit) para que tome los secretos.

Las variables normales (`SITE_URL`, `VIDEO_URL`, etc.) viven en `wrangler.toml`. Mientras ese archivo exista, el dashboard las muestra pero no deja editarlas: se cambian con un commit.

### 3. Dominio `pitchdeck.dynerox.com`
1. Proyecto de Pages → **Custom domains → Set up a domain** → `pitchdeck.dynerox.com`.
2. Si los DNS de `dynerox.com` están en Cloudflare, Cloudflare crea el registro solo.
3. Si los DNS están en otro proveedor: **primero** agrega el dominio en Pages (paso 1) y **después** crea en tu proveedor un `CNAME` de `pitchdeck` hacia `<tu-proyecto>.pages.dev`. Al revés da error 522.

### 4. Probar
1. Abre `https://pitchdeck.dynerox.com/admin/`, pega el `ADMIN_TOKEN`.
2. Crea un prospecto de prueba, abre su link en tu teléfono, haz scroll.
3. En el panel debe aparecer 1 apertura. Mándate el link por WhatsApp: la vista previa aparece como "vista previa", no como apertura.

### 5. Proteger el panel con Cloudflare Access (gratis hasta 50 usuarios; tú usas 1)
1. Cloudflare → **Zero Trust**. La primera vez elige un nombre de equipo (queda como `<equipo>.cloudflareaccess.com`) y el plan Free.
2. **Access → Applications → Add an application → Self-hosted**.
   - Dominio: `pitchdeck.dynerox.com`, ruta: `admin`
   - Política: **Allow**, Include → **Emails** → tu correo
   - Método de login: **One-time PIN** (te llega un código al correo)
3. Copia el **Application Audience (AUD) Tag** de la aplicación.
4. En `wrangler.toml` llena:
   ```toml
   ACCESS_TEAM_DOMAIN = "<equipo>.cloudflareaccess.com"
   ACCESS_AUD = "<AUD tag>"
   ADMIN_EMAILS = "tu@correo.com"
   ```
   Commit.
5. Abre `/admin/` en una ventana privada: debe pedirte el código por correo. Cuando funcione, borra el secreto `ADMIN_TOKEN` para que el panel solo abra con Access (también en la dirección `*.pages.dev`).

## Uso diario
- **Sin código (QR o link general):** `pitchdeck.dynerox.com/` muestra la página completa. Esas visitas aparecen en el panel en el renglón **Sin código**. Para apagarlo: panel → Sin código → *Apagar acceso sin código*; entonces `/` muestra "solo por invitación".
- **Nuevo prospecto:** panel → Nuevo link → copiar y mandar.
- **Revocar:** panel → prospecto → Revocar link. El link devuelve 404 al instante.
- **Video:** cuando lo tengas, pon el link de YouTube o Vimeo (sin listar) en `VIDEO_URL` de `wrangler.toml` y haz commit. Sin link, la sección no aparece.
- **Mostrar "Prepared for <nombre>"** bajo el título: `SHOW_PROSPECT_NAME = "true"`.
- **Cambiar la página:** edita `src/page/page.html`, corre `npm run build:template` y haz commit de los dos archivos. O pídeselo a Claude.

## Qué cuenta como apertura
- Cada carga del navegador queda en `page_loads`.
- WhatsApp, Slack, LinkedIn, iMessage, escáneres de correo y bots van a `bot_hits`, aparte.
- Una visita (`visits`) se marca como **persona** solo si el JavaScript corrió y alguien hizo scroll, tocó o usó el teclado al menos 1.2 s después de cargar.
- **Posible reenvío:** el mismo link abierto desde más de un país, más de un tipo de dispositivo o más de 2 redes.

## Privacidad y seguridad
- Las IP nunca se guardan: solo un hash SHA-256 con sal secreta (`IP_SALT`). El pie de página lo avisa.
- `noindex` en meta, `robots.txt` y cabecera `X-Robots-Tag`. Eso evita que Google lo indexe, **pero no es seguridad**. La protección real es el código: 10 caracteres aleatorios, unos 8 × 10^14 combinaciones.
- `Referrer-Policy: strict-origin`: al hacer clic hacia LinkedIn o Telegram, el link `/p/<código>` no viaja en la cabecera Referer.

## Límites del plan gratis (verificados en la documentación de Cloudflare, oct 2026)
- Archivos estáticos: gratis e ilimitados.
- Functions: cuentan contra 100,000 peticiones al día de Workers Free.
- D1: 5 millones de filas leídas y 100,000 escritas al día; desde el 1 sep 2026 las consultas fallan si se rebasa el día. Los eventos se mandan en lotes cada 15 s para gastar poco.

## Fase 2 (NDA)
`requireLevel(context, 'investor')` ya existe y hoy niega todo. La fase 2 agrega: login por correo, aprobación manual, aceptación del NDA con fecha/hora/IP, documentos en R2 con enlaces que caducan y marca de agua, y registro de cada apertura. Todas las rutas nuevas llamarán a la misma función.

## Desarrollo local (opcional)
```bash
npm install
cp .dev.vars.example .dev.vars
npm run db:migrate:local
npm run dev            # http://localhost:8788
npm run prospect -- add "Jane Doe" "Acme" --local
```
