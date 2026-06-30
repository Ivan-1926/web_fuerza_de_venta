-- ============================================================
-- Script 00: CREAR TABLAS (ejecutar ANTES del 08_seed_30_casos.sql)
-- Supabase → SQL Editor → pegar todo → Run
-- ============================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ─── Web: cartera y evaluación ───────────────────────────────
CREATE TABLE IF NOT EXISTS public.creditos_preaprobados (
  id TEXT PRIMARY KEY,
  nombres TEXT NOT NULL,
  apellidos TEXT NOT NULL,
  cedula TEXT,
  telefono TEXT,
  distrito TEXT,
  tipo_negocio TEXT,
  direccion_negocio TEXT,
  latitud DOUBLE PRECISION,
  longitud DOUBLE PRECISION,
  segmento TEXT CHECK (segmento IN ('PREMIER', 'ESTANDAR', 'BASICO', 'NO_APLICA')),
  score_transaccional DOUBLE PRECISION DEFAULT 0,
  monto_hipotesis DOUBLE PRECISION DEFAULT 0,
  estado TEXT DEFAULT 'pendiente',
  es_renovacion BOOLEAN DEFAULT FALSE,
  fecha_vencimiento_credito DATE,
  monto_credito_anterior DOUBLE PRECISION DEFAULT 0,
  numero_credito_anterior TEXT,
  asesor_id UUID,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.fichas_campo (
  id TEXT PRIMARY KEY,
  cliente_id TEXT NOT NULL REFERENCES public.creditos_preaprobados(id) ON DELETE CASCADE,
  negocio_verificado BOOLEAN DEFAULT FALSE,
  antiguedad_meses INTEGER DEFAULT 0,
  tenencia_local TEXT,
  ventas_diarias DOUBLE PRECISION DEFAULT 0,
  gastos_fijos DOUBLE PRECISION DEFAULT 0,
  consistencia_cuenta BOOLEAN DEFAULT FALSE,
  prestamos_informales BOOLEAN DEFAULT FALSE,
  pandero_junta BOOLEAN DEFAULT FALSE,
  stock_visible BOOLEAN DEFAULT FALSE,
  activos_hogar DOUBLE PRECISION DEFAULT 0,
  caracter TEXT DEFAULT 'sinPenalidad',
  score_f1 DOUBLE PRECISION DEFAULT 0,
  score_f2 DOUBLE PRECISION DEFAULT 0,
  score_f3 DOUBLE PRECISION DEFAULT 0,
  score_f4 DOUBLE PRECISION DEFAULT 0,
  score_final DOUBLE PRECISION DEFAULT 0,
  segmento_resultante TEXT,
  monto_propuesto DOUBLE PRECISION DEFAULT 0,
  plazo_meses INTEGER DEFAULT 12,
  cuota_estimada DOUBLE PRECISION DEFAULT 0,
  recomendacion TEXT,
  completada BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.historial_visitas (
  id TEXT PRIMARY KEY,
  cliente_id TEXT NOT NULL REFERENCES public.creditos_preaprobados(id) ON DELETE CASCADE,
  cliente_nombre TEXT,
  fecha TIMESTAMPTZ DEFAULT NOW(),
  resultado TEXT,
  score_final DOUBLE PRECISION,
  segmento TEXT,
  monto_propuesto DOUBLE PRECISION,
  observaciones TEXT,
  asesor_id UUID,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.solicitudes_credito (
  id TEXT PRIMARY KEY,
  cliente_id TEXT NOT NULL REFERENCES public.creditos_preaprobados(id) ON DELETE CASCADE,
  monto_solicitado DOUBLE PRECISION DEFAULT 0,
  plazo_meses INTEGER DEFAULT 12,
  destino_fondos TEXT,
  tipo_garantia TEXT,
  referencia_personal TEXT,
  referencia_comercial TEXT,
  observaciones TEXT,
  estado TEXT DEFAULT 'borrador',
  transmitida BOOLEAN DEFAULT FALSE,
  asesor_id UUID,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.consultas_buro (
  id TEXT PRIMARY KEY,
  cliente_id TEXT NOT NULL REFERENCES public.creditos_preaprobados(id) ON DELETE CASCADE,
  cedula TEXT,
  score_buro INTEGER,
  deudas_vigentes DOUBLE PRECISION DEFAULT 0,
  morosidad TEXT,
  recomendacion TEXT,
  fecha_consulta TIMESTAMPTZ DEFAULT NOW(),
  asesor_id UUID
);

CREATE TABLE IF NOT EXISTS public.productos_activos (
  id TEXT PRIMARY KEY,
  cliente_id TEXT NOT NULL REFERENCES public.creditos_preaprobados(id) ON DELETE CASCADE,
  nombre TEXT,
  numero_operacion TEXT,
  monto DOUBLE PRECISION,
  saldo DOUBLE PRECISION,
  estado TEXT,
  fecha_desembolso DATE,
  fecha_vencimiento DATE
);

CREATE TABLE IF NOT EXISTS public.historial_crediticio (
  id TEXT PRIMARY KEY,
  cliente_id TEXT NOT NULL REFERENCES public.creditos_preaprobados(id) ON DELETE CASCADE,
  fecha DATE,
  tipo TEXT,
  monto DOUBLE PRECISION,
  estado TEXT,
  observacion TEXT
);

-- ─── Apps Flutter: tablas fv_* ───────────────────────────────
CREATE TABLE IF NOT EXISTS public.fv_clients (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  dni TEXT,
  phone TEXT,
  email TEXT,
  address TEXT,
  lat DOUBLE PRECISION,
  lng DOUBLE PRECISION,
  business_name TEXT,
  business_sector TEXT,
  business_address TEXT,
  monthly_income NUMERIC(12,2) DEFAULT 0,
  business_age_years INT DEFAULT 0,
  credit_score INT DEFAULT 650,
  sbs_score INT,
  total_debt NUMERIC(12,2) DEFAULT 0,
  max_debt NUMERIC(12,2) DEFAULT 0,
  days_overdue INT DEFAULT 0,
  status TEXT DEFAULT 'active',
  blacklist_reason TEXT,
  officer_id TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Migración: añadir columnas si fv_clients ya existía con esquema reducido
ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS phone TEXT;
ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS lat DOUBLE PRECISION;
ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS lng DOUBLE PRECISION;
ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS business_sector TEXT;
ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS address TEXT;
ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS monthly_income NUMERIC(12,2);
ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS business_age_years INT;
ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS blacklist_reason TEXT;

CREATE TABLE IF NOT EXISTS public.fv_credit_applications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_id UUID REFERENCES public.fv_clients(id) ON DELETE SET NULL,
  client_name TEXT NOT NULL,
  client_dni TEXT,
  amount NUMERIC(12,2) NOT NULL,
  term_months INT DEFAULT 12,
  tea NUMERIC(6,2) DEFAULT 18,
  monthly_payment NUMERIC(12,2),
  purpose TEXT,
  business_name TEXT,
  monthly_income NUMERIC(12,2),
  status TEXT NOT NULL DEFAULT 'enviado',
  officer_id TEXT,
  notes TEXT,
  collateral TEXT,
  document_urls JSONB,
  submitted_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.fv_daily_portfolio (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  client_id UUID REFERENCES public.fv_clients(id) ON DELETE CASCADE,
  client_name TEXT NOT NULL,
  officer_id TEXT,
  next_visit_date DATE DEFAULT CURRENT_DATE,
  loan_balance NUMERIC(12,2) DEFAULT 0,
  days_overdue INT DEFAULT 0,
  loan_number TEXT,
  purpose TEXT,
  renewal_type TEXT DEFAULT 'new',
  priority INT DEFAULT 1,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.fv_route_visits (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  officer_id TEXT,
  client_id UUID REFERENCES public.fv_clients(id) ON DELETE CASCADE,
  client_name TEXT NOT NULL,
  visit_date DATE DEFAULT CURRENT_DATE,
  visit_order INT DEFAULT 1,
  address TEXT,
  lat DOUBLE PRECISION,
  lng DOUBLE PRECISION,
  estimated_time TEXT,
  visit_status TEXT DEFAULT 'pending',
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.fv_blacklist (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  dni TEXT UNIQUE NOT NULL,
  reason TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ─── RLS permisivo (desarrollo / demo académico) ─────────────
ALTER TABLE public.creditos_preaprobados ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.fichas_campo ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.historial_visitas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.solicitudes_credito ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.consultas_buro ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.productos_activos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.historial_crediticio ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.fv_clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.fv_credit_applications ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.fv_daily_portfolio ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.fv_route_visits ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.fv_blacklist ENABLE ROW LEVEL SECURITY;

DO $$
DECLARE t TEXT;
  web_tables TEXT[] := ARRAY[
    'creditos_preaprobados','fichas_campo','historial_visitas',
    'solicitudes_credito','consultas_buro','productos_activos','historial_crediticio'
  ];
  fv_tables TEXT[] := ARRAY[
    'fv_clients','fv_credit_applications','fv_daily_portfolio',
    'fv_route_visits','fv_blacklist'
  ];
BEGIN
  FOREACH t IN ARRAY web_tables LOOP
    EXECUTE format('DROP POLICY IF EXISTS "demo_all_%s" ON public.%I', t, t);
    EXECUTE format(
      'CREATE POLICY "demo_all_%s" ON public.%I FOR ALL TO anon, authenticated USING (true) WITH CHECK (true)',
      t, t
    );
  END LOOP;
  FOREACH t IN ARRAY fv_tables LOOP
    EXECUTE format('DROP POLICY IF EXISTS "demo_all_%s" ON public.%I', t, t);
    EXECUTE format(
      'CREATE POLICY "demo_all_%s" ON public.%I FOR ALL TO anon, authenticated USING (true) WITH CHECK (true)',
      t, t
    );
  END LOOP;
END $$;

CREATE INDEX IF NOT EXISTS idx_creditos_cedula ON public.creditos_preaprobados(cedula);
CREATE INDEX IF NOT EXISTS idx_fv_clients_dni ON public.fv_clients(dni);
CREATE INDEX IF NOT EXISTS idx_fv_apps_dni ON public.fv_credit_applications(client_dni);

SELECT 'Tablas listas — ahora ejecuta 08_seed_30_casos.sql' AS mensaje;
