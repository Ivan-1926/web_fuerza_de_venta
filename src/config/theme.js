export const colors = {
  azulOscuro: '#003DA5',
  azulMedio: '#0057B8',
  amarillo: '#FFD100',
  amarilloOscuro: '#E6BC00',
  blanco: '#FFFFFF',
  grisClaro: '#F5F7FA',
  grisMedio: '#94A3B8',
  grisOscuro: '#334155',
  negro: '#1E293B',
  premier: '#16A34A',
  teal: '#0D9488',
  naranja: '#EA580C',
  morado: '#7C3AED',
  rosa: '#DB2777',
  verde: '#059669',
};

export const navItems = [
  { id: 'inicio', label: 'Inicio', path: '/', icon: 'home' },
  { id: 'cartera', label: 'Cartera', path: '/cartera', icon: 'briefcase' },
  { id: 'solicitudes', label: 'Solicitudes', path: '/solicitudes', icon: 'file' },
  { id: 'evaluacion', label: 'Evaluación', path: '/evaluacion', icon: 'shield' },
  { id: 'cobranza', label: 'Cobranza', path: '/cobranza', icon: 'coins' },
  { id: 'reportes', label: 'Reportes', path: '/reportes', icon: 'chart' },
];

export const quickAccess = [
  {
    title: 'Cartera del día',
    desc: 'Clientes asignados para visitar hoy.',
    path: '/cartera',
    color: colors.azulOscuro,
    icon: 'briefcase',
  },
  {
    title: 'Nueva solicitud',
    desc: 'Registrar una solicitud de crédito.',
    path: '/solicitudes',
    color: colors.teal,
    icon: 'plus',
  },
  {
    title: 'Pre-evaluar / Buró',
    desc: 'Capacidad de pago y listas negras.',
    path: '/evaluacion',
    color: colors.morado,
    icon: 'shield',
  },
  {
    title: 'Cobranza',
    desc: 'Gestión de mora del día.',
    path: '/cobranza',
    color: colors.naranja,
    icon: 'coins',
  },
  {
    title: 'Mis solicitudes',
    desc: 'Tablero de estado de expedientes.',
    path: '/solicitudes',
    color: colors.rosa,
    icon: 'file',
  },
  {
    title: 'Reportes',
    desc: 'Productividad del equipo.',
    path: '/reportes',
    color: colors.verde,
    icon: 'chart',
  },
];
