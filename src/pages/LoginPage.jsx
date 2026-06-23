import { useState } from 'react';
import { Navigate, useLocation, useNavigate } from 'react-router-dom';
import { ArrowRight, BadgeCheck, Building2, LockKeyhole, ShieldCheck, Sparkles } from 'lucide-react';
import { useAuth } from '../context/AuthContext';

const SUPERVISOR_EMAIL = 'supervisor@pichincha.com';
const SUPERVISOR_PASS = 'Docente2025!';

const highlights = [
  { label: 'Banca con propósito', value: 'Impulsamos negocios familiares y microempresas.' },
  { label: 'Gestión segura', value: 'Procesos protegidos para expedientes y evaluación.' },
  { label: 'Equipo en campo', value: 'Herramientas simples para vender, visitar y aprobar.' },
];

export default function LoginPage() {
  const { login, isAuthenticated, loading } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [busy, setBusy] = useState(false);
  const [localError, setLocalError] = useState(null);

  if (!loading && isAuthenticated) {
    const redirect = location.state?.from || '/';
    return <Navigate to={redirect} replace />;
  }

  const handleSubmit = async (e) => {
    e.preventDefault();
    setBusy(true);
    setLocalError(null);
    const result = await login(email.trim(), password);
    setBusy(false);
    if (result.ok) {
      navigate(location.state?.from || '/', { replace: true });
    } else {
      setLocalError(result.error || 'No se pudo iniciar sesión.');
    }
  };

  const fillSupervisor = () => {
    setEmail(SUPERVISOR_EMAIL);
    setPassword(SUPERVISOR_PASS);
  };

  return (
    <main className="brand-login-page">
      <section className="brand-hero" aria-label="Presentación de Banco Pichincha">
        <nav className="brand-hero__nav">
          <img src="/pichincha-logo.png" alt="Banco Pichincha" className="brand-hero__logo" />
          <a href="#acceso" className="brand-hero__access">
            Acceso ventas
            <ArrowRight size={16} />
          </a>
        </nav>

        <div className="brand-hero__content">
          <p className="brand-hero__eyebrow">Banco Pichincha · Fuerza de Ventas</p>
          <h1>
            Banca cercana para hacer crecer cada historia de negocio.
          </h1>
          <p className="brand-hero__lead">
            Somos una entidad financiera que acompaña a personas, familias y empresas con soluciones
            simples, responsables y seguras. Esta plataforma conecta al equipo comercial con la
            información clave para atender mejor, decidir más rápido y cuidar cada relación.
          </p>

          <div className="brand-hero__actions">
            <a href="#acceso" className="brand-hero__primary">
              Ingresar al panel
              <ArrowRight size={18} />
            </a>
            <span className="brand-hero__signature">Confianza, servicio y progreso.</span>
          </div>
        </div>

        <div className="brand-story">
          {highlights.map((item) => (
            <article className="brand-story__item" key={item.label}>
              <BadgeCheck size={18} />
              <div>
                <strong>{item.label}</strong>
                <span>{item.value}</span>
              </div>
            </article>
          ))}
        </div>
      </section>

      <aside className="brand-login-panel" id="acceso" aria-label="Inicio de sesión">
        <div className="brand-login-card">
          <div className="brand-login-card__header">
            <div className="brand-login-card__mark">
              <LockKeyhole size={24} />
            </div>
            <div>
              <p>Portal interno</p>
              <h2>Ingreso fuerza de ventas</h2>
            </div>
          </div>

          <div className="brand-login-card__trust">
            <span>
              <ShieldCheck size={15} />
              Conexión segura
            </span>
            <span>
              <Building2 size={15} />
              Banco Pichincha
            </span>
          </div>

          <form className="login-form" onSubmit={handleSubmit}>
            <label>
              Correo electrónico
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="supervisor@pichincha.com"
                required
                autoComplete="username"
              />
            </label>
            <label>
              Contraseña
              <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="••••••••"
                required
                autoComplete="current-password"
              />
            </label>

            {localError && <div className="login-form__error">{localError}</div>}

            <button type="submit" className="login-form__submit" disabled={busy}>
              {busy ? 'Validando acceso...' : 'Entrar al dashboard'}
            </button>

            <button type="button" className="login-form__secondary" onClick={fillSupervisor}>
              Usar credenciales demo
            </button>
          </form>

          <div className="brand-login-card__note">
            <Sparkles size={16} />
            <p>
              El registro de usuarios se gestiona desde el backend/Supabase para mantener permisos,
              roles y aprobaciones bajo control.
            </p>
          </div>
        </div>
      </aside>
    </main>
  );
}
