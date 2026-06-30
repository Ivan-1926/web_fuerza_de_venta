import { useEffect, useState } from 'react';
import { formatMoney } from '../components/Ui';
import { CASO_DEMO_DNI, fetchCobranza } from '../lib/supabase';

function MoraBadge({ dias }) {
  const d = Number(dias || 0);
  const color = d <= 15 ? '#CA8A04' : d <= 30 ? '#EA580C' : '#B91C1C';
  return (
    <span
      style={{
        background: color,
        color: '#fff',
        borderRadius: 999,
        padding: '4px 10px',
        fontSize: 12,
        fontWeight: 800,
      }}
    >
      {d} días
    </span>
  );
}

export default function CobranzaPage() {
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [q, setQ] = useState(CASO_DEMO_DNI);

  useEffect(() => {
    fetchCobranza().then((data) => {
      setRows(data);
      setLoading(false);
    });
  }, []);

  const filtered = rows.filter((r) => {
    const t = q.trim().toLowerCase();
    if (!t) return true;
    return (r.name || '').toLowerCase().includes(t) || (r.dni || '').toLowerCase().includes(t);
  });

  const totalDeuda = filtered.reduce((s, r) => s + Number(r.total_debt || 0), 0);
  const promedioMora =
    filtered.length > 0
      ? filtered.reduce((s, r) => s + Number(r.days_overdue || 0), 0) / filtered.length
      : 0;

  return (
    <>
      <div className="page-header">
        <h2>Cobranza</h2>
        <p>Gestión de mora del día — clientes con cuotas vencidas.</p>
      </div>

      <div className="kpi-grid" style={{ marginBottom: 20, gridTemplateColumns: 'repeat(3, 1fr)' }}>
        <div className="kpi-card" style={{ '--accent': '#B91C1C' }}>
          <div className="kpi-card__label">Clientes en mora</div>
          <div className="kpi-card__value">{loading ? '...' : filtered.length}</div>
        </div>
        <div className="kpi-card" style={{ '--accent': '#EA580C' }}>
          <div className="kpi-card__label">Saldo vencido</div>
          <div className="kpi-card__value">{loading ? '...' : formatMoney(totalDeuda)}</div>
        </div>
        <div className="kpi-card" style={{ '--accent': '#CA8A04' }}>
          <div className="kpi-card__label">Promedio días mora</div>
          <div className="kpi-card__value">{loading ? '...' : Math.round(promedioMora)}</div>
        </div>
      </div>

      <input
        type="search"
        placeholder="Buscar por nombre o DNI..."
        value={q}
        onChange={(e) => setQ(e.target.value)}
        style={{
          width: '100%',
          maxWidth: 380,
          padding: '11px 14px',
          marginBottom: 16,
          fontSize: 14,
        }}
      />

      <div className="data-table-wrap">
        <table className="data-table">
          <thead>
            <tr>
              <th>Cliente</th>
              <th>DNI</th>
              <th>Negocio</th>
              <th>Saldo</th>
              <th>Días mora</th>
              <th>Score</th>
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr>
                <td colSpan={6} style={{ textAlign: 'center', padding: 32 }}>
                  Cargando...
                </td>
              </tr>
            ) : filtered.length === 0 ? (
              <tr>
                <td colSpan={6} style={{ textAlign: 'center', padding: 32 }}>
                  Sin clientes en mora.
                </td>
              </tr>
            ) : (
              filtered.map((r) => (
                <tr key={r.id}>
                  <td>
                    <strong>{r.name}</strong>
                  </td>
                  <td>{r.dni}</td>
                  <td>{r.business_name || '-'}</td>
                  <td>{formatMoney(r.total_debt)}</td>
                  <td>
                    <MoraBadge dias={r.days_overdue} />
                  </td>
                  <td>{Number(r.credit_score || 0).toFixed(0)}</td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </>
  );
}
