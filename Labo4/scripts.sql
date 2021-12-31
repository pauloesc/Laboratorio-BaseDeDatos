--3.2 - Parte 3 - a
EXPLAIN
	SELECT nom_emp , nom_resp_emp
	FROM empresas
	WHERE
		rubro_emp = 'Interactive entertainment';

EXPLAIN
	SELECT e. nom_emp , r. nom_resp_emp
	FROM empresas4nf e 
		JOIN empresas_rubros er ON e. id_emp = er . id_emp
		JOIN empresas_responsables eres ON er . id_emp = eres . id_emp
		JOIN responsables r ON r . id_resp_emp = eres . id_resp_emp
	WHERE
		rubro_emp = 'Interactive entertainment';


--3.2 - Parte 3 - e
SET enable_seqscan = ON;
EXPLAIN
	SELECT nom_emp , nom_resp_emp
	FROM empresas
	WHERE
		rubro_emp = 'Interactive entertainment';

SET enable_seqscan = OFF;
EXPLAIN
	SELECT e. nom_emp , r. nom_resp_emp
	FROM empresas4nf e 
		JOIN empresas_rubros er ON e. id_emp = er . id_emp
		JOIN empresas_responsables eres ON er . id_emp = eres . id_emp
		JOIN responsables r ON r . id_resp_emp = eres . id_resp_emp
	WHERE
		rubro_emp = 'Interactive entertainment';
