import { useEffect, useState } from 'react';
import { SegmentBadge, formatMoney } from '../components/Ui';
import { fetchEvaluaciones } from '../lib/supabase';

function ScoreBar({ label, value }) {
  const pct = Math.min(100, Math.max(0, Number(value || 0)));
  return (
    <div style={{ marginBottom: 8 }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: 12, marginBottom: 4 }}>
        <span>{label}</span>
        <strong>{pct.toFixed(0)}</strong>
      </div>
      <div style={{ height: 6, background: 'var(--bp-gris-claro)', borderRadius: 999 }}>
        <div
          style={{
            width: `${pct}%`,
            height: '100%',
            borderRadius: 999,
            background: 'linear-gradient(90deg, #0F766E, #23B4C7)',
          }}
        />
      </div>
    </div>
  );
}

export default function EvaluacionPage() {
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [selected, setSelected] = useState(null);

  useEffect(() => {
    fetchEvaluaciones().then((data) => {
      setRows(data);
      setLoading(false);
    });
  }, []);

  return (
    <>
      <div className="page-header">
        <h2>Evaluación y Buró</h2>
        <p>Fichas de campo, scoring F1-F5 y consultas de buró.</p>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: '1.4fr 1fr', gap: 20 }}>
        <div className="data-table-wrap">
          <table className="data-table">
            <thead>
              <tr>
                <th>Cliente</th>
                <th>DNI</th>
                <th>Negocio</th>
                <th>Score F</th>
                <th>Segmento</th>
                <th>Buró</th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td colSpan={6} style={{ textAlign: 'center', padding: 32 }}>
                    Cargando...
                  </td>
                </tr>
              ) : rows.length === 0 ? (
                <tr>
                  <td colSpan={6} style={{ textAlign: 'center', padding: 32 }}>
                    Sin fichas de evaluación.
                  </td>
                </tr>
              ) : (
                rows.map((r) => {
                  const c = r.cliente || {};
                  const nombre = `${c.nombres || ''} ${c.apellidos || ''}`.trim() || '-';
                  return (
                    <tr
                      key={r.id}
                      onClick={() => setSelected(r)}
                      style={{ cursor: 'pointer', background: selected?.id === r.id ? 'rgba(35,180,199,0.08)' : undefined }}
                    >
                      <td>
                        <strong>{nombre}</strong>
                      </td>
                      <td>{c.cedula || '-'}</td>
                      <td>{c.tipo_negocio || '-'}</td>
                      <td>{Number(r.score_final || 0).toFixed(0)}</td>
                      <td>
                        <SegmentBadge segmento={r.segmento_resultante} />
                      </td>
                      <td>{r.buro?.score_buro ?? '-'}</td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>

        <div
          style={{
            padding: 20,
            background: 'rgba(255,255,255,0.82)',
            border: '1px solid var(--bp-borde)',
            borderRadius: 'var(--bp-radio)',
            boxShadow: 'var(--bp-sombra)',
            minHeight: 280,
          }}
        >
          {!selected ? (
            <p style={{ color: 'var(--bp-gris-medio)', textAlign: 'center', paddingTop: 80 }}>
              Selecciona una ficha para ver el detalle.
            </p>
          ) : (
            <>
              <h3 style={{ fontFamily: 'var(--font-display)', marginBottom: 12 }}>
                {`${selected.cliente?.nombres || ''} ${selected.cliente?.apellidos || ''}`.trim()}
              </h3>
              <ScoreBar label="F1 — Negocio" value={selected.score_f1} />
              <ScoreBar label="F2 — Flujo" value={selected.score_f2} />
              <ScoreBar label="F3 — Garantías" value={selected.score_f3} />
              <ScoreBar label="F4 — Carácter" value={selected.score_f4} />
              <div style={{ marginTop: 16, fontSize: 13 }}>
                <div>
                  <strong>Score final:</strong> {Number(selected.score_final || 0).toFixed(1)}
                </div>
                <div>
                  <strong>Monto propuesto:</strong> {formatMoney(selected.monto_propuesto)} ·{' '}
                  {selected.plazo_meses} meses
                </div>
                <div>
                  <strong>Cuota estimada:</strong> {formatMoney(selected.cuota_estimada)}
                </div>
                {selected.buro && (
                  <div style={{ marginTop: 12, paddingTop: 12, borderTop: '1px solid var(--bp-borde)' }}>
                    <strong>Buró:</strong> score {selected.buro.score_buro} ·{' '}
                    {selected.buro.morosidad} · {selected.buro.recomendacion}
                  </div>
                )}
                {selected.recomendacion && (
                  <p style={{ marginTop: 10, color: 'var(--bp-gris-medio)' }}>{selected.recomendacion}</p>
                )}
              </div>
            </>
          )}
        </div>
      </div>
    </>
  );
}
