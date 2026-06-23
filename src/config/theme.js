export const colors = {
  // Paleta principal profesional
  azulOscuro: '#010831',
  azulMedio: '#0b68c8',
  amarillo: '#ffdd00',
  amarilloClaro: '#fff2a7',
  blanco: '#ffffff',
  grisClaro: '#f9fafc',
  grisMedio: '#64748b',
  grisOscuro: '#334155',
  negro: '#172033',
  // Acentos sofisticados
  cian: '#23b4c7',
  lima: '#b7e65b',
  rosa: '#e65382',
  // Colores de estado
  premier: '#16a34a',
  teal: '#0d9488',
  naranja: '#ea580c',
  morado: '#7c3aed',
  rosaAlternativo: '#db2777',
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
    color: '#E63946',
    icon: 'briefcase',
  },
  {
    title: 'Nueva solicitud',
    desc: 'Registrar una solicitud de crédito.',
    path: '/solicitudes',
    color: '#06A77D',
    icon: 'plus',
  },
  {
    title: 'Pre-evaluar / Buró',
    desc: 'Capacidad de pago y listas negras.',
    path: '/evaluacion',
    color: '#8E44AD',
    icon: 'shield',
  },
  {
    title: 'Cobranza',
    desc: 'Gestión de mora del día.',
    path: '/cobranza',
    color: '#F39C12',
    icon: 'coins',
  },
  {
    title: 'Mis solicitudes',
    desc: 'Tablero de estado de expedientes.',
    path: '/solicitudes',
    color: '#E74C3C',
    icon: 'file',
  },
  {
    title: 'Reportes',
    desc: 'Productividad del equipo.',
    path: '/reportes',
    color: '#16A085',
    icon: 'chart',
  },
];
