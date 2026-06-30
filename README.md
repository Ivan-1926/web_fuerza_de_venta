# Fuerza de Ventas Web — Banco Pichincha

Dashboard web del **supervisor** conectado al **mismo Supabase** que las apps Flutter.

## Stack y requisitos

| Requisito | Versión sugerida |
|-----------|------------------|
| **Node.js** | LTS 20+ — https://nodejs.org |
| **npm** | Incluido con Node |
| **Supabase** | Proyecto `uomaqpphyouzbnestbba` (URL + anon key en `.env`) |

Dependencias del proyecto (se instalan con `npm install`):

- React 19 + Vite 6
- `@supabase/supabase-js`
- Tipografía **Plus Jakarta Sans**
- Paleta Banco Pichincha (azul `#003DA5`, amarillo `#FFD100`)

## Levantar en local (Windows / macOS / Linux)

```powershell
# 1. Clonar e instalar
git clone https://github.com/Ivan-1926/web_fuerza_de_venta.git
cd web_fuerza_de_venta
npm install

# 2. Variables de entorno
copy .env.example .env   # Windows
# cp .env.example .env   # macOS/Linux
```

Contenido de `.env`:

```env
VITE_SUPABASE_URL=https://uomaqpphyouzbnestbba.supabase.co
VITE_SUPABASE_ANON_KEY=sb_publishable_fymmXEWgkQSdaXe-F3_8OA_QK6ZOnCe
```

```powershell
# 3. Servidor de desarrollo
npm run dev
```

Abrir: **http://localhost:5173/login**

Build producción:

```powershell
npm run build
npm run preview
```

## Login y credenciales (docente)

Pantalla de login en **`/login`** (Supabase Auth). Botón **Rellenar credenciales demo** incluido.

| Rol | Usuario | Contraseña |
|-----|---------|------------|
| **Supervisor** (web) | `supervisor@pichincha.com` | `cyA675ytji` |

Tras ingresar → **Solicitudes** → **Aprobar** / **Rechazar**.

Tabla completa de las **3 aplicaciones** (cliente, asesor móvil, supervisor web):
**[CREDENCIALES_DEMO.md](./CREDENCIALES_DEMO.md)**.

## SQL en Supabase (antes de la demo)

Ejecutar en **SQL Editor**, en orden (repo `Teoria_Fuerza_de_venta`):

1. `supabase/schema_and_seed.sql`
2. `supabase/02_rubrica_integracion.sql`
3. `supabase/03_usuarios_demo_docente.sql`

App cliente (`APP_TEORIA_PICHINCHA`): scripts `02`, `03`, `04` en `banco_pichincha/supabase/`.

Crear usuarios Auth (opcional, login real en móvil):

- `supervisor@pichincha.com` / `cyA675ytji`
- `asesor@pichincha.com` / `cyA675ytji`

## Sincronización con las apps Flutter

| Vista web | Tabla | Origen |
|-----------|-------|--------|
| Cartera | `fv_clients` | Apps FV + seed |
| Solicitudes | `fv_credit_applications` | App **cliente** (Contratar) |
| Evaluación | `fichas_campo` + `consultas_buro` | App móvil FV |
| Cobranza | `fv_clients` (mora) | Apps FV + seed |
| Reportes | `historial_crediticio` + KPIs | Web + seed Caso 1 |
| E2E | `sync_log` / `sync_outbox` | Trigger al aprobar |

## Integración End-to-End

1. **Cliente** solicita crédito en `banco_pichincha` → `fv_credit_applications` (`enviado`).
2. **Asesor** (app móvil) acepta y envía a comité.
3. **Supervisor** (esta web) pulsa **Aprobar** → `status = aprobado` → `sync_outbox`.
4. **Cliente** refresca inicio → `rpc_procesar_sync_outbox` → crédito visible.

## RBAC

Solo el rol **supervisor** (o **admin**) ve botones Aprobar/Rechazar en Solicitudes.
El asesor de campo usa la **app móvil**, no esta web.

## Caso demo — DNI 40118120

Historia crediticia de **Anaximandro Quispe** para el módulo **Reportes**:

1. Registro en app cliente (24/06/2026)
2. Solicitud S/1.000 — capital de trabajo (25/06/2026)
3. Consulta buró — score 712, sin mora (27/06/2026)
4. Evaluación F1-F5 — score 79, segmento ESTANDAR (28/06/2026)
5. En comité — pendiente de aprobación supervisor

Script SQL: `supabase/scripts/06_historia_cliente_40118120.sql`

## Repositorio

https://github.com/Ivan-1926/web_fuerza_de_venta.git
