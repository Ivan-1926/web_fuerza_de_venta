/**
 * Genera 08_seed_30_casos.sql desde los enunciados académicos (30 casos).
 * Ejecutar: node scripts/generate_30_casos.mjs
 */
import { writeFileSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

const __dir = dirname(fileURLToPath(import.meta.url));

const CASOS = [
  { n:1, nom:'Anaximandro', ape:'Quispe', dni:'40118120', tel:'964110201', neg:'Bodega Don Anaxi', tipo:'Bodega', dist:'El Tambo', ant:48, ing:2200, gas:900, m:1000, pl:12, tea:43.92, seg:false, gar:'sin garantia', dest:'Capital de trabajo: compra de mercaderia', cuota:100.95, lat:-12.0581, lng:-75.2027, pri:1, buro:'NORMAL', ent:1, deu:4500, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:1000 },
  { n:2, nom:'Eulalia', ape:'Mamani', dni:'41223341', tel:'964110202', neg:'Picanteria La Eulalia', tipo:'Restaurante', dist:'Chilca', ant:36, ing:3000, gas:1400, m:3000, pl:12, tea:40.92, seg:true, gar:'sin garantia', dest:'Compra de cocina industrial', cuota:299.59, lat:-12.0921, lng:-75.2105, pri:2, buro:'NORMAL', ent:2, deu:12000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:3000 },
  { n:3, nom:'Teofilo', ape:'Huaman', dni:'42330336', tel:'964110203', neg:'Maderas Huaman', tipo:'Carpinteria', dist:'Pilcomayo', ant:60, ing:4200, gas:1800, m:5000, pl:18, tea:43.92, seg:false, gar:'sin garantia', dest:'Maquinaria: sierra y cepillo', cuota:366.02, lat:-12.0496, lng:-75.2486, pri:2, buro:'NORMAL', ent:1, deu:6000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:5000 },
  { n:4, nom:'Casandra', ape:'Flores', dni:'43440349', tel:'964110204', neg:'Distribuidora Casandra', tipo:'Abarrotes', dist:'Huancayo', ant:84, ing:7000, gas:2600, m:8000, pl:6, tea:43.92, seg:false, gar:'sin garantia', dest:'Reposicion de stock por campana', cuota:1480.73, lat:-12.0651, lng:-75.2049, pri:3, buro:'NORMAL', ent:2, deu:14000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:8000 },
  { n:5, nom:'Demostenes', ape:'Rojas', dni:'40556071', tel:'964110205', neg:'Ferreteria El Constructor', tipo:'Ferreteria', dist:'San Agustin de Cajas', ant:30, ing:5200, gas:2100, m:10000, pl:12, tea:43.92, seg:false, gar:'hipotecaria', dest:'Ampliacion de local', cuota:1009.46, lat:-12.0188, lng:-75.2271, pri:3, buro:'NORMAL', ent:2, deu:12000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:10000 },
  { n:6, nom:'Hipatia', ape:'Condori', dni:'41669066', tel:'964110206', neg:'Confecciones Hipatia', tipo:'Textil', dist:'El Tambo', ant:54, ing:6800, gas:2900, m:12000, pl:24, tea:40.92, seg:true, gar:'hipotecaria', dest:'Compra de maquinas remalladoras', cuota:700.94, lat:-12.0612, lng:-75.2118, pri:2, buro:'NORMAL', ent:1, deu:6000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:12000 },
  { n:7, nom:'Anibal', ape:'Vargas', dni:'43773379', tel:'964110207', neg:'Transportes Anibal', tipo:'Transporte', dist:'Concepcion', ant:42, ing:9500, gas:4200, m:15000, pl:18, tea:43.92, seg:false, gar:'vehicular', dest:'Cuota inicial de vehiculo de carga', cuota:1098.07, lat:-11.9182, lng:-75.3142, pri:3, buro:'NORMAL', ent:2, deu:14000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:15000 },
  { n:8, nom:'Penelope', ape:'Apaza', dni:'40886086', tel:'964110208', neg:'Granja Penelope', tipo:'Avicola', dist:'Sapallanga', ant:72, ing:8800, gas:3600, m:18000, pl:24, tea:43.92, seg:false, gar:'hipotecaria', dest:'Ampliacion de galpon', cuota:1072.10, lat:-12.1581, lng:-75.1762, pri:3, buro:'NORMAL', ent:1, deu:6000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:18000 },
  { n:9, nom:'Heraclito', ape:'Ccahua', dni:'41990091', tel:'964110209', neg:'Importaciones Heraclito', tipo:'Comercio', dist:'Huancayo', ant:96, ing:12000, gas:5000, m:20000, pl:36, tea:43.92, seg:false, gar:'hipotecaria', dest:'Capital para nueva sucursal', cuota:927.12, lat:-12.0668, lng:-75.2103, pri:3, buro:'NORMAL', ent:2, deu:12000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:20000 },
  { n:10, nom:'Cleopatra', ape:'Soto', dni:'43003039', tel:'964110210', neg:'Botica Cleopatra', tipo:'Farmacia', dist:'Chupaca', ant:66, ing:11000, gas:4400, m:25000, pl:24, tea:40.92, seg:true, gar:'hipotecaria', dest:'Equipamiento y stock farmaceutico', cuota:1460.29, lat:-12.056, lng:-75.287, pri:3, buro:'NORMAL', ent:2, deu:14000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:25000 },
  { n:11, nom:'Esquilo', ape:'Ramos', dni:'40110010', tel:'964110211', neg:'Minimarket Esquilo', tipo:'Bodega', dist:'Huayucachi', ant:24, ing:1900, gas:800, m:2000, pl:12, tea:43.92, seg:false, gar:'sin garantia', dest:'Compra de congeladora', cuota:201.89, lat:-12.1339, lng:-75.209, pri:1, buro:'NORMAL', ent:1, deu:4500, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:2000 },
  { n:12, nom:'Ariadna', ape:'Quispe', dni:'41226021', tel:'964110212', neg:'Estilos Ariadna', tipo:'Peluqueria', dist:'El Tambo', ant:40, ing:3300, gas:1300, m:4000, pl:18, tea:43.92, seg:false, gar:'sin garantia', dest:'Mobiliario y equipos de salon', cuota:292.82, lat:-12.0573, lng:-75.2161, pri:2, buro:'NORMAL', ent:2, deu:12000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:4000 },
  { n:13, nom:'Sofocles', ape:'Huanca', dni:'43336033', tel:'964110213', neg:'Panaderia Sofocles', tipo:'Panaderia', dist:'Sicaya', ant:58, ing:5600, gas:2300, m:6000, pl:12, tea:40.92, seg:true, gar:'sin garantia', dest:'Horno rotativo', cuota:599.17, lat:-12.0228, lng:-75.3134, pri:2, buro:'NORMAL', ent:0, deu:0, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:6000 },
  { n:14, nom:'Casiopea', ape:'Torres', dni:'40550055', tel:'964110214', neg:'Taller Casiopea', tipo:'Mecanica', dist:'Pilcomayo', ant:50, ing:7400, gas:3000, m:7500, pl:6, tea:43.92, seg:false, gar:'sin garantia', dest:'Herramienta neumatica', cuota:1388.18, lat:-12.0512, lng:-75.2451, pri:2, buro:'DEFICIENTE', ent:2, deu:16000, mor:45, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:7500 },
  { n:15, nom:'Aristofanes', ape:'Cruz', dni:'41669166', tel:'964110215', neg:'Insumos Aristofanes', tipo:'Agropecuario', dist:'Orcotuna', ant:78, ing:8200, gas:3300, m:9000, pl:24, tea:43.92, seg:false, gar:'hipotecaria', dest:'Capital para campana agricola', cuota:536.05, lat:-11.976, lng:-75.3361, pri:3, buro:'NORMAL', ent:1, deu:6000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:9000 },
  { n:16, nom:'Calipso', ape:'Mendoza', dni:'43880088', tel:'964110216', neg:'Calzados Calipso', tipo:'Calzado', dist:'Huancayo', ant:62, ing:7900, gas:3100, m:11000, pl:18, tea:40.92, seg:true, gar:'hipotecaria', dest:'Compra de cuero y maquinaria', cuota:793.03, lat:-12.0689, lng:-75.2055, pri:2, buro:'CPP', ent:1, deu:9000, mor:20, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:11000 },
  { n:17, nom:'Demetrio', ape:'Quispe', dni:'40119019', tel:'964110217', neg:'Mayorista Demetrio', tipo:'Comercio', dist:'Jauja', ant:90, ing:11500, gas:4700, m:13500, pl:12, tea:43.92, seg:false, gar:'hipotecaria', dest:'Reposicion de inventario mayorista', cuota:1362.77, lat:-11.7752, lng:-75.4995, pri:3, buro:'NORMAL', ent:2, deu:14000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:13500 },
  { n:18, nom:'Antigona', ape:'Flores', dni:'41226126', tel:'964110218', neg:'Recreo Antigona', tipo:'Restaurante', dist:'Concepcion', ant:70, ing:9200, gas:3900, m:16000, pl:36, tea:43.92, seg:false, gar:'hipotecaria', dest:'Ampliacion y remodelacion', cuota:741.70, lat:-11.9201, lng:-75.311, pri:3, buro:'NORMAL', ent:1, deu:6000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:16000 },
  { n:19, nom:'Pitagoras', ape:'Rojas', dni:'43339033', tel:'964110219', neg:'Ferreteria Pitagoras', tipo:'Ferreteria', dist:'El Tambo', ant:100, ing:13000, gas:5200, m:17000, pl:24, tea:40.92, seg:true, gar:'hipotecaria', dest:'Compra de stock estructural', cuota:993.00, lat:-12.0599, lng:-75.2143, pri:3, buro:'NORMAL', ent:0, deu:0, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:17000 },
  { n:20, nom:'Berenice', ape:'Apaza', dni:'40556056', tel:'964110220', neg:'Tejidos Berenice', tipo:'Textil', dist:'San Jeronimo de Tunan', ant:46, ing:8600, gas:3500, m:19000, pl:18, tea:43.92, seg:false, gar:'hipotecaria', dest:'Maquinaria de tejido plano', cuota:1390.89, lat:-11.9871, lng:-75.2899, pri:3, buro:'NORMAL', ent:1, deu:6000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:19000 },
  { n:21, nom:'Anaxagoras', ape:'Huaman', dni:'43889089', tel:'964110221', neg:'Carga Anaxagoras', tipo:'Transporte', dist:'Huancayo', ant:84, ing:14000, gas:5800, m:22000, pl:36, tea:43.92, seg:false, gar:'vehicular', dest:'Cuota inicial de camion', cuota:1019.83, lat:-12.0644, lng:-75.2088, pri:3, buro:'NORMAL', ent:2, deu:14000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:22000 },
  { n:22, nom:'Climene', ape:'Vargas', dni:'41003001', tel:'964110222', neg:'Avicola Climene', tipo:'Avicola', dist:'Sapallanga', ant:76, ing:13500, gas:5500, m:24000, pl:24, tea:40.92, seg:true, gar:'hipotecaria', dest:'Equipamiento de planta', cuota:1401.88, lat:-12.156, lng:-75.179, pri:3, buro:'NORMAL', ent:2, deu:12000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:24000 },
  { n:23, nom:'Epaminondas', ape:'Soto', dni:'40115011', tel:'964110223', neg:'Bodega Epaminondas', tipo:'Bodega', dist:'Pucara', ant:28, ing:2600, gas:1000, m:1500, pl:6, tea:43.92, seg:false, gar:'sin garantia', dest:'Compra de vitrinas', cuota:277.64, lat:-12.1701, lng:-75.1611, pri:1, buro:'NORMAL', ent:2, deu:12000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:1500 },
  { n:24, nom:'Lisistrata', ape:'Ramos', dni:'41336036', tel:'964110224', neg:'Variedades Lisistrata', tipo:'Comercio', dist:'Huancayo', ant:52, ing:4100, gas:1700, m:3500, pl:12, tea:43.92, seg:false, gar:'sin garantia', dest:'Capital de trabajo', cuota:353.31, lat:-12.0633, lng:-75.2071, pri:2, buro:'NORMAL', ent:1, deu:6000, mor:0, blk:false, pre:'APTO', pts:85, dec:'APROBADO', map:3500 },
  { n:25, nom:'Filoctetes', ape:'Cruz', dni:'41552052', tel:'964110225', neg:'Cevicheria Filoctetes', tipo:'Restaurante', dist:'Chilca', ant:18, ing:3800, gas:2200, m:11000, pl:18, tea:40.92, seg:true, gar:'sin garantia', dest:'Ampliacion de local nuevo', cuota:793.03, lat:-12.093, lng:-75.209, pri:2, buro:'CPP', ent:2, deu:18000, mor:15, blk:false, pre:'APTO', pts:85, dec:'CONDICIONADO', map:7000, cuotaAprob:504.66 },
  { n:26, nom:'Calirroe', ape:'Mendoza', dni:'41888088', tel:'964110226', neg:'Calzados Calirroe', tipo:'Calzado', dist:'El Tambo', ant:34, ing:5000, gas:2600, m:16000, pl:24, tea:43.92, seg:false, gar:'hipotecaria', dest:'Maquinaria de mayor capacidad', cuota:952.98, lat:-12.0588, lng:-75.2129, pri:2, buro:'CPP', ent:1, deu:9000, mor:20, blk:false, pre:'APTO', pts:85, dec:'CONDICIONADO', map:10000, cuotaAprob:595.61 },
  { n:27, nom:'Tucidides', ape:'Quispe', dni:'42220022', tel:'964110227', neg:'Ferreteria Tucidides', tipo:'Ferreteria', dist:'Concepcion', ant:40, ing:6200, gas:2900, m:20000, pl:24, tea:40.92, seg:true, gar:'hipotecaria', dest:'Compra de stock y montacarga', cuota:1168.23, lat:-11.9176, lng:-75.3155, pri:3, buro:'CPP', ent:2, deu:18000, mor:15, blk:false, pre:'APTO', pts:85, dec:'CONDICIONADO', map:14000, cuotaAprob:817.76 },
  { n:28, nom:'Aquiles', ape:'Mamani', dni:'43337037', tel:'964110228', neg:'Comercial Aquiles', tipo:'Comercio', dist:'Huancayo', ant:60, ing:9000, gas:3600, m:15000, pl:24, tea:43.92, seg:false, gar:'hipotecaria', dest:'Capital de trabajo', cuota:893.42, lat:-12.0657, lng:-75.2099, pri:3, buro:'PERDIDA', ent:4, deu:40000, mor:210, blk:true, pre:'APTO', pts:85, dec:'RECHAZADO', map:0 },
  { n:29, nom:'Medea', ape:'Apaza', dni:'41884084', tel:'964110229', neg:'Bodega Medea', tipo:'Bodega', dist:'Pilcomayo', ant:22, ing:1800, gas:1100, m:14000, pl:18, tea:43.92, seg:false, gar:'sin garantia', dest:'Compra de camioneta para reparto', cuota:1024.87, lat:-12.0489, lng:-75.247, pri:2, buro:'DUDOSO', ent:3, deu:25000, mor:95, blk:false, pre:'REVISAR', pts:60, dec:'RECHAZADO', map:0 },
  { n:30, nom:'Esquines', ape:'Rojas', dni:'43334034', tel:'964110230', neg:'Fletes Esquines', tipo:'Transporte', dist:'Jauja', ant:30, ing:7000, gas:3200, m:30000, pl:24, tea:43.92, seg:false, gar:'vehicular', dest:'Compra de unidad de transporte', cuota:1786.83, lat:-11.774, lng:-75.501, pri:3, buro:'DUDOSO', ent:3, deu:25000, mor:95, blk:false, pre:'APTO', pts:85, dec:'RECHAZADO', map:0 },
];

function esc(s) {
  return (s ?? '').replace(/'/g, "''");
}

function fvClientId(n) {
  return `50000000-0000-4000-8000-${String(n).padStart(12, '0')}`;
}
function fvSolId(n) {
  return `60000000-0000-4000-8000-${String(n).padStart(12, '0')}`;
}
function fvPortId(n) {
  return `70000000-0000-4000-8000-${String(n).padStart(12, '0')}`;
}
function fvRvId(n) {
  return `80000000-0000-4000-8000-${String(n).padStart(12, '0')}`;
}
function buroScore(buro) {
  return { NORMAL: 712, CPP: 580, DEFICIENTE: 480, DUDOSO: 420, PERDIDA: 350 }[buro] ?? 650;
}

function buroMorosidad(c) {
  if (c.blk) return 'Lista de inhabilitados — bloqueo en buró';
  if (c.mor === 0) return 'Sin mora';
  return `${c.mor} dias de mayor mora`;
}

function fvStatus(c) {
  return 'enviado';
}

const lines = [];
lines.push(`-- ============================================================
-- Script 08: 30 casos académicos — Crédito Empresarial Microempresa
-- Fuente: ENUNCIADOS_30_CASOS_CREDITO_FLUJO_MOVIL.pdf
-- Ejecutar DESPUÉS de: 00_setup_tablas.sql (obligatorio si sale error "does not exist")
-- Generado: ${new Date().toISOString().slice(0, 10)}
-- ============================================================
`);

lines.push('-- ─── creditos_preaprobados (web Evaluación / Reportes) ───');
for (const c of CASOS) {
  const cliWeb = `cli-caso${String(c.n).padStart(2, '0')}`;
  const nombre = `${c.nom} ${c.ape}`;
  lines.push(`INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  '${cliWeb}', '${esc(c.nom)}', '${esc(c.ape)}', '${c.dni}', '${c.tel}', '${esc(c.dist)}',
  '${esc(c.tipo)}', '${esc(c.neg)}', ${c.lat}, ${c.lng}, 'ESTANDAR', ${c.pts},
  ${c.m}, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();`);
}

lines.push('\n-- ─── consultas_buro (resultado esperado por último dígito DNI) ───');
for (const c of CASOS) {
  const id = `buro-caso${String(c.n).padStart(2, '0')}`;
  const cli = `cli-caso${String(c.n).padStart(2, '0')}`;
  const score = buroScore(c.buro);
  lines.push(`INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  '${id}', '${cli}', '${c.dni}', ${score}, ${c.deu},
  '${esc(buroMorosidad(c))}',
  '${esc(c.buro)} — ${c.ent} entidad(es), deuda S/ ${c.deu.toFixed(2)}'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;`);
}

lines.push('\n-- ─── fichas_campo (pre-evaluación esperada) ───');
for (const c of CASOS) {
  const id = `ficha-caso${String(c.n).padStart(2, '0')}`;
  const cli = `cli-caso${String(c.n).padStart(2, '0')}`;
  const cuota = c.cuotaAprob ?? c.cuota;
  const montoProp = c.map > 0 ? c.map : c.m;
  lines.push(`INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  '${id}', '${cli}', TRUE, ${c.ant}, ${Math.round(c.ing / 30)}, ${Math.round(c.gas / 30)},
  85, 84, 86, 85, ${c.pts}, 'ESTANDAR',
  ${montoProp}, ${c.pl}, ${cuota}, '${esc(c.pre)} — Caso ${c.n} (${esc(c.dec)})', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();`);
}

lines.push('\n-- ─── solicitudes_credito (canal web legacy) ───');
for (const c of CASOS) {
  const id = `sol-caso${String(c.n).padStart(2, '0')}`;
  const cli = `cli-caso${String(c.n).padStart(2, '0')}`;
  lines.push(`INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  '${id}', '${cli}', ${c.m}, ${c.pl}, '${esc(c.dest)}', '${esc(c.gar)}', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;`);
}

lines.push('\n-- ─── Compatibilidad: columnas opcionales en tablas fv_* existentes ───');
lines.push(`DO $$ BEGIN
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS phone TEXT;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS lat DOUBLE PRECISION;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS lng DOUBLE PRECISION;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS business_sector TEXT;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS address TEXT;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS monthly_income NUMERIC(12,2);
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS business_age_years INT;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS blacklist_reason TEXT;
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS tea NUMERIC(6,2);
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS monthly_payment NUMERIC(12,2);
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS purpose TEXT;
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS notes TEXT;
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW();
EXCEPTION WHEN undefined_table THEN NULL;
END $$;`);

lines.push('\n-- ─── fv_clients (cartera app Fuerza de Ventas) ───');
lines.push(`DELETE FROM public.fv_clients WHERE dni IN (${CASOS.map((c) => `'${c.dni}'`).join(', ')});`);
for (const c of CASOS) {
  const id = fvClientId(c.n);
  const nombre = `${c.nom} ${c.ape}`;
  const score = buroScore(c.buro);
  const status = c.blk ? 'blacklisted' : 'active';
  lines.push(`INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '${id}'::uuid, '${esc(nombre)}', '${c.dni}', '${esc(c.neg)}', ${score},
  ${c.deu}, ${c.mor}, '${status}'
);`);
}

lines.push('\n-- ─── fv_credit_applications (solicitudes E2E app cliente → web) ───');
lines.push(`DELETE FROM public.fv_credit_applications WHERE client_dni IN (${CASOS.map((c) => `'${c.dni}'`).join(', ')});`);
for (const c of CASOS) {
  const id = fvSolId(c.n);
  const nombre = `${c.nom} ${c.ape}`;
  lines.push(`INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '${id}'::uuid, '${esc(nombre)}', '${c.dni}', ${c.m}, ${c.pl}, '${fvStatus(c)}',
  NOW() - INTERVAL '${31 - c.n} days'
);`);
}

lines.push('\n-- ─── fv_credit_applications (columnas extendidas si existen) ───');
lines.push(`DO $$ BEGIN
  UPDATE public.fv_credit_applications AS a SET
    tea = v.tea,
    monthly_payment = v.cuota,
    purpose = v.purpose
  FROM (VALUES
${CASOS.map((c) => {
  const nombre = `${c.nom} ${c.ape}`;
  const seguro = c.seg ? 'con seguro de desgravamen' : 'sin seguro de desgravamen';
  const purpose = `[Canal: cliente] Crédito Empresarial — Microempresa — ${esc(c.dest)} | TEA ${c.tea}% (${seguro}) | Garantía: ${esc(c.gar)} | Caso ${c.n}`;
  return `    ('${c.dni}', ${c.tea}, ${c.cuota}, '${purpose}')`;
}).join(',\n')}
  ) AS v(dni, tea, cuota, purpose)
  WHERE a.client_dni = v.dni;
EXCEPTION WHEN undefined_column THEN NULL;
END $$;`);

lines.push('\n-- ─── Lista negra (caso 28 — Aquiles Mamani) ───');
lines.push(`INSERT INTO public.fv_blacklist (dni, reason)
VALUES ('43337037', 'Registrado en lista de inhabilitados del sistema financiero (Caso 28)')
ON CONFLICT (dni) DO UPDATE SET reason = EXCLUDED.reason;`);

lines.push('\n-- ─── Verificación ───');
lines.push(`SELECT COUNT(*) AS casos_creditos_preaprobados FROM public.creditos_preaprobados WHERE id LIKE 'cli-caso%';`);
lines.push(`SELECT COUNT(*) AS casos_fv_solicitudes FROM public.fv_credit_applications WHERE client_dni IN (SELECT cedula FROM public.creditos_preaprobados WHERE id LIKE 'cli-caso%');`);

const outPath = join(__dir, '..', 'supabase', 'scripts', '08_seed_30_casos.sql');
writeFileSync(outPath, lines.join('\n\n'), 'utf8');
console.log(`Generado: ${outPath} (${CASOS.length} casos)`);
