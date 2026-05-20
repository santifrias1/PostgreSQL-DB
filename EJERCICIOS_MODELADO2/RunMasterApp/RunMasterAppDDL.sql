CREATE TABLE categoria (
	id_categoria INTEGER NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	CONSTRAINT categoria_pk PRIMARY KEY (id_categoria)
);

CREATE TABLE carrera (
	id_carrera INTEGER NOT NULL,
	nombre VARCHAR(100) NULL,
	fecha DATE NULL,
	distancia INTEGER NULL,
	ciudad VARCHAR(100) NULL,
	CONSTRAINT carrera_pk PRIMARY KEY (id_carrera)
);

CREATE TABLE catalogo_ejercicios (
	id_ejercicio INTEGER NOT NULL,
	nombre VARCHAR(100) NULL,
	descripcion TEXT NULL,
	enlace_video TEXT NULL,
	CONSTRAINT catalogo_ejercicios_pk PRIMARY KEY (id_ejercicio)
);

CREATE TABLE atleta (
	id_atleta INTEGER NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	peso NUMERIC(5,2) NULL,
	altura NUMERIC(4,2) NULL,
	fecha_nacimiento DATE NULL,
	nivel_experiencia VARCHAR(20) NULL,
	id_categoria INTEGER NULL,
	CONSTRAINT atleta_pk PRIMARY KEY (id_atleta),
	CONSTRAINT id_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE sesion (
	id_sesion INTEGER NOT NULL,
	fecha_programada DATE NULL,
	duracion_estimada INTERVAL NULL,
	nivel_fatiga VARCHAR(20) NULL,
	id_atleta INTEGER NULL,
	CONSTRAINT sesion_pk PRIMARY KEY (id_sesion),
	CONSTRAINT id_atleta FOREIGN KEY (id_atleta) REFERENCES atleta(id_atleta) ON DELETE CASCADE
);

CREATE TABLE atleta_carrera (
	tiempo TIME NULL,
	id_atleta INTEGER NULL,
	id_carrera INTEGER NULL,
	CONSTRAINT id_atleta FOREIGN KEY (id_atleta) REFERENCES atleta(id_atleta) ON DELETE CASCADE,
	CONSTRAINT id_carrera FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera) ON DELETE CASCADE
);

CREATE TABLE detalle_sesion (
	series INTEGER NULL,
	repeticiones INTEGER NULL,
	tiempo TIME NULL,
	id_sesion INTEGER NULL,
	id_ejercicio INTEGER NULL,
	CONSTRAINT id_ejercicio FOREIGN KEY (id_ejercicio) REFERENCES catalogo_ejercicios(id_ejercicio),
	CONSTRAINT id_sesion FOREIGN KEY (id_sesion) REFERENCES sesion(id_sesion) ON DELETE CASCADE
);