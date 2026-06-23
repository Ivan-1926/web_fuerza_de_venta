export default function PlaceholderPage({ title, subtitle }) {
  return (
    <div>
      <div className="page-header">
        <h2>{title}</h2>
        <p>{subtitle}</p>
      </div>
      <div
        style={{
          padding: 48,
          background: 'rgba(255, 255, 255, 0.82)',
          border: '1px solid var(--bp-borde)',
          borderRadius: 'var(--bp-radio)',
          boxShadow: 'var(--bp-sombra)',
          textAlign: 'center',
          color: 'var(--bp-gris-medio)',
          fontWeight: 700,
        }}
      >
        Módulo en preparación. Los datos se sincronizan desde la app Flutter vía Supabase.
      </div>
    </div>
  );
}
