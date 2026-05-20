CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE parcelas (
    id_parcela SERIAL PRIMARY KEY,
    ubicacion_gps VARCHAR(100) NOT NULL,
    tamanio_hectareas NUMERIC(10, 2) NOT NULL,
    tipo_suelo VARCHAR(50) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

CREATE TABLE cultivos (
    id_cultivo SERIAL PRIMARY KEY,
    nombre_cultivo VARCHAR(50) NOT NULL UNIQUE,
    humedad_optima NUMERIC(5, 2) NOT NULL,
    tiempo_cosecha_dias INT NOT NULL
);

CREATE TABLE plantaciones_historial (
    id_parcela INT,
    id_cultivo INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    PRIMARY KEY (id_parcela, id_cultivo, fecha_inicio),
    FOREIGN KEY (id_parcela) REFERENCES parcelas(id_parcela) ON DELETE CASCADE,
    FOREIGN KEY (id_cultivo) REFERENCES cultivos(id_cultivo) ON DELETE RESTRICT
);

CREATE TABLE drones (
    numero_serie VARCHAR(100) PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    fecha_compra DATE NOT NULL
);

CREATE TABLE sensores (
    id_sensor SERIAL PRIMARY KEY,
    tipo_sensor VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

CREATE TABLE dron_sensores (
    numero_serie_dron VARCHAR(100),
    id_sensor INT,
    fecha_instalacion DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (numero_serie_dron, id_sensor),
    FOREIGN KEY (numero_serie_dron) REFERENCES drones(numero_serie) ON DELETE CASCADE,
    FOREIGN KEY (id_sensor) REFERENCES sensores(id_sensor) ON DELETE CASCADE
);

CREATE TABLE vuelos (
    id_vuelo SERIAL PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    nivel_anomalias_detectadas VARCHAR(50) NOT NULL,
    enlace_reporte_pdf VARCHAR(255),
    numero_serie_dron VARCHAR(100) NOT NULL,
    id_parcela INT NOT NULL,
    FOREIGN KEY (numero_serie_dron) REFERENCES drones(numero_serie),
    FOREIGN KEY (id_parcela) REFERENCES parcelas(id_parcela)
);