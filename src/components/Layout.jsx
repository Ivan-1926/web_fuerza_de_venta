import { NavLink, Outlet, useNavigate } from 'react-router-dom';
import { BarChart3, Briefcase, Coins, FileText, Home, Shield } from 'lucide-react';
import { LiveClock } from './Ui';
import { navItems } from '../config/theme';
import { useAuth } from '../context/AuthContext';

const navIconMap = {
  home: Home,
  briefcase: Briefcase,
  file: FileText,
  shield: Shield,
  coins: Coins,
  chart: BarChart3,
};

export default function Layout() {
  const navigate = useNavigate();
  const { user, logout, puedeAprobar } = useAuth();

  const handleLogout = async () => {
    await logout();
    navigate('/login', { replace: true });
  };

  return (
    <div className="app-shell">
      <header className="top-bar">
        <div className="top-bar__brand">
          <span className="top-bar__logo top-bar__logo--image">
            <img src="/pichincha-logo.png" alt="Banco Pichincha" />
          </span>
          <div>
            <div>Banco Pichincha</div>
            <div className="top-bar__brand-sub">Core financiero · Fuerza de Ventas</div>
          </div>
        </div>
        <LiveClock />
        <div className="top-bar__user">
          <div className="top-bar__avatar">{user?.initials ?? 'FV'}</div>
          <div className="top-bar__user-info">
            <div className="top-bar__user-name">{user?.name ?? 'Usuario'}</div>
            <div className="top-bar__user-role">
              {user?.role ?? '-'}
              {!puedeAprobar && ' · sin permiso de aprobación'}
            </div>
          </div>
          <button type="button" className="top-bar__logout" onClick={handleLogout} title="Cerrar sesión">
            Salir
          </button>
        </div>
      </header>

      <nav className="nav-bar">
        {navItems.map((item) => {
          const Icon = navIconMap[item.icon] || Home;
          return (
            <NavLink
              key={item.id}
              to={item.path}
              end={item.path === '/'}
              className={({ isActive }) =>
                `nav-bar__link${isActive ? ' nav-bar__link--active' : ''}`
              }
            >
              <Icon className="nav-bar__icon" size={17} />
              {item.label}
            </NavLink>
          );
        })}
      </nav>

      <main className="main-content">
        <Outlet context={{ user, navigate, puedeAprobar }} />
      </main>
    </div>
  );
}
