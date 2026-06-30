import { useEffect, useState } from 'react';
import { formatMoney } from '../components/Ui';
import { fetchCartera } from '../lib/supabase';

function MoraBadge({ dias }) {
  const d = Number(dias || 0);
  const color = d === 0 ? '#0F766E' : d <= 30 ? '#CA8A04' : '#B91C1C';
  const label = d === 0 ? 'Al día' : `${d} días`;
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
      {label}
    </span>
  );
}

export default function CarteraPage() {
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [q, setQ] = useState('');

  useEffect(() => {
    fetchCartera().then((data) => {
      setRows(data);
      setLoading(false);
    });
  }, []);

  const filtered = rows.filter((r) => {
    const t = q.trim().toLowerCase();
    if (!t) return true;
    return (r.name || '').toLowerCase().includes(t) || (r.dni || '').toLowerCase().includes(t);
  });

  return (
    <>
      <div className="page-header">
        <h2>Cartera de clientes</h2>
        <p>
          Clientes compartidos con la app de campo (tabla <code>clients</code>).
        </p>
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
              <th>Score</th>
              <th>Deuda</th>
              <th>Mora</th>
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
                  Sin registros en cartera.
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
                  <td>{Number(r.credit_score || 0).toFixed(0)}</td>
                  <td>{formatMoney(r.total_debt)}</td>
                  <td>
                    <MoraBadge dias={r.days_overdue} />
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </>
  );
}
