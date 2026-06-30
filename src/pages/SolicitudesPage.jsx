import { useEffect, useState } from 'react';
import { useOutletContext } from 'react-router-dom';
import { EstadoBadge, formatMoney } from '../components/Ui';
import {
  fetchSolicitudes,
  actualizarEstadoSolicitud,
  fetchSyncLog,
  productoFromPurpose,
  isSupabaseConfigured,
} from '../lib/supabase';

const ESTADOS_FINALES = ['aprobado', 'desembolsado', 'rechazado', 'condicionado'];

export default function SolicitudesPage() {
  const { puedeAprobar } = useOutletContext();

  const [rows, setRows] = useState([]);
  const [syncLog, setSyncLog] = useState([]);
  const [loading, setLoading] = useState(true);
  const [busyId, setBusyId] = useState(null);
  const [toast, setToast] = useState(null);
  const [liveData, setLiveData] = useState(isSupabaseConfigured);
  const [fetchError, setFetchError] = useState(null);

  async function load() {
    setLoading(true);
    const [solsRes, log] = await Promise.all([fetchSolicitudes(), fetchSyncLog()]);
    setRows(solsRes.rows);
    setLiveData(solsRes.live);
    setFetchError(solsRes.error ?? null);
    setSyncLog(log);
    setLoading(false);
  }

  useEffect(() => {
    load();
  }, []);

  async function cambiarEstado(id, estado) {
    setBusyId(id);
    const res = await actualizarEstadoSolicitud(id, estado);
    setBusyId(null);
    if (res.ok) {
      setToast(
        estado === 'aprobado'
          ? 'Solicitud aprobada: crédito publicado a la app del cliente'
          : 'Solicitud rechazada'
      );
      await load();
    } else {
      setToast(res.error ? `Error: ${res.error}` : 'No se pudo actualizar la solicitud');
    }
    setTimeout(() => setToast(null), 4000);
  }

  return (
    <>
      <div className="page-header">
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 16 }}>
          <div>
            <h2>Mis solicitudes</h2>
            <p>
              Expedientes desde app cliente y fuerza de ventas (tabla{' '}
              <code>fv_credit_applications</code>).
            </p>
          </div>
          <button type="button" onClick={load} disabled={loading} style={btnStyle('#003DA5')}>
            {loading ? 'Actualizando…' : 'Actualizar'}
          </button>
        </div>
      </div>

      {!liveData && (
        <div style={bannerStyle('#B45309', '#FFFBEB')}>
          Modo demo — configure <code>.env</code> o reinicie el servidor. No muestra solicitudes
          reales de la app cliente.
        </div>
      )}
      {liveData && fetchError && (
        <div style={bannerStyle('#B91C1C', '#FEF2F2')}>
          Error al leer Supabase: {fetchError}. Ejecute{' '}
          <code>supabase/scripts/07_fix_solicitudes_rls.sql</code>.
        </div>
      )}
      {liveData && !fetchError && rows.length > 0 && (
        <div style={bannerStyle('#0F766E', '#ECFDF5')}>
          Datos en vivo — {rows.length} solicitud(es) sincronizadas desde Supabase.
        </div>
      )}

      {toast && (
        <div
          style={{
            background: 'linear-gradient(135deg, #0F766E, #23B4C7)',
            color: '#fff',
            padding: '12px 16px',
            borderRadius: 12,
            marginBottom: 16,
            fontSize: 14,
            fontWeight: 800,
            boxShadow: '0 14px 30px rgba(15, 118, 110, 0.2)',
          }}
        >
          {toast}
        </div>
      )}

      <div className="data-table-wrap">
        <table className="data-table">
          <thead>
            <tr>
              <th>Cliente</th>
              <th>DNI</th>
              <th>Producto</th>
              <th>Monto</th>
              <th>Plazo</th>
              <th>Estado</th>
              {puedeAprobar && <th>Acciones</th>}
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr>
                <td colSpan={puedeAprobar ? 7 : 6} style={{ textAlign: 'center', padding: 32 }}>
                  Cargando...
                </td>
              </tr>
            ) : rows.length === 0 ? (
              <tr>
                <td colSpan={puedeAprobar ? 7 : 6} style={{ textAlign: 'center', padding: 32 }}>
                  Sin solicitudes registradas.
                </td>
              </tr>
            ) : (
              rows.map((r) => {
                const estado = (r.status || '').toLowerCase();
                const esFinal = ESTADOS_FINALES.includes(estado);
                return (
                  <tr key={r.id}>
                    <td>
                      <strong>{r.client_name || r.client_dni || r.id}</strong>
                    </td>
                    <td>{r.client_dni || '-'}</td>
                    <td>{productoFromPurpose(r.purpose)}</td>
                    <td>{formatMoney(r.amount)}</td>
                    <td>{r.term_months} meses</td>
                    <td>
                      <EstadoBadge estado={r.status} />
                    </td>
                    {puedeAprobar && (
                      <td>
                        {esFinal ? (
                          <span style={{ color: 'var(--bp-gris-medio)', fontSize: 13 }}>-</span>
                        ) : (
                          <div style={{ display: 'flex', gap: 8, flexWrap: 'wrap' }}>
                            <button
                              type="button"
                              className="btn-aprobar"
                              disabled={busyId === r.id}
                              onClick={() => cambiarEstado(r.id, 'aprobado')}
                              style={btnStyle('#0F766E')}
                            >
                              {busyId === r.id ? '...' : 'Aprobar'}
                            </button>
                            <button
                              type="button"
                              className="btn-rechazar"
                              disabled={busyId === r.id}
                              onClick={() => cambiarEstado(r.id, 'rechazado')}
                              style={btnStyle('#B91C1C')}
                            >
                              Rechazar
                            </button>
                          </div>
                        )}
                      </td>
                    )}
                  </tr>
                );
              })
            )}
          </tbody>
        </table>
      </div>

      <div style={{ marginTop: 28 }}>
        <h2 className="section-title">Integración End-to-End</h2>
        <p style={{ color: 'var(--bp-gris-medio)', marginTop: -8, marginBottom: 12, fontSize: 13 }}>
          Eventos publicados hacia la app del cliente al aprobar (tabla <code>sync_log</code>).
        </p>
        {!syncLog.length ? (
          <p style={{ fontSize: 13, color: 'var(--bp-gris-medio)' }}>
            Aún no hay eventos registrados.
          </p>
        ) : (
          <ul style={{ listStyle: 'none', padding: 0, margin: 0 }}>
            {syncLog.map((l) => (
              <li
                key={l.id}
                style={{
                  borderLeft: '4px solid #0F766E',
                  padding: '10px 13px',
                  marginBottom: 8,
                  background: 'rgba(255, 255, 255, 0.82)',
                  borderRadius: 10,
                  fontSize: 13,
                  boxShadow: '0 10px 24px rgba(6, 24, 58, 0.08)',
                }}
              >
                <strong>{l.evento}</strong>: {l.detalle}
                <div style={{ color: 'var(--bp-gris-medio)', fontSize: 11, marginTop: 2 }}>
                  {new Date(l.created_at).toLocaleString('es-EC')}
                </div>
              </li>
            ))}
          </ul>
        )}
      </div>
    </>
  );
}

function btnStyle(bg) {
  return {
    background: bg,
    color: '#fff',
    border: 'none',
    borderRadius: 999,
    padding: '7px 14px',
    fontSize: 13,
    fontWeight: 800,
    boxShadow: '0 10px 18px rgba(6, 24, 58, 0.14)',
    cursor: 'pointer',
  };
}

function bannerStyle(color, bg) {
  return {
    background: bg,
    color,
    padding: '10px 14px',
    borderRadius: 10,
    marginBottom: 14,
    fontSize: 13,
    fontWeight: 600,
    border: `1px solid ${color}33`,
  };
}
