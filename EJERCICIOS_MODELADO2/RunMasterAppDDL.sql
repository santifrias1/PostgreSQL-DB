CREATE TABLE public.categoria (
	id_categoria int4 NOT NULL,
	nombre varchar NOT NULL,
	CONSTRAINT categoria_pk PRIMARY KEY (id_categoria)
);

CREATE TABLE public.carrera (
	id_carrera int4 NOT NULL,
	nombre varchar NULL,
	fecha date NULL,
	distancia int4 NULL,
	ciudad varchar NULL,
	CONSTRAINT carrera_pk PRIMARY KEY (id_carrera)
);

CREATE TABLE public.catalogo_ejercicios (
	id_ejercicio int4 NOT NULL,
	nombre varchar NULL,
	descripcion text NULL,
	enlace_video text NULL,
	CONSTRAINT catalogo_ejercicios_pk PRIMARY KEY (id_ejercicio)
);

CREATE TABLE public.atleta (
	id_atleta int4 NOT NULL,
	nombre varchar NOT NULL,
	apellido varchar NOT NULL,
	peso numeric NULL,
	altura numeric NULL,
	fecha_nacimiento date NULL,
	nivel_experiencia varchar NULL,
	id_categoria int4 NULL,
	CONSTRAINT atleta_pk PRIMARY KEY (id_atleta),
	CONSTRAINT id_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria)
);

CREATE TABLE public.sesion (
	id_sesion int4 NOT NULL,
	fecha_programada date NULL,
	duracion_estimada interval NULL,
	nivel_fatiga varchar NULL,
	id_atleta int4 NULL,
	CONSTRAINT sesion_pk PRIMARY KEY (id_sesion),
	CONSTRAINT id_atleta FOREIGN KEY (id_atleta) REFERENCES public.atleta(id_atleta)
);

CREATE TABLE public.atleta_carrera (
	tiempo time NULL,
	id_atleta int4 NULL,
	id_carrera int4 NULL,
	CONSTRAINT id_atleta FOREIGN KEY (id_atleta) REFERENCES public.atleta(id_atleta),
	CONSTRAINT id_carrera FOREIGN KEY (id_carrera) REFERENCES public.carrera(id_carrera)
);

CREATE TABLE public.detalle_sesion (
	series int4 NULL,
	repeticiones int4 NULL,
	tiempo time NULL,
	id_sesion int4 NULL,
	id_ejercicio int4 NULL,
	CONSTRAINT id_ejercicio FOREIGN KEY (id_ejercicio) REFERENCES public.catalogo_ejercicios(id_ejercicio),
	CONSTRAINT id_sesion FOREIGN KEY (id_sesion) REFERENCES public.sesion(id_sesion)
);