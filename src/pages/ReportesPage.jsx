import { useEffect, useState } from 'react';
import { TrendingUp, MapPin, CheckCircle2, FileText } from 'lucide-react';
import { KpiCard, SegmentBadge, EstadoBadge, formatMoney } from '../components/Ui';
import { colors } from '../config/theme';
import { CASO_DEMO_DNI, fetchReporteCliente, fetchReportesKpis } from '../lib/supabase';

function TimelineItem({ item }) {
  return (
    <li
      style={{
        borderLeft: '4px solid var(--bp-azul-medio)',
        padding: '12px 14px',
        marginBottom: 10,
        background: 'rgba(255,255,255,0.82)',
        borderRadius: 10,
        boxShadow: '0 10px 24px rgba(6, 24, 58, 0.08)',
      }}
    >
      <div style={{ display: 'flex', justifyContent: 'space-between', gap: 12, flexWrap: 'wrap' }}>
        <strong>{item.tipo}</strong>
        <span style={{ color: 'var(--bp-gris-medio)', fontSize: 12 }}>
          {item.fecha ? new Date(item.fecha).toLocaleDateString('es-EC') : '-'}
        </span>
      </div>
      {item.monto > 0 && (
        <div style={{ fontSize: 13, marginTop: 4 }}>Monto: {formatMoney(item.monto)}</div>
      )}
      <div style={{ fontSize: 13, marginTop: 4 }}>
        <EstadoBadge estado={item.estado} />
      </div>
      {item.observacion && (
        <p style={{ fontSize: 13, color: 'var(--bp-gris-medio)', marginTop: 6 }}>{item.observacion}</p>
      )}
    </li>
  );
}

export default function ReportesPage() {
  const [kpis, setKpis] = useState(null);
  const [dni, setDni] = useState(CASO_DEMO_DNI);
  const [reporte, setReporte] = useState(null);
  const [loadingKpis, setLoadingKpis] = useState(true);
  const [loadingReporte, setLoadingReporte] = useState(true);
  const [searched, setSearched] = useState(false);

  useEffect(() => {
    fetchReportesKpis().then((data) => {
      setKpis(data);
      setLoadingKpis(false);
    });
    fetchReporteCliente(CASO_DEMO_DNI).then((data) => {
      setReporte(data);
      setLoadingReporte(false);
      setSearched(true);
    });
  }, []);

  async function buscar(e) {
    e.preventDefault();
    setLoadingReporte(true);
    setSearched(true);
    const data = await fetchReporteCliente(dni);
    setReporte(data);
    setLoadingReporte(false);
  }

  const k = kpis ?? {};

  return (
    <>
      <div className="page-header">
        <h2>Reportes</h2>
        <p>Productividad del equipo y reporte crediticio por cliente.</p>
      </div>

      <div className="kpi-grid">
        <KpiCard
          label="Visitas pendientes"
          value={loadingKpis ? '...' : k.visitas_pendientes ?? 0}
          sub={`de ${k.visitas_total_cartera ?? 0} en cartera`}
          accent="#DC2626"
          icon={MapPin}
        />
        <KpiCard
          label="Gestionadas hoy"
          value={loadingKpis ? '...' : k.gestionadas_hoy ?? 0}
          sub="visitas registradas"
          accent={colors.teal}
          icon={CheckCircle2}
        />
        <KpiCard
          label="Monto en cartera"
          value={loadingKpis ? '...' : formatMoney(k.monto_cartera)}
          sub="colocación gestionada"
          accent={colors.naranja}
          icon={TrendingUp}
        />
        <KpiCard
          label="Solicitudes aprobadas"
          value={loadingKpis ? '...' : k.solicitudes_aprobadas ?? 0}
          sub={`de ${k.solicitudes_mes ?? 0} este mes`}
          accent={colors.morado}
          icon={FileText}
        />
      </div>

      <div style={{ marginTop: 28 }}>
        <h2 className="section-title">Reporte crediticio por DNI</h2>
        <form onSubmit={buscar} style={{ display: 'flex', gap: 10, marginBottom: 20, flexWrap: 'wrap' }}>
          <input
            type="text"
            placeholder="DNI del cliente"
            value={dni}
            onChange={(e) => setDni(e.target.value)}
            style={{ padding: '11px 14px', fontSize: 14, minWidth: 200 }}
          />
          <button
            type="submit"
            style={{
              background: 'var(--bp-azul-medio)',
              color: '#fff',
              borderRadius: 999,
              padding: '11px 20px',
              fontWeight: 800,
            }}
          >
            Consultar
          </button>
        </form>

        {loadingReporte ? (
          <p style={{ textAlign: 'center', padding: 32 }}>Cargando reporte...</p>
        ) : !reporte && searched ? (
          <p style={{ textAlign: 'center', padding: 32, color: 'var(--bp-gris-medio)' }}>
            No se encontró historial para el DNI ingresado.
          </p>
        ) : reporte ? (
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1.2fr', gap: 20 }}>
            <div
              style={{
                padding: 20,
                background: 'rgba(255,255,255,0.82)',
                border: '1px solid var(--bp-borde)',
                borderRadius: 'var(--bp-radio)',
                boxShadow: 'var(--bp-sombra)',
              }}
            >
              <h3 style={{ fontFamily: 'var(--font-display)', marginBottom: 12 }}>{reporte.nombre}</h3>
              <div style={{ fontSize: 14, lineHeight: 1.8 }}>
                <div>
                  <strong>DNI:</strong> {reporte.dni}
                </div>
                <div>
                  <strong>Negocio:</strong> {reporte.negocio}
                </div>
                <div>
                  <strong>Distrito:</strong> {reporte.distrito}
                </div>
                <div style={{ marginTop: 8 }}>
                  <SegmentBadge segmento={reporte.segmento} />{' '}
                  <EstadoBadge estado={reporte.estado} />
                </div>
                {reporte.ficha && (
                  <div style={{ marginTop: 16, paddingTop: 16, borderTop: '1px solid var(--bp-borde)' }}>
                    <strong>Evaluación F1-F5</strong>
                    <div>Score final: {Number(reporte.ficha.score_final).toFixed(1)}</div>
                    <div>Monto propuesto: {formatMoney(reporte.ficha.monto_propuesto)}</div>
                    <div>Cuota: {formatMoney(reporte.ficha.cuota_estimada)}</div>
                  </div>
                )}
                {reporte.buro && (
                  <div style={{ marginTop: 12 }}>
                    <strong>Buró:</strong> {reporte.buro.score_buro} — {reporte.buro.recomendacion}
                  </div>
                )}
                {reporte.productos?.length > 0 && (
                  <div style={{ marginTop: 12 }}>
                    <strong>Productos activos:</strong>
                    <ul style={{ marginTop: 6, paddingLeft: 18 }}>
                      {reporte.productos.map((p, i) => (
                        <li key={i} style={{ fontSize: 13 }}>
                          {p.nombre}: saldo {formatMoney(p.saldo)} ({p.estado})
                        </li>
                      ))}
                    </ul>
                  </div>
                )}
              </div>
            </div>

            <div>
              <h3 style={{ fontFamily: 'var(--font-display)', marginBottom: 12 }}>Historia crediticia</h3>
              <ul style={{ listStyle: 'none', padding: 0, margin: 0 }}>
                {(reporte.historial ?? []).map((h, i) => (
                  <TimelineItem key={i} item={h} />
                ))}
              </ul>
            </div>
          </div>
        ) : null}
      </div>
    </>
  );
}
