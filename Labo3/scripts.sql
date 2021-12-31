--Laboratorio 3 de FBD - Grupo 51 - Paulo Sánchez - Samuel Noble

--Actividad 1

--Ejercicio 1
--Cantidad de tuplas de la tabla empresas
select count(*) from empresas;


--Ejercicio 3
--Validando si existen más de un nombre de empresa para un mismo id de empresa.
select id_emp, count(distinct nom_emp)
from empresas
group by id_emp
having count(distinct nom_emp) > 1;

--Validando si existen más de una descripción de empresa para un mismo id de empresa.
select id_emp, count(distinct desc_emp)
from empresas
group by id_emp
having count(distinct desc_emp) > 1;

--Validando si existen más de una fecha de fundación de empresa para un mismo id de empresa.
select id_emp, count(distinct fecha_fund_emp)
from empresas
group by id_emp
having count(distinct fecha_fund_emp) > 1;

--Validando si existen más de un nombre de ciudad donde opera una empresa para un mismo id de ciudad donde opera la empresa.
select id_ciudad_oper_emp, count(distinct ciudad_oper_emp)
from empresas
group by id_ciudad_oper_emp
having count(distinct ciudad_oper_emp) > 1;

--Validando si existen más de un id de país para un mismo id de ciudad donde opera la empresa.
select id_ciudad_oper_emp, count(distinct id_pais_oper_emp)
from empresas
group by id_ciudad_oper_emp
having count(distinct id_pais_oper_emp) > 1;

--Validando si existen más de un nombre de país donde opera la empresa para un mismo id de país donde opera la empresa.
select id_pais_oper_emp, count(distinct pais_oper_emp)
from empresas
group by id_pais_oper_emp
having count(distinct pais_oper_emp) > 1;

--Validando si existen más de un nombre de responsable de empresa para un mismo id de responsable de empresa.
select id_resp_emp, count(distinct nom_resp_emp)
from empresas
group by id_resp_emp
having count(distinct nom_resp_emp) > 1;

--Validando si existen más de un apellido de responsable de empresa para un mismo id de responsable de empresa.
select id_resp_emp, count(distinct ap_resp_emp)
from empresas
group by id_resp_emp
having count(distinct ap_resp_emp) > 1;

--Validando si existen más de una fecha de nacimiento de responsable de empresa para un mismo id de responsable de empresa.
select id_resp_emp, count(distinct fnac_resp_emp)
from empresas
group by id_resp_emp
having count(distinct fnac_resp_emp) > 1;

--Validando si existen más de una ciudad de nacimiento de responsable de empresa para un mismo id de responsable de empresa.
select id_resp_emp, count(distinct id_ciu_nac_resp_emp)
from empresas
group by id_resp_emp
having count(distinct id_ciu_nac_resp_emp) > 1;

--Validando si existen más de un nombre de ciudad de nacimiento de responsable de empresa para un mismo id de ciudad de nacimiento de responsable de empresa.
select id_ciu_nac_resp_emp, count(distinct ciu_nac_resp_emp)
from empresas
group by id_ciu_nac_resp_emp
having count(distinct ciu_nac_resp_emp) > 1;

--Validando si existen más de un id de país de nacimiento de responsable de empresa para un mismo id de ciudad de nacimiento de responsable de empresa.
select id_ciu_nac_resp_emp, count(distinct id_pais_nac_resp_emp)
from empresas
group by id_ciu_nac_resp_emp
having count(distinct id_pais_nac_resp_emp) > 1;

--Validando si existen más de un nombre de país de nacimiento de responsable de empresa para un mismo id de país de nacimiento de responsable de empresa.
select id_pais_nac_resp_emp, count(distinct pais_nac_resp_emp)
from empresas
group by id_pais_nac_resp_emp
having count(distinct pais_nac_resp_emp) > 1 ;

--Validando si existen más de un nombre de producto para un mismo id de producto.
select id_prod, count(distinct nom_prod)
from empresas
group by id_prod
having count(distinct nom_prod) > 1;

--Validando si existen más de una descripción de producto para un mismo id de producto.
select id_prod, count(distinct desc_prod)
from empresas
group by id_prod
having count(distinct desc_prod) > 1;


--Ejercicio 5
--Cantidad de tuplas en las que se detectó una violación por nulo en algún atributo de la clave.
select rubro_emp, id_emp, id_ciudad_oper_emp, id_resp_emp, id_prod
from empresas
where rubro_emp is null or id_emp is null 
	or id_ciudad_oper_emp is null or id_resp_emp is null 
	or id_prod is null or rubro_emp = '' or id_emp = '' 
	or id_ciudad_oper_emp = '' or id_resp_emp = '' 
	or id_prod = '';
	
--Cada tupla nos mostrará los atributos de la clave y cuántas veces ésta se repite en la tabla empresa, violando la duplicidad de la clave.
select count(*), rubro_emp, id_emp, id_ciudad_oper_emp, id_resp_emp, id_prod
from empresas
group by rubro_emp, id_emp, id_ciudad_oper_emp, id_resp_emp, id_prod
having count(*) > 1;

--Ejercicio 6
--Parte a
--Se crea la tabla empresas2, con la misma estructura que empresas.
CREATE TABLE public.empresas2
(
	id_emp character varying NOT NULL,
	nom_emp character varying,
	desc_emp text,
	rubro_emp character varying,
	id_ciudad_oper_emp character varying,
	ciudad_oper_emp character varying,
	id_pais_oper_emp character varying,
	pais_oper_emp character varying,
	fecha_fund_emp integer,
	id_resp_emp character varying,
	nom_resp_emp character varying,
	ap_resp_emp character varying,
	fnac_resp_emp date,
	id_ciu_nac_resp_emp character varying,
	ciu_nac_resp_emp character varying,
	id_pais_nac_resp_emp character varying,
	pais_nac_resp_emp character varying,
	id_prod character varying,
	nom_prod character varying,
	desc_prod character varying
)
WITH (
	OIDS=FALSE
);

--Ejercicio 6
--Parte b
--Se genera la clave (rubro_emp, id_emp, id_ciudad_oper_emp, id_resp_emp, id_prod) en la tabla empresas2.
ALTER TABLE public.empresas2 ADD PRIMARY KEY (rubro_emp, id_emp, id_ciudad_oper_emp, id_resp_emp, id_prod);

--Ejercicio 6
--Parte c
insert into public.empresas2 
(
	id_emp, nom_emp, desc_emp, rubro_emp, id_ciudad_oper_emp, ciudad_oper_emp, 
	id_pais_oper_emp, pais_oper_emp, fecha_fund_emp, id_resp_emp, nom_resp_emp, 
	ap_resp_emp, fnac_resp_emp, id_ciu_nac_resp_emp, ciu_nac_resp_emp, id_pais_nac_resp_emp, 
	pais_nac_resp_emp, id_prod, nom_prod, desc_prod
) 
select 
	coalesce(nullif(id_emp,''), 'SIN INFORMACION DE EMPRESA'), nom_emp, desc_emp, 
	coalesce(nullif(rubro_emp,''), 'SIN INFORMACION DE RUBRO'), coalesce(nullif(id_ciudad_oper_emp,''), 'SIN INFORMACION DE CIUDAD'), 
	ciudad_oper_emp, id_pais_oper_emp, pais_oper_emp, fecha_fund_emp, coalesce(nullif(id_resp_emp,''), 'SIN INFORMACION DE RESPONSABLE'), 
	nom_resp_emp, ap_resp_emp, fnac_resp_emp, id_ciu_nac_resp_emp, ciu_nac_resp_emp, id_pais_nac_resp_emp, pais_nac_resp_emp, 
	coalesce(nullif(id_prod,''), 'SIN INFORMACION DE PRODUCTO'), nom_prod, desc_prod 
from public.empresas 
ON CONFLICT (rubro_emp, id_emp, id_ciudad_oper_emp, id_resp_emp, id_prod) DO NOTHING;

--Valida si existe alguna id de empresa que exista en la tabla empresas, pero no esté en la tabla empresas2.
select distinct id_emp 
from empresas e 
where id_emp not in
	(select id_emp from empresas2 e2 where e2.id_emp = e.id_emp);


--Ejercicio 7
--Parte a
--Se crea la tabla empresas3 con la misma estructura que empresas.
CREATE TABLE public.empresas3
(
	id_emp character varying NOT NULL,
	nom_emp character varying,
	desc_emp text,
	rubro_emp character varying,
	id_ciudad_oper_emp character varying,
	ciudad_oper_emp character varying,
	id_pais_oper_emp character varying,
	pais_oper_emp character varying,
	fecha_fund_emp integer,
	id_resp_emp character varying,
	nom_resp_emp character varying,
	ap_resp_emp character varying,
	fnac_resp_emp date,
	id_ciu_nac_resp_emp character varying,
	ciu_nac_resp_emp character varying,
	id_pais_nac_resp_emp character varying,
	pais_nac_resp_emp character varying,
	id_prod character varying,
	nom_prod character varying,
	desc_prod character varying
)
WITH (
	OIDS=FALSE
);

--Clave de la tabla empresas3.
ALTER TABLE public.empresas3 ADD PRIMARY KEY (rubro_emp, id_emp, id_ciudad_oper_emp, id_resp_emp, id_prod);


--Ejercicio 7
--Parte b
--Se crea la función que será usada en el trigger.
--El mismo verificará id_emp, rubro_emp, id_ciudad_oper_emp, id_resp_emp e id_prod por si alguno es nulo, y lo convertirá en un texto.
--Además, si encuentra otra tupla ya ingresada con los mismos valores en los atributos de la clave, entonces no agrega la tupla.
DROP FUNCTION IF EXISTS public.processingNewLine() CASCADE;
CREATE FUNCTION public.processingNewLine() RETURNS trigger AS $$
BEGIN
	IF NEW.id_emp is NULL OR NEW.id_emp = '' THEN 
		NEW.id_emp := 'SIN INFORMACION DE LA EMPRESA';
	END IF;
	IF NEW.rubro_emp is NULL OR NEW.rubro_emp = '' THEN 
		NEW.rubro_emp := 'SIN INFORMACION DEL RUBRO';
	END IF;
	IF NEW.id_ciudad_oper_emp is NULL OR NEW.id_ciudad_oper_emp = '' THEN 
		NEW.id_ciudad_oper_emp := 'SIN INFORMACION DE LA CIUDAD';
	END IF;
	IF NEW.id_resp_emp is NULL OR NEW.id_resp_emp = '' THEN 
		NEW.id_resp_emp := 'SIN INFORMACION DEL RESPONSABLE';
	END IF;
	IF NEW.id_prod is NULL OR NEW.id_prod = '' THEN 
		NEW.id_prod := 'SIN INFORMACION DEL PRODUCTO';
	END IF;

	IF EXISTS(SELECT 1 FROM public.empresas3 
			  WHERE id_emp = NEW.id_emp AND id_ciudad_oper_emp = NEW.id_ciudad_oper_emp
			 	AND rubro_emp = NEW.rubro_emp AND id_prod = NEW.id_prod
			 	AND id_resp_emp = NEW.id_resp_emp) THEN
		RETURN NULL;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--Se crea el trigger para que se ejecute antes de insertar la tupla.
CREATE TRIGGER processing_before_inserting
BEFORE INSERT ON public.empresas3
FOR EACH ROW
EXECUTE PROCEDURE public.processingNewLine();

--Se cargan los datos en empresas3 desde empresas.
insert into public.empresas3 
(
	id_emp, nom_emp, desc_emp, rubro_emp, id_ciudad_oper_emp, ciudad_oper_emp, id_pais_oper_emp, pais_oper_emp, 
	fecha_fund_emp, id_resp_emp, nom_resp_emp, ap_resp_emp, fnac_resp_emp, id_ciu_nac_resp_emp, ciu_nac_resp_emp, 
	id_pais_nac_resp_emp, pais_nac_resp_emp, id_prod, nom_prod, desc_prod
)
select 
	id_emp, nom_emp, desc_emp, rubro_emp, id_ciudad_oper_emp, ciudad_oper_emp, id_pais_oper_emp, pais_oper_emp, 
	fecha_fund_emp, id_resp_emp, nom_resp_emp, ap_resp_emp, fnac_resp_emp, id_ciu_nac_resp_emp, ciu_nac_resp_emp, 
	id_pais_nac_resp_emp, pais_nac_resp_emp, id_prod, nom_prod, desc_prod
from public.empresas;

--Valida si existe alguna id de empresa que exista en la tabla empresas, pero no esté en la tabla empresas3.
select distinct id_emp 
from empresas e 
where id_emp not in
	(select id_emp from empresas3 e3 where e3.id_emp = e.id_emp);

--Actividad 2
--Ejercicio 11
--Parte a
--Se crea la tabla de empresas (R1)
CREATE TABLE public.R1
(
	id_emp character varying NOT NULL,
	nom_emp character varying,
	desc_emp text,
	fecha_fund_emp integer
)
WITH (
OIDS=FALSE
);

--Se crea la tabla de ciudades (R2N)
CREATE TABLE public.R2N
(
	id_ciudad character varying,
	ciudad character varying,
	id_pais character varying
)
WITH (
OIDS=FALSE
);

--Se crea la tabla de paises (R3N)
CREATE TABLE public.R3N
(
	id_pais character varying,
	pais character varying
)
WITH (
OIDS=FALSE
);

--Se crea la tabla de responsables de empresa (R4)
CREATE TABLE public.R4
(
	id_resp_emp character varying,
	nom_resp_emp character varying,
	ap_resp_emp character varying,
	fnac_resp_emp date,
	id_ciudad character varying
)
WITH (
OIDS=FALSE
);

--Se crea la tabla de productos (R7)
CREATE TABLE public.R7
(
	id_prod character varying,
	nom_prod character varying,
	desc_prod character varying
)
WITH (
OIDS=FALSE
);

--Se crea la tabla que relaciona las empresas y sus rubros.
CREATE TABLE public.R81
(
	id_emp character varying NOT NULL,
	rubro_emp character varying
)
WITH (
OIDS=FALSE
);

--Se crea la tabla que relaciona las empresas y las ciudades donde operan estas empresas.
CREATE TABLE public.R82
(
	id_emp character varying NOT NULL,
	id_ciudad character varying
)
WITH (
OIDS=FALSE
);

--Se crea la tabla que relaciona las empresas y sus responsables.
CREATE TABLE public.R83
(
id_emp character varying NOT NULL,
id_resp_emp character varying
)
WITH (
OIDS=FALSE
);

--Se crea la tabla que relaciona las empresas y sus productos.
CREATE TABLE public.R84
(
id_emp character varying NOT NULL,
id_prod character varying
)
WITH (
OIDS=FALSE
);

--Se generan las claves de cada tabla.
ALTER TABLE public.R1 ADD PRIMARY KEY (id_emp);
ALTER TABLE public.R2N ADD PRIMARY KEY (id_ciudad);
ALTER TABLE public.R3N ADD PRIMARY KEY (id_pais);
ALTER TABLE public.R4 ADD PRIMARY KEY (id_resp_emp);
ALTER TABLE public.R7 ADD PRIMARY KEY (id_prod);
ALTER TABLE public.R81 ADD PRIMARY KEY (id_emp, rubro_emp);
ALTER TABLE public.R82 ADD PRIMARY KEY (id_emp, id_ciudad);
ALTER TABLE public.R83 ADD PRIMARY KEY (id_emp, id_resp_emp);
ALTER TABLE public.R84 ADD PRIMARY KEY (id_emp, id_prod);

--Se generan las foreign keys.
ALTER TABLE public.R2N ADD FOREIGN KEY (id_pais) REFERENCES public.R3N (id_pais);
ALTER TABLE public.R4 ADD FOREIGN KEY (id_ciudad) REFERENCES public.R2N (id_ciudad);
ALTER TABLE public.R81 ADD FOREIGN KEY (id_emp) REFERENCES public.R1 (id_emp);
ALTER TABLE public.R82 ADD FOREIGN KEY (id_emp) REFERENCES public.R1 (id_emp);
ALTER TABLE public.R82 ADD FOREIGN KEY (id_ciudad) REFERENCES public.R2N (id_ciudad);
ALTER TABLE public.R83 ADD FOREIGN KEY (id_emp) REFERENCES public.R1 (id_emp);
ALTER TABLE public.R83 ADD FOREIGN KEY (id_resp_emp) REFERENCES public.R4 (id_resp_emp);
ALTER TABLE public.R84 ADD FOREIGN KEY (id_emp) REFERENCES public.R1 (id_emp);
ALTER TABLE public.R84 ADD FOREIGN KEY (id_prod) REFERENCES public.R7 (id_prod);


--Ejercicio 11
--Parte b
INSERT INTO public.R3N (id_pais, pais)
SELECT id_pais_oper_emp id_pais, pais_oper_emp pais FROM public.empresas
where id_pais_oper_emp is not null and id_pais_oper_emp <> ''
ON CONFLICT (id_pais) DO NOTHING;

INSERT INTO public.R3N (id_pais, pais)
SELECT id_pais_nac_resp_emp id_pais, pais_nac_resp_emp pais FROM public.empresas
where id_pais_nac_resp_emp is not null and id_pais_nac_resp_emp <> ''
ON CONFLICT (id_pais) DO NOTHING;

INSERT INTO public.R2N (id_ciudad, ciudad, id_pais)
SELECT id_ciu_nac_resp_emp id_ciudad, ciu_nac_resp_emp ciudad, id_pais_nac_resp_emp id_pais FROM public.empresas
where id_ciu_nac_resp_emp is not null and id_ciu_nac_resp_emp <> ''
ON CONFLICT (id_ciudad) DO NOTHING;

INSERT INTO public.R2N (id_ciudad, ciudad, id_pais)
SELECT id_ciudad_oper_emp id_ciudad, ciudad_oper_emp ciudad, id_pais_oper_emp id_pais FROM public.empresas
where id_ciudad_oper_emp is not null and id_ciudad_oper_emp <> ''
ON CONFLICT (id_ciudad) DO NOTHING;

INSERT INTO public.R1 (id_emp, nom_emp, desc_emp, fecha_fund_emp)
SELECT id_emp, nom_emp, desc_emp, fecha_fund_emp FROM public.empresas
WHERE id_emp is not null and id_emp <> ''
ON CONFLICT (id_emp) DO NOTHING;

INSERT INTO public.R4 (id_resp_emp, nom_resp_emp, ap_resp_emp, fnac_resp_emp, id_ciudad)
SELECT id_resp_emp, nom_resp_emp, ap_resp_emp, fnac_resp_emp, id_ciu_nac_resp_emp id_ciudad FROM public.empresas
where id_resp_emp is not null and id_resp_emp <> ''
ON CONFLICT (id_resp_emp) DO NOTHING;

INSERT INTO public.R7 (id_prod, nom_prod, desc_prod)
SELECT id_prod, nom_prod, desc_prod FROM public.empresas
where id_prod is not null and id_prod <> ''
ON CONFLICT (id_prod) DO NOTHING;

INSERT INTO public.R81 (id_emp, rubro_emp)
SELECT id_emp, rubro_emp FROM public.empresas
where id_emp is not null and rubro_emp is not null
	and id_emp <> '' and rubro_emp <> ''
ON CONFLICT (id_emp, rubro_emp) DO NOTHING;

INSERT INTO public.R82 (id_emp, id_ciudad)
SELECT id_emp, id_ciudad_oper_emp id_ciudad FROM public.empresas
where id_emp is not null and id_ciudad_oper_emp is not null
	and id_emp <> '' and id_ciudad_oper_emp <> ''
ON CONFLICT (id_emp, id_ciudad) DO NOTHING;

INSERT INTO public.R83 (id_emp, id_resp_emp)
SELECT id_emp, id_resp_emp FROM public.empresas
where id_emp is not null and id_resp_emp is not null 
	and id_emp <> '' and id_resp_emp <> ''
ON CONFLICT (id_emp, id_resp_emp) DO NOTHING;

INSERT INTO public.R84 (id_emp, id_prod)
SELECT id_emp, id_prod FROM public.empresas
where id_emp is not null and id_prod is not null
	and id_emp <> '' and id_prod <> ''
ON CONFLICT (id_emp, id_prod) DO NOTHING;


--Ejercicio 12
--Cuenta la cantidad de tuplas que hay en todas las tablas generadas en el ejercicio 11.
SELECT 
((SELECT COUNT(*) FROM public.R1)
+(SELECT COUNT(*) FROM public.R2N)
+(SELECT COUNT(*) FROM public.R3N)
+(SELECT COUNT(*) FROM public.R4)
+(SELECT COUNT(*) FROM public.R7)
+(SELECT COUNT(*) FROM public.R81)
+(SELECT COUNT(*) FROM public.R82)
+(SELECT COUNT(*) FROM public.R83)
+(SELECT COUNT(*) FROM public.R84)) ts;

--Cuenta la cantidad de tuplas de la tabla empresas
SELECT COUNT(*) FROM public.empresas;
