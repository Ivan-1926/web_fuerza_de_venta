-- ============================================================
-- Script 06: Historia crediticia Caso 1 — DNI 40118120
-- Anaximandro Quispe — reporte demo para módulo Reportes web
-- Ejecutar DESPUÉS de scripts 01, 03 y 04
-- ============================================================

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, segmento, score_transaccional, monto_hipotesis, estado
) VALUES (
  'cli-caso1', 'Anaximandro', 'Quispe', '40118120', '0998765432', 'La Magdalena',
  'Textilería', 'Mercado La Magdalena', 'ESTANDAR', 79, 1000, 'comite'
)
ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula,
  estado = EXCLUDED.estado,
  score_transaccional = EXCLUDED.score_transaccional,
  updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso1', 'cli-caso1', TRUE, 36, 85, 420,
  82, 78, 80, 76, 79, 'ESTANDAR',
  1000, 12, 92.5, 'Apto para microcrédito productivo', TRUE
)
ON CONFLICT (id) DO UPDATE SET
  score_final = EXCLUDED.score_final,
  updated_at = NOW();

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso1', 'cli-caso1', '40118120', 712, 0, 'Sin mora',
  'Historial limpio — sin deudas castigadas'
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.historial_visitas (
  id, cliente_id, cliente_nombre, fecha, resultado, score_final, segmento, monto_propuesto, observaciones
) VALUES
  (
    'hv-caso1-2', 'cli-caso1', 'Anaximandro Quispe', NOW() - INTERVAL '2 days',
    'Evaluado', 79, 'ESTANDAR', 1000,
    'Negocio estable, stock visible, flujo diario consistente.'
  ),
  (
    'hv-caso1-1', 'cli-caso1', 'Anaximandro Quispe', NOW() - INTERVAL '5 days',
    'Visita inicial', NULL, NULL, NULL,
    'Cliente registrado desde app móvil. Se agenda evaluación F1-F5.'
  )
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.historial_crediticio (
  id, cliente_id, fecha, tipo, monto, estado, observacion
) VALUES
  ('hc-caso1-4', 'cli-caso1', '2026-06-28', 'Evaluación campo', 1000, 'Completado',
   'Ficha F1-F5 completada. Score final 79 — segmento ESTANDAR.'),
  ('hc-caso1-3', 'cli-caso1', '2026-06-27', 'Consulta buró', 0, 'Completado',
   'Score buró 712. Sin morosidad ni deudas vigentes.'),
  ('hc-caso1-2', 'cli-caso1', '2026-06-25', 'Solicitud crédito', 1000, 'En comité',
   'Solicitud S/1.000 desde app cliente. Destino: capital de trabajo.'),
  ('hc-caso1-1', 'cli-caso1', '2026-06-24', 'Registro app', 0, 'Completado',
   'Alta en app Banco Pichincha con DNI 40118120.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso1', 'cli-caso1', 1000, 12, 'Capital de trabajo', 'Personal', 'comite', TRUE
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.productos_activos (
  id, cliente_id, nombre, numero_operacion, monto, saldo, estado, fecha_desembolso, fecha_vencimiento
) VALUES (
  'prod-caso1', 'cli-caso1', 'Microcrédito Emprendimiento', 'CR-2025-4011',
  800, 420, 'Mora leve', '2025-09-15', '2026-09-15'
)
ON CONFLICT (id) DO NOTHING;

-- Cliente en cartera FV (cobranza + solicitudes E2E)
INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  'fv-caso1', 'Anaximandro Quispe', '40118120', 'Textilería Quispe', 712, 420, 12, 'active'
)
ON CONFLICT (id) DO UPDATE SET
  total_debt = EXCLUDED.total_debt,
  days_overdue = EXCLUDED.days_overdue;

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  'fv-sol-caso1', 'Anaximandro Quispe', '40118120', 1000, 12, 'comite', NOW() - INTERVAL '5 days'
)
ON CONFLICT (id) DO NOTHING;
