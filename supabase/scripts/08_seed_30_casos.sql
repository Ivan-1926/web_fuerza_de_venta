-- ============================================================
-- Script 08: 30 casos académicos — Crédito Empresarial Microempresa
-- Fuente: ENUNCIADOS_30_CASOS_CREDITO_FLUJO_MOVIL.pdf
-- Ejecutar DESPUÉS de: 00_setup_tablas.sql (obligatorio si sale error "does not exist")
-- Generado: 2026-06-30
-- ============================================================


-- ─── creditos_preaprobados (web Evaluación / Reportes) ───

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso01', 'Anaximandro', 'Quispe', '40118120', '964110201', 'El Tambo',
  'Bodega', 'Bodega Don Anaxi', -12.0581, -75.2027, 'ESTANDAR', 85,
  1000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso02', 'Eulalia', 'Mamani', '41223341', '964110202', 'Chilca',
  'Restaurante', 'Picanteria La Eulalia', -12.0921, -75.2105, 'ESTANDAR', 85,
  3000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso03', 'Teofilo', 'Huaman', '42330336', '964110203', 'Pilcomayo',
  'Carpinteria', 'Maderas Huaman', -12.0496, -75.2486, 'ESTANDAR', 85,
  5000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso04', 'Casandra', 'Flores', '43440349', '964110204', 'Huancayo',
  'Abarrotes', 'Distribuidora Casandra', -12.0651, -75.2049, 'ESTANDAR', 85,
  8000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso05', 'Demostenes', 'Rojas', '40556071', '964110205', 'San Agustin de Cajas',
  'Ferreteria', 'Ferreteria El Constructor', -12.0188, -75.2271, 'ESTANDAR', 85,
  10000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso06', 'Hipatia', 'Condori', '41669066', '964110206', 'El Tambo',
  'Textil', 'Confecciones Hipatia', -12.0612, -75.2118, 'ESTANDAR', 85,
  12000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso07', 'Anibal', 'Vargas', '43773379', '964110207', 'Concepcion',
  'Transporte', 'Transportes Anibal', -11.9182, -75.3142, 'ESTANDAR', 85,
  15000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso08', 'Penelope', 'Apaza', '40886086', '964110208', 'Sapallanga',
  'Avicola', 'Granja Penelope', -12.1581, -75.1762, 'ESTANDAR', 85,
  18000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso09', 'Heraclito', 'Ccahua', '41990091', '964110209', 'Huancayo',
  'Comercio', 'Importaciones Heraclito', -12.0668, -75.2103, 'ESTANDAR', 85,
  20000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso10', 'Cleopatra', 'Soto', '43003039', '964110210', 'Chupaca',
  'Farmacia', 'Botica Cleopatra', -12.056, -75.287, 'ESTANDAR', 85,
  25000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso11', 'Esquilo', 'Ramos', '40110010', '964110211', 'Huayucachi',
  'Bodega', 'Minimarket Esquilo', -12.1339, -75.209, 'ESTANDAR', 85,
  2000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso12', 'Ariadna', 'Quispe', '41226021', '964110212', 'El Tambo',
  'Peluqueria', 'Estilos Ariadna', -12.0573, -75.2161, 'ESTANDAR', 85,
  4000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso13', 'Sofocles', 'Huanca', '43336033', '964110213', 'Sicaya',
  'Panaderia', 'Panaderia Sofocles', -12.0228, -75.3134, 'ESTANDAR', 85,
  6000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso14', 'Casiopea', 'Torres', '40550055', '964110214', 'Pilcomayo',
  'Mecanica', 'Taller Casiopea', -12.0512, -75.2451, 'ESTANDAR', 85,
  7500, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso15', 'Aristofanes', 'Cruz', '41669166', '964110215', 'Orcotuna',
  'Agropecuario', 'Insumos Aristofanes', -11.976, -75.3361, 'ESTANDAR', 85,
  9000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso16', 'Calipso', 'Mendoza', '43880088', '964110216', 'Huancayo',
  'Calzado', 'Calzados Calipso', -12.0689, -75.2055, 'ESTANDAR', 85,
  11000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso17', 'Demetrio', 'Quispe', '40119019', '964110217', 'Jauja',
  'Comercio', 'Mayorista Demetrio', -11.7752, -75.4995, 'ESTANDAR', 85,
  13500, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso18', 'Antigona', 'Flores', '41226126', '964110218', 'Concepcion',
  'Restaurante', 'Recreo Antigona', -11.9201, -75.311, 'ESTANDAR', 85,
  16000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso19', 'Pitagoras', 'Rojas', '43339033', '964110219', 'El Tambo',
  'Ferreteria', 'Ferreteria Pitagoras', -12.0599, -75.2143, 'ESTANDAR', 85,
  17000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso20', 'Berenice', 'Apaza', '40556056', '964110220', 'San Jeronimo de Tunan',
  'Textil', 'Tejidos Berenice', -11.9871, -75.2899, 'ESTANDAR', 85,
  19000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso21', 'Anaxagoras', 'Huaman', '43889089', '964110221', 'Huancayo',
  'Transporte', 'Carga Anaxagoras', -12.0644, -75.2088, 'ESTANDAR', 85,
  22000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso22', 'Climene', 'Vargas', '41003001', '964110222', 'Sapallanga',
  'Avicola', 'Avicola Climene', -12.156, -75.179, 'ESTANDAR', 85,
  24000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso23', 'Epaminondas', 'Soto', '40115011', '964110223', 'Pucara',
  'Bodega', 'Bodega Epaminondas', -12.1701, -75.1611, 'ESTANDAR', 85,
  1500, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso24', 'Lisistrata', 'Ramos', '41336036', '964110224', 'Huancayo',
  'Comercio', 'Variedades Lisistrata', -12.0633, -75.2071, 'ESTANDAR', 85,
  3500, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso25', 'Filoctetes', 'Cruz', '41552052', '964110225', 'Chilca',
  'Restaurante', 'Cevicheria Filoctetes', -12.093, -75.209, 'ESTANDAR', 85,
  11000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso26', 'Calirroe', 'Mendoza', '41888088', '964110226', 'El Tambo',
  'Calzado', 'Calzados Calirroe', -12.0588, -75.2129, 'ESTANDAR', 85,
  16000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso27', 'Tucidides', 'Quispe', '42220022', '964110227', 'Concepcion',
  'Ferreteria', 'Ferreteria Tucidides', -11.9176, -75.3155, 'ESTANDAR', 85,
  20000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso28', 'Aquiles', 'Mamani', '43337037', '964110228', 'Huancayo',
  'Comercio', 'Comercial Aquiles', -12.0657, -75.2099, 'ESTANDAR', 85,
  15000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso29', 'Medea', 'Apaza', '41884084', '964110229', 'Pilcomayo',
  'Bodega', 'Bodega Medea', -12.0489, -75.247, 'ESTANDAR', 60,
  14000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();

INSERT INTO public.creditos_preaprobados (
  id, nombres, apellidos, cedula, telefono, distrito, tipo_negocio,
  direccion_negocio, latitud, longitud, segmento, score_transaccional,
  monto_hipotesis, estado
) VALUES (
  'cli-caso30', 'Esquines', 'Rojas', '43334034', '964110230', 'Jauja',
  'Transporte', 'Fletes Esquines', -11.774, -75.501, 'ESTANDAR', 85,
  30000, 'enviado'
) ON CONFLICT (id) DO UPDATE SET
  cedula = EXCLUDED.cedula, monto_hipotesis = EXCLUDED.monto_hipotesis,
  score_transaccional = EXCLUDED.score_transaccional, updated_at = NOW();


-- ─── consultas_buro (resultado esperado por último dígito DNI) ───

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso01', 'cli-caso01', '40118120', 712, 4500,
  'Sin mora',
  'NORMAL — 1 entidad(es), deuda S/ 4500.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso02', 'cli-caso02', '41223341', 712, 12000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 12000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso03', 'cli-caso03', '42330336', 712, 6000,
  'Sin mora',
  'NORMAL — 1 entidad(es), deuda S/ 6000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso04', 'cli-caso04', '43440349', 712, 14000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 14000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso05', 'cli-caso05', '40556071', 712, 12000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 12000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso06', 'cli-caso06', '41669066', 712, 6000,
  'Sin mora',
  'NORMAL — 1 entidad(es), deuda S/ 6000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso07', 'cli-caso07', '43773379', 712, 14000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 14000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso08', 'cli-caso08', '40886086', 712, 6000,
  'Sin mora',
  'NORMAL — 1 entidad(es), deuda S/ 6000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso09', 'cli-caso09', '41990091', 712, 12000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 12000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso10', 'cli-caso10', '43003039', 712, 14000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 14000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso11', 'cli-caso11', '40110010', 712, 4500,
  'Sin mora',
  'NORMAL — 1 entidad(es), deuda S/ 4500.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso12', 'cli-caso12', '41226021', 712, 12000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 12000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso13', 'cli-caso13', '43336033', 712, 0,
  'Sin mora',
  'NORMAL — 0 entidad(es), deuda S/ 0.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso14', 'cli-caso14', '40550055', 480, 16000,
  '45 dias de mayor mora',
  'DEFICIENTE — 2 entidad(es), deuda S/ 16000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso15', 'cli-caso15', '41669166', 712, 6000,
  'Sin mora',
  'NORMAL — 1 entidad(es), deuda S/ 6000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso16', 'cli-caso16', '43880088', 580, 9000,
  '20 dias de mayor mora',
  'CPP — 1 entidad(es), deuda S/ 9000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso17', 'cli-caso17', '40119019', 712, 14000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 14000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso18', 'cli-caso18', '41226126', 712, 6000,
  'Sin mora',
  'NORMAL — 1 entidad(es), deuda S/ 6000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso19', 'cli-caso19', '43339033', 712, 0,
  'Sin mora',
  'NORMAL — 0 entidad(es), deuda S/ 0.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso20', 'cli-caso20', '40556056', 712, 6000,
  'Sin mora',
  'NORMAL — 1 entidad(es), deuda S/ 6000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso21', 'cli-caso21', '43889089', 712, 14000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 14000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso22', 'cli-caso22', '41003001', 712, 12000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 12000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso23', 'cli-caso23', '40115011', 712, 12000,
  'Sin mora',
  'NORMAL — 2 entidad(es), deuda S/ 12000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso24', 'cli-caso24', '41336036', 712, 6000,
  'Sin mora',
  'NORMAL — 1 entidad(es), deuda S/ 6000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso25', 'cli-caso25', '41552052', 580, 18000,
  '15 dias de mayor mora',
  'CPP — 2 entidad(es), deuda S/ 18000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso26', 'cli-caso26', '41888088', 580, 9000,
  '20 dias de mayor mora',
  'CPP — 1 entidad(es), deuda S/ 9000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso27', 'cli-caso27', '42220022', 580, 18000,
  '15 dias de mayor mora',
  'CPP — 2 entidad(es), deuda S/ 18000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso28', 'cli-caso28', '43337037', 350, 40000,
  'Lista de inhabilitados — bloqueo en buró',
  'PERDIDA — 4 entidad(es), deuda S/ 40000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso29', 'cli-caso29', '41884084', 420, 25000,
  '95 dias de mayor mora',
  'DUDOSO — 3 entidad(es), deuda S/ 25000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;

INSERT INTO public.consultas_buro (
  id, cliente_id, cedula, score_buro, deudas_vigentes, morosidad, recomendacion
) VALUES (
  'buro-caso30', 'cli-caso30', '43334034', 420, 25000,
  '95 dias de mayor mora',
  'DUDOSO — 3 entidad(es), deuda S/ 25000.00'
) ON CONFLICT (id) DO UPDATE SET morosidad = EXCLUDED.morosidad, recomendacion = EXCLUDED.recomendacion;


-- ─── fichas_campo (pre-evaluación esperada) ───

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso01', 'cli-caso01', TRUE, 48, 73, 30,
  85, 84, 86, 85, 85, 'ESTANDAR',
  1000, 12, 100.95, 'APTO — Caso 1 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso02', 'cli-caso02', TRUE, 36, 100, 47,
  85, 84, 86, 85, 85, 'ESTANDAR',
  3000, 12, 299.59, 'APTO — Caso 2 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso03', 'cli-caso03', TRUE, 60, 140, 60,
  85, 84, 86, 85, 85, 'ESTANDAR',
  5000, 18, 366.02, 'APTO — Caso 3 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso04', 'cli-caso04', TRUE, 84, 233, 87,
  85, 84, 86, 85, 85, 'ESTANDAR',
  8000, 6, 1480.73, 'APTO — Caso 4 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso05', 'cli-caso05', TRUE, 30, 173, 70,
  85, 84, 86, 85, 85, 'ESTANDAR',
  10000, 12, 1009.46, 'APTO — Caso 5 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso06', 'cli-caso06', TRUE, 54, 227, 97,
  85, 84, 86, 85, 85, 'ESTANDAR',
  12000, 24, 700.94, 'APTO — Caso 6 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso07', 'cli-caso07', TRUE, 42, 317, 140,
  85, 84, 86, 85, 85, 'ESTANDAR',
  15000, 18, 1098.07, 'APTO — Caso 7 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso08', 'cli-caso08', TRUE, 72, 293, 120,
  85, 84, 86, 85, 85, 'ESTANDAR',
  18000, 24, 1072.1, 'APTO — Caso 8 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso09', 'cli-caso09', TRUE, 96, 400, 167,
  85, 84, 86, 85, 85, 'ESTANDAR',
  20000, 36, 927.12, 'APTO — Caso 9 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso10', 'cli-caso10', TRUE, 66, 367, 147,
  85, 84, 86, 85, 85, 'ESTANDAR',
  25000, 24, 1460.29, 'APTO — Caso 10 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso11', 'cli-caso11', TRUE, 24, 63, 27,
  85, 84, 86, 85, 85, 'ESTANDAR',
  2000, 12, 201.89, 'APTO — Caso 11 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso12', 'cli-caso12', TRUE, 40, 110, 43,
  85, 84, 86, 85, 85, 'ESTANDAR',
  4000, 18, 292.82, 'APTO — Caso 12 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso13', 'cli-caso13', TRUE, 58, 187, 77,
  85, 84, 86, 85, 85, 'ESTANDAR',
  6000, 12, 599.17, 'APTO — Caso 13 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso14', 'cli-caso14', TRUE, 50, 247, 100,
  85, 84, 86, 85, 85, 'ESTANDAR',
  7500, 6, 1388.18, 'APTO — Caso 14 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso15', 'cli-caso15', TRUE, 78, 273, 110,
  85, 84, 86, 85, 85, 'ESTANDAR',
  9000, 24, 536.05, 'APTO — Caso 15 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso16', 'cli-caso16', TRUE, 62, 263, 103,
  85, 84, 86, 85, 85, 'ESTANDAR',
  11000, 18, 793.03, 'APTO — Caso 16 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso17', 'cli-caso17', TRUE, 90, 383, 157,
  85, 84, 86, 85, 85, 'ESTANDAR',
  13500, 12, 1362.77, 'APTO — Caso 17 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso18', 'cli-caso18', TRUE, 70, 307, 130,
  85, 84, 86, 85, 85, 'ESTANDAR',
  16000, 36, 741.7, 'APTO — Caso 18 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso19', 'cli-caso19', TRUE, 100, 433, 173,
  85, 84, 86, 85, 85, 'ESTANDAR',
  17000, 24, 993, 'APTO — Caso 19 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso20', 'cli-caso20', TRUE, 46, 287, 117,
  85, 84, 86, 85, 85, 'ESTANDAR',
  19000, 18, 1390.89, 'APTO — Caso 20 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso21', 'cli-caso21', TRUE, 84, 467, 193,
  85, 84, 86, 85, 85, 'ESTANDAR',
  22000, 36, 1019.83, 'APTO — Caso 21 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso22', 'cli-caso22', TRUE, 76, 450, 183,
  85, 84, 86, 85, 85, 'ESTANDAR',
  24000, 24, 1401.88, 'APTO — Caso 22 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso23', 'cli-caso23', TRUE, 28, 87, 33,
  85, 84, 86, 85, 85, 'ESTANDAR',
  1500, 6, 277.64, 'APTO — Caso 23 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso24', 'cli-caso24', TRUE, 52, 137, 57,
  85, 84, 86, 85, 85, 'ESTANDAR',
  3500, 12, 353.31, 'APTO — Caso 24 (APROBADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso25', 'cli-caso25', TRUE, 18, 127, 73,
  85, 84, 86, 85, 85, 'ESTANDAR',
  7000, 18, 504.66, 'APTO — Caso 25 (CONDICIONADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso26', 'cli-caso26', TRUE, 34, 167, 87,
  85, 84, 86, 85, 85, 'ESTANDAR',
  10000, 24, 595.61, 'APTO — Caso 26 (CONDICIONADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso27', 'cli-caso27', TRUE, 40, 207, 97,
  85, 84, 86, 85, 85, 'ESTANDAR',
  14000, 24, 817.76, 'APTO — Caso 27 (CONDICIONADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso28', 'cli-caso28', TRUE, 60, 300, 120,
  85, 84, 86, 85, 85, 'ESTANDAR',
  15000, 24, 893.42, 'APTO — Caso 28 (RECHAZADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso29', 'cli-caso29', TRUE, 22, 60, 37,
  85, 84, 86, 85, 60, 'ESTANDAR',
  14000, 18, 1024.87, 'REVISAR — Caso 29 (RECHAZADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();

INSERT INTO public.fichas_campo (
  id, cliente_id, negocio_verificado, antiguedad_meses, ventas_diarias, gastos_fijos,
  score_f1, score_f2, score_f3, score_f4, score_final, segmento_resultante,
  monto_propuesto, plazo_meses, cuota_estimada, recomendacion, completada
) VALUES (
  'ficha-caso30', 'cli-caso30', TRUE, 30, 233, 107,
  85, 84, 86, 85, 85, 'ESTANDAR',
  30000, 24, 1786.83, 'APTO — Caso 30 (RECHAZADO)', FALSE
) ON CONFLICT (id) DO UPDATE SET score_final = EXCLUDED.score_final, updated_at = NOW();


-- ─── solicitudes_credito (canal web legacy) ───

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso01', 'cli-caso01', 1000, 12, 'Capital de trabajo: compra de mercaderia', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso02', 'cli-caso02', 3000, 12, 'Compra de cocina industrial', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso03', 'cli-caso03', 5000, 18, 'Maquinaria: sierra y cepillo', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso04', 'cli-caso04', 8000, 6, 'Reposicion de stock por campana', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso05', 'cli-caso05', 10000, 12, 'Ampliacion de local', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso06', 'cli-caso06', 12000, 24, 'Compra de maquinas remalladoras', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso07', 'cli-caso07', 15000, 18, 'Cuota inicial de vehiculo de carga', 'vehicular', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso08', 'cli-caso08', 18000, 24, 'Ampliacion de galpon', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso09', 'cli-caso09', 20000, 36, 'Capital para nueva sucursal', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso10', 'cli-caso10', 25000, 24, 'Equipamiento y stock farmaceutico', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso11', 'cli-caso11', 2000, 12, 'Compra de congeladora', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso12', 'cli-caso12', 4000, 18, 'Mobiliario y equipos de salon', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso13', 'cli-caso13', 6000, 12, 'Horno rotativo', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso14', 'cli-caso14', 7500, 6, 'Herramienta neumatica', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso15', 'cli-caso15', 9000, 24, 'Capital para campana agricola', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso16', 'cli-caso16', 11000, 18, 'Compra de cuero y maquinaria', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso17', 'cli-caso17', 13500, 12, 'Reposicion de inventario mayorista', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso18', 'cli-caso18', 16000, 36, 'Ampliacion y remodelacion', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso19', 'cli-caso19', 17000, 24, 'Compra de stock estructural', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso20', 'cli-caso20', 19000, 18, 'Maquinaria de tejido plano', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso21', 'cli-caso21', 22000, 36, 'Cuota inicial de camion', 'vehicular', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso22', 'cli-caso22', 24000, 24, 'Equipamiento de planta', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso23', 'cli-caso23', 1500, 6, 'Compra de vitrinas', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso24', 'cli-caso24', 3500, 12, 'Capital de trabajo', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso25', 'cli-caso25', 11000, 18, 'Ampliacion de local nuevo', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso26', 'cli-caso26', 16000, 24, 'Maquinaria de mayor capacidad', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso27', 'cli-caso27', 20000, 24, 'Compra de stock y montacarga', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso28', 'cli-caso28', 15000, 24, 'Capital de trabajo', 'hipotecaria', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso29', 'cli-caso29', 14000, 18, 'Compra de camioneta para reparto', 'sin garantia', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;

INSERT INTO public.solicitudes_credito (
  id, cliente_id, monto_solicitado, plazo_meses, destino_fondos, tipo_garantia, estado, transmitida
) VALUES (
  'sol-caso30', 'cli-caso30', 30000, 24, 'Compra de unidad de transporte', 'vehicular', 'enviado', TRUE
) ON CONFLICT (id) DO UPDATE SET monto_solicitado = EXCLUDED.monto_solicitado;


-- ─── Compatibilidad: columnas opcionales en tablas fv_* existentes ───

DO $$ BEGIN
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS phone TEXT;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS lat DOUBLE PRECISION;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS lng DOUBLE PRECISION;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS business_sector TEXT;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS address TEXT;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS monthly_income NUMERIC(12,2);
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS business_age_years INT;
  ALTER TABLE public.fv_clients ADD COLUMN IF NOT EXISTS blacklist_reason TEXT;
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS tea NUMERIC(6,2);
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS monthly_payment NUMERIC(12,2);
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS purpose TEXT;
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS notes TEXT;
  ALTER TABLE public.fv_credit_applications ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW();
EXCEPTION WHEN undefined_table THEN NULL;
END $$;


-- ─── fv_clients (cartera app Fuerza de Ventas) ───

DELETE FROM public.fv_clients WHERE dni IN ('40118120', '41223341', '42330336', '43440349', '40556071', '41669066', '43773379', '40886086', '41990091', '43003039', '40110010', '41226021', '43336033', '40550055', '41669166', '43880088', '40119019', '41226126', '43339033', '40556056', '43889089', '41003001', '40115011', '41336036', '41552052', '41888088', '42220022', '43337037', '41884084', '43334034');

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000001'::uuid, 'Anaximandro Quispe', '40118120', 'Bodega Don Anaxi', 712,
  4500, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000002'::uuid, 'Eulalia Mamani', '41223341', 'Picanteria La Eulalia', 712,
  12000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000003'::uuid, 'Teofilo Huaman', '42330336', 'Maderas Huaman', 712,
  6000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000004'::uuid, 'Casandra Flores', '43440349', 'Distribuidora Casandra', 712,
  14000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000005'::uuid, 'Demostenes Rojas', '40556071', 'Ferreteria El Constructor', 712,
  12000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000006'::uuid, 'Hipatia Condori', '41669066', 'Confecciones Hipatia', 712,
  6000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000007'::uuid, 'Anibal Vargas', '43773379', 'Transportes Anibal', 712,
  14000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000008'::uuid, 'Penelope Apaza', '40886086', 'Granja Penelope', 712,
  6000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000009'::uuid, 'Heraclito Ccahua', '41990091', 'Importaciones Heraclito', 712,
  12000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000010'::uuid, 'Cleopatra Soto', '43003039', 'Botica Cleopatra', 712,
  14000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000011'::uuid, 'Esquilo Ramos', '40110010', 'Minimarket Esquilo', 712,
  4500, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000012'::uuid, 'Ariadna Quispe', '41226021', 'Estilos Ariadna', 712,
  12000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000013'::uuid, 'Sofocles Huanca', '43336033', 'Panaderia Sofocles', 712,
  0, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000014'::uuid, 'Casiopea Torres', '40550055', 'Taller Casiopea', 480,
  16000, 45, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000015'::uuid, 'Aristofanes Cruz', '41669166', 'Insumos Aristofanes', 712,
  6000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000016'::uuid, 'Calipso Mendoza', '43880088', 'Calzados Calipso', 580,
  9000, 20, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000017'::uuid, 'Demetrio Quispe', '40119019', 'Mayorista Demetrio', 712,
  14000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000018'::uuid, 'Antigona Flores', '41226126', 'Recreo Antigona', 712,
  6000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000019'::uuid, 'Pitagoras Rojas', '43339033', 'Ferreteria Pitagoras', 712,
  0, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000020'::uuid, 'Berenice Apaza', '40556056', 'Tejidos Berenice', 712,
  6000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000021'::uuid, 'Anaxagoras Huaman', '43889089', 'Carga Anaxagoras', 712,
  14000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000022'::uuid, 'Climene Vargas', '41003001', 'Avicola Climene', 712,
  12000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000023'::uuid, 'Epaminondas Soto', '40115011', 'Bodega Epaminondas', 712,
  12000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000024'::uuid, 'Lisistrata Ramos', '41336036', 'Variedades Lisistrata', 712,
  6000, 0, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000025'::uuid, 'Filoctetes Cruz', '41552052', 'Cevicheria Filoctetes', 580,
  18000, 15, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000026'::uuid, 'Calirroe Mendoza', '41888088', 'Calzados Calirroe', 580,
  9000, 20, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000027'::uuid, 'Tucidides Quispe', '42220022', 'Ferreteria Tucidides', 580,
  18000, 15, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000028'::uuid, 'Aquiles Mamani', '43337037', 'Comercial Aquiles', 350,
  40000, 210, 'blacklisted'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000029'::uuid, 'Medea Apaza', '41884084', 'Bodega Medea', 420,
  25000, 95, 'active'
);

INSERT INTO public.fv_clients (
  id, name, dni, business_name, credit_score, total_debt, days_overdue, status
) VALUES (
  '50000000-0000-4000-8000-000000000030'::uuid, 'Esquines Rojas', '43334034', 'Fletes Esquines', 420,
  25000, 95, 'active'
);


-- ─── fv_credit_applications (solicitudes E2E app cliente → web) ───

DELETE FROM public.fv_credit_applications WHERE client_dni IN ('40118120', '41223341', '42330336', '43440349', '40556071', '41669066', '43773379', '40886086', '41990091', '43003039', '40110010', '41226021', '43336033', '40550055', '41669166', '43880088', '40119019', '41226126', '43339033', '40556056', '43889089', '41003001', '40115011', '41336036', '41552052', '41888088', '42220022', '43337037', '41884084', '43334034');

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000001'::uuid, 'Anaximandro Quispe', '40118120', 1000, 12, 'enviado',
  NOW() - INTERVAL '30 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000002'::uuid, 'Eulalia Mamani', '41223341', 3000, 12, 'enviado',
  NOW() - INTERVAL '29 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000003'::uuid, 'Teofilo Huaman', '42330336', 5000, 18, 'enviado',
  NOW() - INTERVAL '28 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000004'::uuid, 'Casandra Flores', '43440349', 8000, 6, 'enviado',
  NOW() - INTERVAL '27 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000005'::uuid, 'Demostenes Rojas', '40556071', 10000, 12, 'enviado',
  NOW() - INTERVAL '26 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000006'::uuid, 'Hipatia Condori', '41669066', 12000, 24, 'enviado',
  NOW() - INTERVAL '25 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000007'::uuid, 'Anibal Vargas', '43773379', 15000, 18, 'enviado',
  NOW() - INTERVAL '24 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000008'::uuid, 'Penelope Apaza', '40886086', 18000, 24, 'enviado',
  NOW() - INTERVAL '23 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000009'::uuid, 'Heraclito Ccahua', '41990091', 20000, 36, 'enviado',
  NOW() - INTERVAL '22 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000010'::uuid, 'Cleopatra Soto', '43003039', 25000, 24, 'enviado',
  NOW() - INTERVAL '21 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000011'::uuid, 'Esquilo Ramos', '40110010', 2000, 12, 'enviado',
  NOW() - INTERVAL '20 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000012'::uuid, 'Ariadna Quispe', '41226021', 4000, 18, 'enviado',
  NOW() - INTERVAL '19 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000013'::uuid, 'Sofocles Huanca', '43336033', 6000, 12, 'enviado',
  NOW() - INTERVAL '18 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000014'::uuid, 'Casiopea Torres', '40550055', 7500, 6, 'enviado',
  NOW() - INTERVAL '17 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000015'::uuid, 'Aristofanes Cruz', '41669166', 9000, 24, 'enviado',
  NOW() - INTERVAL '16 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000016'::uuid, 'Calipso Mendoza', '43880088', 11000, 18, 'enviado',
  NOW() - INTERVAL '15 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000017'::uuid, 'Demetrio Quispe', '40119019', 13500, 12, 'enviado',
  NOW() - INTERVAL '14 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000018'::uuid, 'Antigona Flores', '41226126', 16000, 36, 'enviado',
  NOW() - INTERVAL '13 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000019'::uuid, 'Pitagoras Rojas', '43339033', 17000, 24, 'enviado',
  NOW() - INTERVAL '12 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000020'::uuid, 'Berenice Apaza', '40556056', 19000, 18, 'enviado',
  NOW() - INTERVAL '11 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000021'::uuid, 'Anaxagoras Huaman', '43889089', 22000, 36, 'enviado',
  NOW() - INTERVAL '10 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000022'::uuid, 'Climene Vargas', '41003001', 24000, 24, 'enviado',
  NOW() - INTERVAL '9 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000023'::uuid, 'Epaminondas Soto', '40115011', 1500, 6, 'enviado',
  NOW() - INTERVAL '8 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000024'::uuid, 'Lisistrata Ramos', '41336036', 3500, 12, 'enviado',
  NOW() - INTERVAL '7 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000025'::uuid, 'Filoctetes Cruz', '41552052', 11000, 18, 'enviado',
  NOW() - INTERVAL '6 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000026'::uuid, 'Calirroe Mendoza', '41888088', 16000, 24, 'enviado',
  NOW() - INTERVAL '5 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000027'::uuid, 'Tucidides Quispe', '42220022', 20000, 24, 'enviado',
  NOW() - INTERVAL '4 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000028'::uuid, 'Aquiles Mamani', '43337037', 15000, 24, 'enviado',
  NOW() - INTERVAL '3 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000029'::uuid, 'Medea Apaza', '41884084', 14000, 18, 'enviado',
  NOW() - INTERVAL '2 days'
);

INSERT INTO public.fv_credit_applications (
  id, client_name, client_dni, amount, term_months, status, submitted_at
) VALUES (
  '60000000-0000-4000-8000-000000000030'::uuid, 'Esquines Rojas', '43334034', 30000, 24, 'enviado',
  NOW() - INTERVAL '1 days'
);


-- ─── fv_credit_applications (columnas extendidas si existen) ───

DO $$ BEGIN
  UPDATE public.fv_credit_applications AS a SET
    tea = v.tea,
    monthly_payment = v.cuota,
    purpose = v.purpose
  FROM (VALUES
    ('40118120', 43.92, 100.95, '[Canal: cliente] Crédito Empresarial — Microempresa — Capital de trabajo: compra de mercaderia | TEA 43.92% (sin seguro de desgravamen) | Garantía: sin garantia | Caso 1'),
    ('41223341', 40.92, 299.59, '[Canal: cliente] Crédito Empresarial — Microempresa — Compra de cocina industrial | TEA 40.92% (con seguro de desgravamen) | Garantía: sin garantia | Caso 2'),
    ('42330336', 43.92, 366.02, '[Canal: cliente] Crédito Empresarial — Microempresa — Maquinaria: sierra y cepillo | TEA 43.92% (sin seguro de desgravamen) | Garantía: sin garantia | Caso 3'),
    ('43440349', 43.92, 1480.73, '[Canal: cliente] Crédito Empresarial — Microempresa — Reposicion de stock por campana | TEA 43.92% (sin seguro de desgravamen) | Garantía: sin garantia | Caso 4'),
    ('40556071', 43.92, 1009.46, '[Canal: cliente] Crédito Empresarial — Microempresa — Ampliacion de local | TEA 43.92% (sin seguro de desgravamen) | Garantía: hipotecaria | Caso 5'),
    ('41669066', 40.92, 700.94, '[Canal: cliente] Crédito Empresarial — Microempresa — Compra de maquinas remalladoras | TEA 40.92% (con seguro de desgravamen) | Garantía: hipotecaria | Caso 6'),
    ('43773379', 43.92, 1098.07, '[Canal: cliente] Crédito Empresarial — Microempresa — Cuota inicial de vehiculo de carga | TEA 43.92% (sin seguro de desgravamen) | Garantía: vehicular | Caso 7'),
    ('40886086', 43.92, 1072.1, '[Canal: cliente] Crédito Empresarial — Microempresa — Ampliacion de galpon | TEA 43.92% (sin seguro de desgravamen) | Garantía: hipotecaria | Caso 8'),
    ('41990091', 43.92, 927.12, '[Canal: cliente] Crédito Empresarial — Microempresa — Capital para nueva sucursal | TEA 43.92% (sin seguro de desgravamen) | Garantía: hipotecaria | Caso 9'),
    ('43003039', 40.92, 1460.29, '[Canal: cliente] Crédito Empresarial — Microempresa — Equipamiento y stock farmaceutico | TEA 40.92% (con seguro de desgravamen) | Garantía: hipotecaria | Caso 10'),
    ('40110010', 43.92, 201.89, '[Canal: cliente] Crédito Empresarial — Microempresa — Compra de congeladora | TEA 43.92% (sin seguro de desgravamen) | Garantía: sin garantia | Caso 11'),
    ('41226021', 43.92, 292.82, '[Canal: cliente] Crédito Empresarial — Microempresa — Mobiliario y equipos de salon | TEA 43.92% (sin seguro de desgravamen) | Garantía: sin garantia | Caso 12'),
    ('43336033', 40.92, 599.17, '[Canal: cliente] Crédito Empresarial — Microempresa — Horno rotativo | TEA 40.92% (con seguro de desgravamen) | Garantía: sin garantia | Caso 13'),
    ('40550055', 43.92, 1388.18, '[Canal: cliente] Crédito Empresarial — Microempresa — Herramienta neumatica | TEA 43.92% (sin seguro de desgravamen) | Garantía: sin garantia | Caso 14'),
    ('41669166', 43.92, 536.05, '[Canal: cliente] Crédito Empresarial — Microempresa — Capital para campana agricola | TEA 43.92% (sin seguro de desgravamen) | Garantía: hipotecaria | Caso 15'),
    ('43880088', 40.92, 793.03, '[Canal: cliente] Crédito Empresarial — Microempresa — Compra de cuero y maquinaria | TEA 40.92% (con seguro de desgravamen) | Garantía: hipotecaria | Caso 16'),
    ('40119019', 43.92, 1362.77, '[Canal: cliente] Crédito Empresarial — Microempresa — Reposicion de inventario mayorista | TEA 43.92% (sin seguro de desgravamen) | Garantía: hipotecaria | Caso 17'),
    ('41226126', 43.92, 741.7, '[Canal: cliente] Crédito Empresarial — Microempresa — Ampliacion y remodelacion | TEA 43.92% (sin seguro de desgravamen) | Garantía: hipotecaria | Caso 18'),
    ('43339033', 40.92, 993, '[Canal: cliente] Crédito Empresarial — Microempresa — Compra de stock estructural | TEA 40.92% (con seguro de desgravamen) | Garantía: hipotecaria | Caso 19'),
    ('40556056', 43.92, 1390.89, '[Canal: cliente] Crédito Empresarial — Microempresa — Maquinaria de tejido plano | TEA 43.92% (sin seguro de desgravamen) | Garantía: hipotecaria | Caso 20'),
    ('43889089', 43.92, 1019.83, '[Canal: cliente] Crédito Empresarial — Microempresa — Cuota inicial de camion | TEA 43.92% (sin seguro de desgravamen) | Garantía: vehicular | Caso 21'),
    ('41003001', 40.92, 1401.88, '[Canal: cliente] Crédito Empresarial — Microempresa — Equipamiento de planta | TEA 40.92% (con seguro de desgravamen) | Garantía: hipotecaria | Caso 22'),
    ('40115011', 43.92, 277.64, '[Canal: cliente] Crédito Empresarial — Microempresa — Compra de vitrinas | TEA 43.92% (sin seguro de desgravamen) | Garantía: sin garantia | Caso 23'),
    ('41336036', 43.92, 353.31, '[Canal: cliente] Crédito Empresarial — Microempresa — Capital de trabajo | TEA 43.92% (sin seguro de desgravamen) | Garantía: sin garantia | Caso 24'),
    ('41552052', 40.92, 793.03, '[Canal: cliente] Crédito Empresarial — Microempresa — Ampliacion de local nuevo | TEA 40.92% (con seguro de desgravamen) | Garantía: sin garantia | Caso 25'),
    ('41888088', 43.92, 952.98, '[Canal: cliente] Crédito Empresarial — Microempresa — Maquinaria de mayor capacidad | TEA 43.92% (sin seguro de desgravamen) | Garantía: hipotecaria | Caso 26'),
    ('42220022', 40.92, 1168.23, '[Canal: cliente] Crédito Empresarial — Microempresa — Compra de stock y montacarga | TEA 40.92% (con seguro de desgravamen) | Garantía: hipotecaria | Caso 27'),
    ('43337037', 43.92, 893.42, '[Canal: cliente] Crédito Empresarial — Microempresa — Capital de trabajo | TEA 43.92% (sin seguro de desgravamen) | Garantía: hipotecaria | Caso 28'),
    ('41884084', 43.92, 1024.87, '[Canal: cliente] Crédito Empresarial — Microempresa — Compra de camioneta para reparto | TEA 43.92% (sin seguro de desgravamen) | Garantía: sin garantia | Caso 29'),
    ('43334034', 43.92, 1786.83, '[Canal: cliente] Crédito Empresarial — Microempresa — Compra de unidad de transporte | TEA 43.92% (sin seguro de desgravamen) | Garantía: vehicular | Caso 30')
  ) AS v(dni, tea, cuota, purpose)
  WHERE a.client_dni = v.dni;
EXCEPTION WHEN undefined_column THEN NULL;
END $$;


-- ─── Lista negra (caso 28 — Aquiles Mamani) ───

INSERT INTO public.fv_blacklist (dni, reason)
VALUES ('43337037', 'Registrado en lista de inhabilitados del sistema financiero (Caso 28)')
ON CONFLICT (dni) DO UPDATE SET reason = EXCLUDED.reason;


-- ─── Verificación ───

SELECT COUNT(*) AS casos_creditos_preaprobados FROM public.creditos_preaprobados WHERE id LIKE 'cli-caso%';

SELECT COUNT(*) AS casos_fv_solicitudes FROM public.fv_credit_applications WHERE client_dni IN (SELECT cedula FROM public.creditos_preaprobados WHERE id LIKE 'cli-caso%');