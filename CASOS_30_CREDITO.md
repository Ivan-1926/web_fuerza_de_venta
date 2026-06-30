# 30 Casos — Crédito Empresarial Microempresa

Fuente: `ENUNCIADOS_30_CASOS_CREDITO_FLUJO_MOVIL.pdf`

## Instalación en Supabase

Ejecutar en **SQL Editor**, **en este orden** (dos pasos):

### Paso 1 — Crear tablas (obligatorio)
`00_setup_tablas.sql`

Si ves el error `relation "creditos_preaprobados" does not exist`, es porque falta este paso.

### Paso 2 — Cargar los 30 casos
`08_seed_30_casos.sql`

Opcional antes del paso 2:
- `banco_pichincha/supabase/05_tea_microempresa_rpc.sql`

Regenerar el seed tras cambios:

```bash
node scripts/generate_30_casos.mjs
```

## Resumen de decisiones

| Resultado | Casos |
|-----------|-------|
| **APROBADO** | 1–24 |
| **CONDICIONADO** (monto reducido) | 25, 26, 27 |
| **RECHAZADO** | 28 (lista inhabilitados), 29 (capacidad de pago), 30 (DUDOSO + mora) |

## Buró simulado (último dígito del DNI)

| Dígito | Calificación | Deuda ref. | Mora |
|--------|--------------|------------|------|
| 0 | NORMAL | S/ 4,500 | 0 |
| 1 | NORMAL | S/ 12,000 | 0 |
| 2 | CPP | S/ 18,000 | 15 d |
| 3 | NORMAL | S/ 0 | 0 |
| 4 | DUDOSO | S/ 25,000 | 95 d |
| 5 | DEFICIENTE | S/ 16,000 | 45 d |
| 6 | NORMAL | S/ 6,000 | 0 |
| 7 | PERDIDA + inhabilitados | S/ 40,000 | 210 d |
| 8 | CPP | S/ 9,000 | 20 d |
| 9 | NORMAL | S/ 14,000 | 0 |

## Caso 1 (demo docente)

| Campo | Valor |
|-------|-------|
| Cliente | Anaximandro Quispe |
| DNI | **40118120** |
| Teléfono | 964110201 |
| Negocio | Bodega Don Anaxi, El Tambo |
| Monto | S/ 1,000 · 12 meses |
| TEA | 43.92% (sin seguro) |
| Cuota | S/ 100.95 |
| Decisión | APROBADO |

## Todos los DNIs (registro app cliente)

| # | DNI | Cliente | Decisión |
|---|-----|---------|----------|
| 1 | 40118120 | Anaximandro Quispe | APROBADO |
| 2 | 41223341 | Eulalia Mamani | APROBADO |
| 3 | 42330336 | Teofilo Huaman | APROBADO |
| 4 | 43440349 | Casandra Flores | APROBADO |
| 5 | 40556071 | Demostenes Rojas | APROBADO |
| 6 | 41669066 | Hipatia Condori | APROBADO |
| 7 | 43773379 | Anibal Vargas | APROBADO |
| 8 | 40886086 | Penelope Apaza | APROBADO |
| 9 | 41990091 | Heraclito Ccahua | APROBADO |
| 10 | 43003039 | Cleopatra Soto | APROBADO |
| 11 | 40110010 | Esquilo Ramos | APROBADO |
| 12 | 41226021 | Ariadna Quispe | APROBADO |
| 13 | 43336033 | Sofocles Huanca | APROBADO |
| 14 | 40550055 | Casiopea Torres | APROBADO |
| 15 | 41669166 | Aristofanes Cruz | APROBADO |
| 16 | 43880088 | Calipso Mendoza | APROBADO |
| 17 | 40119019 | Demetrio Quispe | APROBADO |
| 18 | 41226126 | Antigona Flores | APROBADO |
| 19 | 43339033 | Pitagoras Rojas | APROBADO |
| 20 | 40556056 | Berenice Apaza | APROBADO |
| 21 | 43889089 | Anaxagoras Huaman | APROBADO |
| 22 | 41003001 | Climene Vargas | APROBADO |
| 23 | 40115011 | Epaminondas Soto | APROBADO |
| 24 | 41336036 | Lisistrata Ramos | APROBADO |
| 25 | 41552052 | Filoctetes Cruz | CONDICIONADO → S/ 7,000 |
| 26 | 41888088 | Calirroe Mendoza | CONDICIONADO → S/ 10,000 |
| 27 | 42220022 | Tucidides Quispe | CONDICIONADO → S/ 14,000 |
| 28 | 43337037 | Aquiles Mamani | RECHAZADO (inhabilitados) |
| 29 | 41884084 | Medea Apaza | RECHAZADO (capacidad pago) |
| 30 | 43334034 | Esquines Rojas | RECHAZADO (DUDOSO) |

## Flujo estudiante

1. **App cliente** — Registrarse con DNI del caso → solicitar **Crédito Empresarial — Microempresa**
2. **App FV** — Aceptar → visita → buró → documentos → **Enviar a comité**
3. **Web supervisor** — Aprobar / Rechazar (casos condicionados: aprobar monto reducido manualmente)
