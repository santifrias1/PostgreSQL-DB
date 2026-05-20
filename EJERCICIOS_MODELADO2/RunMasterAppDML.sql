INSERT INTO public.categoria (id_categoria, nombre) VALUES
(1, 'Principiante'),
(2, 'Intermedio'),
(3, 'Avanzado');

INSERT INTO public.carrera (id_carrera, nombre, fecha, distancia, ciudad) VALUES
(1, 'Maratón de Concepcion', '2025-10-19', 42, 'Tucuman'),
(2, 'Media Maratón de Termas de Rio Hondo', '2025-09-07', 21, 'Santiago del estero'),
(3, 'Carrera 10K Carlos Paz', '2025-08-03', 10, 'Cordoba');

INSERT INTO public.catalogo_ejercicios (id_ejercicio, nombre, descripcion, enlace_video) VALUES
(1, 'Sentadilla', 'Trabaja cuádriceps, isquiotibiales y glúteos.', 'https://youtube.com/sentadilla'),
(2, 'Plancha abdominal', 'Posición sostenida apoyando antebrazos. Activa el core.', 'https://youtube.com/plancha'),
(3, 'Burpee', 'Movimiento explosivo completo: sentadilla, plancha y salto.', 'https://youtube.com/burpee');

INSERT INTO public.atleta (id_atleta, nombre, apellido, peso, altura, fecha_nacimiento, nivel_experiencia, id_categoria) VALUES
(1, 'Juan',   'Perez', 58.5, 1.65, '1993-04-12', 'Avanzado',     3),
(2, 'Marcos',  'González',  72.0, 1.78, '1988-11-30', 'Intermedio',   2),
(3, 'Valentina','Romero',   55.0, 1.60, '2000-06-25', 'Principiante', 1);

INSERT INTO public.sesion (id_sesion, fecha_programada, duracion_estimada, nivel_fatiga, id_atleta) VALUES
(1, '2025-07-01', '01:30:00', 'Alto',     1),
(2, '2025-07-03', '01:00:00', 'Moderado', 2),
(3, '2025-07-02', '00:30:00', 'Bajo',     3);

INSERT INTO public.atleta_carrera (tiempo, id_atleta, id_carrera) VALUES
('04:15:32', 1, 1),
('01:52:10', 2, 2),
('00:55:18', 3, 3);

INSERT INTO public.detalle_sesion (series, repeticiones, tiempo, id_sesion, id_ejercicio) VALUES
(4, 12,   NULL,       1, 1),
(3, NULL, '00:01:00', 2, 2),
(3, 10,   NULL,       3, 3);
