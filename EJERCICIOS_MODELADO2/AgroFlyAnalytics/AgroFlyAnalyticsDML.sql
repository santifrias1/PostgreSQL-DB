INSERT INTO clientes (nombre, correo, telefono) VALUES
('Juan Pérez', 'juan.perez@email.com', '+54 9 11 2345-6789'),
('María González', 'maria.gonzalez@email.com', '+54 9 381 543-8901'),
('Carlos Romero', 'carlos.romero@email.com', '+54 9 3865 56-9012');

INSERT INTO parcelas (ubicacion_gps, tamanio_hectareas, tipo_suelo, id_cliente) VALUES
('-34.6037, -58.3816', 120.50, 'Franco arcilloso', 1),
('-31.4201, -64.1888', 85.75, 'Arenoso', 2),
('-32.8908, -68.8272', 200.00, 'Franco limoso', 3);

INSERT INTO cultivos (nombre_cultivo, humedad_optima, tiempo_cosecha_dias) VALUES
('Soja', 65.00, 120),
('Maíz', 70.00, 150),
('Trigo', 55.00, 180);

INSERT INTO plantaciones_historial (id_parcela, id_cultivo, fecha_inicio, fecha_fin) VALUES
(1, 1, '2024-10-01', '2025-02-01'),
(2, 2, '2024-11-15', '2025-04-15'),
(3, 3, '2024-06-01', NULL);

INSERT INTO drones (numero_serie, modelo, fecha_compra) VALUES
('DJI-AGR-001', 'DJI Agras T40', '2023-03-15'),
('DJI-AGR-002', 'DJI Agras T20P', '2023-07-22'),
('XAG-P100-003', 'XAG P100', '2024-01-10');

INSERT INTO sensores (tipo_sensor, descripcion) VALUES
('Cámara Multiespectral', 'Captura imágenes en múltiples bandas espectrales para análisis de vegetación'),
('Sensor de Humedad', 'Mide el nivel de humedad del suelo en tiempo real'),
('Sensor NDVI', 'Calcula el índice de vegetación de diferencia normalizada');

INSERT INTO dron_sensores (numero_serie_dron, id_sensor, fecha_instalacion) VALUES
('DJI-AGR-001', 1, '2023-03-20'),
('DJI-AGR-001', 2, '2023-03-20'),
('DJI-AGR-002', 3, '2023-08-01');

INSERT INTO vuelos (fecha_hora, nivel_anomalias_detectadas, enlace_reporte_pdf, numero_serie_dron, id_parcela) VALUES
('2025-01-10 08:30:00', 'Bajo', 'https://agrofly.io/reportes/vuelo_001.pdf', 'DJI-AGR-001', 1),
('2025-02-14 10:15:00', 'Medio', 'https://agrofly.io/reportes/vuelo_002.pdf', 'DJI-AGR-002', 2),
('2025-03-05 07:45:00', 'Alto', 'https://agrofly.io/reportes/vuelo_003.pdf', 'XAG-P100-003', 3);