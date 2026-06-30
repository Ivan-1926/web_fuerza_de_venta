import { createClient } from '@supabase/supabase-js';

const url = import.meta.env.VITE_SUPABASE_URL;
const key = import.meta.env.VITE_SUPABASE_ANON_KEY;

export const isSupabaseConfigured =
  url &&
  key &&
  url !== 'https://tu-proyecto.supabase.co' &&
  !key.includes('tu-anon') &&
  !key.includes('tu-anon-key');

export const supabase = isSupabaseConfigured ? createClient(url, key) : null;

// =============================================================================
// SINCRONIZACIÓN: la web usa las MISMAS tablas que las apps Flutter
//   • Cartera        → public.fv_clients
//   • Solicitudes    → public.fv_credit_applications
//   • Trazabilidad   → public.sync_log (puente E2E hacia la app cliente)
// Mismo proyecto Supabase: uomaqpphyouzbnestbba.supabase.co
// =============================================================================

/** KPIs del dashboard calculados desde las tablas unificadas. */
export async function fetchDashboardKpis() {
  if (!supabase) return getMockKpis();
  try {
    const [appsRes, clientsRes] = await Promise.all([
      supabase.from('fv_credit_applications').select('status, amount, submitted_at'),
      supabase.from('fv_clients').select('id, days_overdue'),
    ]);
    const apps = appsRes.data ?? [];
    const clients = clientsRes.data ?? [];
    const aprobadas = apps.filter((a) =>
      ['aprobado', 'desembolsado'].includes((a.status || '').toLowerCase())
    ).length;
    return {
      visitas_pendientes: clients.filter((c) => (c.days_overdue ?? 0) > 0).length,
      visitas_total_cartera: clients.length,
      gestionadas_hoy: apps.length,
      monto_cartera: apps.reduce((s, a) => s + Number(a.amount || 0), 0),
      solicitudes_aprobadas: aprobadas,
      solicitudes_mes: apps.length,
    };
  } catch (e) {
    console.warn('[Supabase]', e.message);
    return getMockKpis();
  }
}

/** Cartera de clientes (tabla clients, compartida con app FV). */
export async function fetchCartera(limit = 100) {
  if (!supabase) return getMockCartera();
  const { data, error } = await supabase
    .from('fv_clients')
    .select('*')
    .order('name', { ascending: true })
    .limit(limit);
  if (error) {
    console.warn('[Supabase]', error.message);
    return getMockCartera();
  }
  return data ?? [];
}

/** Solicitudes de crédito (originadas en app cliente o app FV). */
export async function fetchSolicitudes(limit = 100) {
  if (!supabase) return getMockSolicitudes();
  const { data, error } = await supabase
    .from('fv_credit_applications')
    .select('*')
    .order('submitted_at', { ascending: false })
    .limit(limit);
  if (error) {
    console.warn('[Supabase]', error.message);
    return getMockSolicitudes();
  }
  return data ?? [];
}

/**
 * Aprueba o rechaza una solicitud. Al aprobar, el trigger
 * `trg_fv_publicar_aprobacion` publica el evento en `sync_outbox` y la app
 * cliente refleja el crédito (integración End-to-End).
 */
export async function actualizarEstadoSolicitud(id, estado) {
  if (!supabase) return { ok: false, demo: true };
  const { error } = await supabase
    .from('fv_credit_applications')
    .update({ status: estado, updated_at: new Date().toISOString() })
    .eq('id', id);
  if (error) return { ok: false, error: error.message };
  return { ok: true };
}

/** Trazabilidad del puente E2E (eventos publicados hacia la app cliente). */
export async function fetchSyncLog(limit = 8) {
  if (!supabase) return [];
  const { data, error } = await supabase
    .from('sync_log')
    .select('*')
    .order('created_at', { ascending: false })
    .limit(limit);
  if (error) {
    console.warn('[Supabase]', error.message);
    return [];
  }
  return data ?? [];
}

// ─── AUTH (login web supervisor / asesor) ───────────────────────────────────

const KNOWN_PROFILES = {
  'supervisor@pichincha.com': {
    nombres: 'María',
    apellidos: 'Supervisor',
    rol: 'supervisor',
    perfil: 'Supervisor de Crédito',
  },
  'asesor@pichincha.com': {
    nombres: 'Carlos',
    apellidos: 'Mendoza',
    rol: 'asesor',
    perfil: 'Oficial de Crédito Principal',
  },
};

function buildUser(email, profile, authId) {
  const name = `${profile.nombres} ${profile.apellidos}`.trim();
  const initials = name
    .split(' ')
    .filter(Boolean)
    .slice(0, 2)
    .map((p) => p[0]?.toUpperCase() ?? '')
    .join('');
  return {
    id: authId || email,
    email,
    name,
    role: profile.rol === 'supervisor' ? 'Supervisor' : 'Asesor',
    rol: profile.rol,
    perfil: profile.perfil,
    initials: initials || 'FV',
  };
}

async function fetchAdvisorProfileByEmail(email) {
  const clean = email.trim().toLowerCase();
  if (!clean) return null;

  if (supabase) {
    try {
      const { data, error } = await supabase
        .from('asesores_negocio')
        .select('nombres, apellidos, rol, nivel, activo, email')
        .ilike('email', clean)
        .maybeSingle();
      if (!error && data && data.activo !== false) {
        return {
          nombres: data.nombres || '',
          apellidos: data.apellidos || '',
          rol: data.rol || 'asesor',
          perfil: data.nivel || '',
        };
      }
    } catch (e) {
      console.warn('[Supabase] perfil asesor:', e.message);
    }
  }

  return KNOWN_PROFILES[clean] || null;
}

function profileFromAuthUser(user) {
  const meta = user?.user_metadata || {};
  const known = KNOWN_PROFILES[user?.email?.trim().toLowerCase()];
  if (known) return known;
  const rol = meta.rol || 'asesor';
  const nombre = (meta.nombre || user?.email?.split('@')[0] || 'Usuario').trim();
  const parts = nombre.split(/\s+/);
  return {
    nombres: parts[0] || nombre,
    apellidos: parts.slice(1).join(' ') || '',
    rol,
    perfil: rol === 'supervisor' ? 'Supervisor de Crédito' : 'Oficial de Crédito',
  };
}

export async function getSessionUser() {
  if (!supabase) {
    const raw = sessionStorage.getItem('fv_web_mock_user');
    return raw ? JSON.parse(raw) : null;
  }
  const { data } = await supabase.auth.getSession();
  const session = data?.session;
  if (!session?.user?.email) return null;
  const profile = await fetchAdvisorProfileByEmail(session.user.email);
  if (!profile) {
    return buildUser(session.user.email, profileFromAuthUser(session.user), session.user.id);
  }
  return buildUser(session.user.email, profile, session.user.id);
}

export function subscribeAuthChanges(callback) {
  if (!supabase) return () => {};
  const { data } = supabase.auth.onAuthStateChange(async (_event, session) => {
    if (!session?.user?.email) {
      callback(null);
      return;
    }
    const profile = await fetchAdvisorProfileByEmail(session.user.email);
    callback(
      profile
        ? buildUser(session.user.email, profile, session.user.id)
        : buildUser(session.user.email, profileFromAuthUser(session.user), session.user.id)
    );
  });
  return () => data.subscription.unsubscribe();
}

export async function signInAdvisor(email, password) {
  const cleanEmail = email.trim().toLowerCase();

  if (!supabase) {
    if (
      cleanEmail === 'supervisor@pichincha.com' &&
      password === 'cyA675ytji'
    ) {
      const user = buildUser(cleanEmail, KNOWN_PROFILES[cleanEmail], 'mock-supervisor');
      sessionStorage.setItem('fv_web_mock_user', JSON.stringify(user));
      return { ok: true, user };
    }
    if (cleanEmail === 'asesor@pichincha.com' && password === 'cyA675ytji') {
      const user = buildUser(cleanEmail, KNOWN_PROFILES[cleanEmail], 'mock-asesor');
      sessionStorage.setItem('fv_web_mock_user', JSON.stringify(user));
      return { ok: true, user };
    }
    return { ok: false, error: 'Correo o contraseña incorrectos.' };
  }

  const { data, error } = await supabase.auth.signInWithPassword({
    email: cleanEmail,
    password,
  });
  if (error) {
    const msg = error.message.toLowerCase().includes('invalid')
      ? 'Correo o contraseña incorrectos.'
      : error.message;
    // Respaldo académico si Auth aún no tiene el usuario (sin ejecutar script 04)
    if (
      cleanEmail === 'asesor@pichincha.com' ||
      cleanEmail === 'supervisor@pichincha.com'
    ) {
      if (password === 'cyA675ytji' && KNOWN_PROFILES[cleanEmail]) {
        const user = buildUser(cleanEmail, KNOWN_PROFILES[cleanEmail], `local-${cleanEmail}`);
        sessionStorage.setItem('fv_web_mock_user', JSON.stringify(user));
        return { ok: true, user };
      }
    }
    return { ok: false, error: msg };
  }

  let profile = await fetchAdvisorProfileByEmail(data.user.email);
  if (!profile) {
    profile = profileFromAuthUser(data.user);
  }

  return { ok: true, user: buildUser(data.user.email, profile, data.user.id) };
}

export async function signOutAdvisor() {
  sessionStorage.removeItem('fv_web_mock_user');
  if (supabase) await supabase.auth.signOut();
}

/** Fichas de evaluación en campo + consultas de buró. */
export async function fetchEvaluaciones(limit = 50) {
  if (!supabase) return getMockEvaluaciones();
  try {
    const [fichasRes, buroRes] = await Promise.all([
      supabase
        .from('fichas_campo')
        .select('*, creditos_preaprobados(nombres, apellidos, cedula, tipo_negocio, distrito)')
        .order('updated_at', { ascending: false })
        .limit(limit),
      supabase
        .from('consultas_buro')
        .select('*')
        .order('fecha_consulta', { ascending: false })
        .limit(limit),
    ]);
    if (fichasRes.error) throw fichasRes.error;
    const buroMap = {};
    for (const b of buroRes.data ?? []) {
      buroMap[b.cliente_id] = b;
    }
    return (fichasRes.data ?? []).map((f) => ({
      ...f,
      cliente: f.creditos_preaprobados,
      buro: buroMap[f.cliente_id] || null,
    }));
  } catch (e) {
    console.warn('[Supabase] evaluaciones:', e.message);
    return getMockEvaluaciones();
  }
}

/** Cartera en mora (prioridad de cobranza del día). */
export async function fetchCobranza(limit = 100) {
  if (!supabase) return getMockCobranza();
  const { data, error } = await supabase
    .from('fv_clients')
    .select('*')
    .gt('days_overdue', 0)
    .order('days_overdue', { ascending: false })
    .limit(limit);
  if (error) {
    console.warn('[Supabase] cobranza:', error.message);
    return getMockCobranza();
  }
  return data ?? [];
}

/** KPIs consolidados para reportes. */
export async function fetchReportesKpis() {
  if (!supabase) return getMockReportesKpis();
  try {
    const { data, error } = await supabase.from('v_dashboard_kpis').select('*').maybeSingle();
    if (error) throw error;
    if (data) return data;
  } catch (e) {
    console.warn('[Supabase] reportes KPIs:', e.message);
  }
  return getMockReportesKpis();
}

/** Historia crediticia completa de un cliente por DNI. */
export async function fetchReporteCliente(dni) {
  const clean = (dni || '').trim();
  if (!clean) return null;
  if (!supabase) return getMockReporteCliente(clean);

  try {
    const { data: cliente, error: cErr } = await supabase
      .from('creditos_preaprobados')
      .select('*')
      .eq('cedula', clean)
      .maybeSingle();
    if (cErr) throw cErr;
    if (!cliente) {
      const { data: fvClient } = await supabase
        .from('fv_clients')
        .select('*')
        .eq('dni', clean)
        .maybeSingle();
      if (!fvClient) return null;
      return buildReporteFromFvClient(fvClient);
    }

    const [ficha, buro, visitas, historial, productos, solicitudes, fvSol] = await Promise.all([
      supabase.from('fichas_campo').select('*').eq('cliente_id', cliente.id).maybeSingle(),
      supabase.from('consultas_buro').select('*').eq('cliente_id', cliente.id).maybeSingle(),
      supabase
        .from('historial_visitas')
        .select('*')
        .eq('cliente_id', cliente.id)
        .order('fecha', { ascending: false }),
      supabase
        .from('historial_crediticio')
        .select('*')
        .eq('cliente_id', cliente.id)
        .order('fecha', { ascending: false }),
      supabase.from('productos_activos').select('*').eq('cliente_id', cliente.id),
      supabase.from('solicitudes_credito').select('*').eq('cliente_id', cliente.id),
      supabase
        .from('fv_credit_applications')
        .select('*')
        .eq('client_dni', clean)
        .order('submitted_at', { ascending: false }),
    ]);

    return {
      dni: clean,
      nombre: `${cliente.nombres} ${cliente.apellidos}`.trim(),
      negocio: cliente.tipo_negocio,
      distrito: cliente.distrito,
      segmento: cliente.segmento,
      estado: cliente.estado,
      score_transaccional: cliente.score_transaccional,
      ficha: ficha.data,
      buro: buro.data,
      visitas: visitas.data ?? [],
      historial: historial.data ?? [],
      productos: productos.data ?? [],
      solicitudes: solicitudes.data ?? [],
      solicitudes_fv: fvSol.data ?? [],
    };
  } catch (e) {
    console.warn('[Supabase] reporte cliente:', e.message);
    return getMockReporteCliente(clean);
  }
}

function buildReporteFromFvClient(c) {
  return {
    dni: c.dni,
    nombre: c.name,
    negocio: c.business_name,
    distrito: c.district || '-',
    segmento: c.segment || 'ESTANDAR',
    estado: c.status,
    score_transaccional: c.credit_score,
    ficha: null,
    buro: null,
    visitas: [],
    historial: [],
    productos: c.total_debt
      ? [{ nombre: 'Crédito activo', saldo: c.total_debt, estado: c.days_overdue > 0 ? 'Mora' : 'Vigente' }]
      : [],
    solicitudes: [],
    solicitudes_fv: [],
  };
}

export const CASO_DEMO_DNI = '40118120';

// ─── MOCKS (sólo si no hay .env configurado) ─────────────────────────────────

function getMockKpis() {
  return {
    visitas_pendientes: 2,
    visitas_total_cartera: 4,
    gestionadas_hoy: 4,
    monto_cartera: 31700,
    solicitudes_aprobadas: 1,
    solicitudes_mes: 4,
  };
}

function getMockCartera() {
  return [
    {
      id: 'c1',
      name: 'María Elena Vásquez',
      dni: '1712345678',
      business_name: 'Panadería La Espiga',
      credit_score: 720,
      total_debt: 3200,
      days_overdue: 0,
      status: 'active',
    },
    {
      id: 'c2',
      name: 'Patricia Gómez',
      dni: '1799887766',
      business_name: 'Farmacia Salud',
      credit_score: 590,
      total_debt: 12000,
      days_overdue: 45,
      status: 'active',
    },
  ];
}

function getMockSolicitudes() {
  return [
    {
      id: 'sol-001',
      client_name: 'María Elena Vásquez',
      client_dni: '1712345678',
      amount: 8500,
      term_months: 18,
      status: 'enviado',
    },
    {
      id: 'sol-caso1',
      client_name: 'Anaximandro Quispe',
      client_dni: CASO_DEMO_DNI,
      amount: 1000,
      term_months: 12,
      status: 'comite',
    },
  ];
}

function getMockEvaluaciones() {
  return [
    {
      id: 'ficha-caso1',
      cliente_id: 'cli-caso1',
      negocio_verificado: true,
      antiguedad_meses: 36,
      ventas_diarias: 85,
      gastos_fijos: 420,
      score_f1: 82,
      score_f2: 78,
      score_f3: 80,
      score_f4: 76,
      score_final: 79,
      segmento_resultante: 'ESTANDAR',
      monto_propuesto: 1000,
      plazo_meses: 12,
      cuota_estimada: 92.5,
      recomendacion: 'Apto para microcrédito productivo',
      completada: true,
      cliente: {
        nombres: 'Anaximandro',
        apellidos: 'Quispe',
        cedula: CASO_DEMO_DNI,
        tipo_negocio: 'Textilería',
        distrito: 'La Magdalena',
      },
      buro: {
        score_buro: 712,
        deudas_vigentes: 0,
        morosidad: 'Sin mora',
        recomendacion: 'Historial limpio',
      },
    },
    {
      id: 'ficha-002',
      cliente_id: 'cli-004',
      negocio_verificado: true,
      antiguedad_meses: 48,
      score_f1: 88,
      score_f2: 85,
      score_f3: 82,
      score_f4: 86,
      score_final: 85,
      segmento_resultante: 'PREMIER',
      monto_propuesto: 6000,
      plazo_meses: 18,
      cuota_estimada: 385,
      recomendacion: 'Renovación recomendada',
      completada: true,
      cliente: {
        nombres: 'José Luis',
        apellidos: 'Castro Mendoza',
        cedula: '1745678901',
        tipo_negocio: 'Peluquería',
        distrito: 'La Floresta',
      },
      buro: {
        score_buro: 745,
        deudas_vigentes: 1200,
        morosidad: 'Al día',
        recomendacion: 'Buen pagador',
      },
    },
  ];
}

function getMockCobranza() {
  return [
    {
      id: 'c2',
      name: 'Patricia Gómez',
      dni: '1799887766',
      business_name: 'Farmacia Salud',
      total_debt: 12000,
      days_overdue: 45,
      credit_score: 590,
    },
    {
      id: 'c-caso1',
      name: 'Anaximandro Quispe',
      dni: CASO_DEMO_DNI,
      business_name: 'Textilería Quispe',
      total_debt: 420,
      days_overdue: 12,
      credit_score: 712,
    },
  ];
}

function getMockReportesKpis() {
  return {
    visitas_pendientes: 3,
    visitas_total_cartera: 11,
    gestionadas_hoy: 2,
    monto_cartera: 42800,
    solicitudes_aprobadas: 2,
    solicitudes_mes: 5,
  };
}

function getMockReporteCliente(dni) {
  if (dni !== CASO_DEMO_DNI) return null;
  return {
    dni: CASO_DEMO_DNI,
    nombre: 'Anaximandro Quispe',
    negocio: 'Textilería',
    distrito: 'La Magdalena',
    segmento: 'ESTANDAR',
    estado: 'comite',
    score_transaccional: 79,
    ficha: {
      score_f1: 82,
      score_f2: 78,
      score_f3: 80,
      score_f4: 76,
      score_final: 79,
      segmento_resultante: 'ESTANDAR',
      monto_propuesto: 1000,
      plazo_meses: 12,
      cuota_estimada: 92.5,
      recomendacion: 'Apto para microcrédito productivo',
      antiguedad_meses: 36,
      ventas_diarias: 85,
      gastos_fijos: 420,
    },
    buro: {
      score_buro: 712,
      deudas_vigentes: 0,
      morosidad: 'Sin mora',
      recomendacion: 'Historial limpio — sin deudas castigadas',
    },
    visitas: [
      {
        fecha: '2026-06-28T10:30:00Z',
        resultado: 'Evaluado',
        score_final: 79,
        segmento: 'ESTANDAR',
        monto_propuesto: 1000,
        observaciones: 'Negocio estable, stock visible, flujo diario consistente.',
      },
      {
        fecha: '2026-06-25T15:00:00Z',
        resultado: 'Visita inicial',
        score_final: null,
        segmento: null,
        monto_propuesto: null,
        observaciones: 'Cliente registrado desde app móvil. Se agenda evaluación F1-F5.',
      },
    ],
    historial: [
      {
        fecha: '2026-06-28',
        tipo: 'Evaluación campo',
        monto: 1000,
        estado: 'Completado',
        observacion: 'Ficha F1-F5 completada. Score final 79 — segmento ESTANDAR.',
      },
      {
        fecha: '2026-06-27',
        tipo: 'Consulta buró',
        monto: 0,
        estado: 'Completado',
        observacion: 'Score buró 712. Sin morosidad ni deudas vigentes.',
      },
      {
        fecha: '2026-06-25',
        tipo: 'Solicitud crédito',
        monto: 1000,
        estado: 'En comité',
        observacion: 'Solicitud S/1.000 desde app cliente. Destino: capital de trabajo.',
      },
      {
        fecha: '2026-06-24',
        tipo: 'Registro app',
        monto: 0,
        estado: 'Completado',
        observacion: 'Alta en app Banco Pichincha con DNI 40118120.',
      },
    ],
    productos: [
      {
        nombre: 'Microcrédito Emprendimiento',
        numero_operacion: 'CR-2025-4011',
        monto: 800,
        saldo: 420,
        estado: 'Mora leve',
        fecha_desembolso: '2025-09-15',
        fecha_vencimiento: '2026-09-15',
      },
    ],
    solicitudes: [
      {
        monto_solicitado: 1000,
        plazo_meses: 12,
        destino_fondos: 'Capital de trabajo',
        estado: 'comite',
      },
    ],
    solicitudes_fv: [
      {
        amount: 1000,
        term_months: 12,
        status: 'comite',
        submitted_at: '2026-06-25T18:20:00Z',
      },
    ],
  };
}
