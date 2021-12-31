-- consulta 1
select o.titulo, o.edicion, count( distinct ot.cod_tema )
from obras as o natural join obra_tema as ot
where o.pais = 'URY'
group by o.cod_obra
having count( distinct ot.cod_tema ) <= 3;

-- consulta 2 (sin considerar repetidos)
select a.cod_autor, a.nombre_autor
from autores as a
where not exists (select 1 from obra_autor as oa natural join funciones as f
where oa.cod_autor = a.cod_autor and f.funcion <> 'autor')
and exists (select 1 from obra_autor as oa
where oa.cod_autor = a.cod_autor);

-- consulta 3 (exigiendo que tenga obras)
select a.nombre_autor
from autores as a
where not exists (select 1 from obra_autor oa join obra_editorial oe on oe.cod_obra = oa.cod_obra
where oa.cod_autor = a.cod_autor
group by oa.cod_obra
having count( distinct oe.cod_editorial ) = 1)
and exists (select 1 from obra_autor oa
where oa.cod_autor = a.cod_autor);

-- consulta 4
select o.titulo, o.isbn
from obras as o
natural join obra_editorial as oe natural join obra_autor as oa
group by o.cod_obra
having count( distinct oe.cod_editorial ) > count( distinct oa.cod_autor );

-- consulta 5
select e.cod_editorial, e.nombre_editorial
from obras as o natural join obra_editorial as oe natural join editoriales as e
where o.edicion = '1a. ed'
group by e.cod_editorial
having count( distinct o.cod_obra ) >=
(select count(*) from obras as o natural join obra_editorial as oe
where o.edicion = '1a. ed'
group by oe.cod_editorial
order by count(*) desc
limit 1);

-- consulta 6
select o.cod_obra
from obras as o natural join obra_autor as oa
where o.pais = 'ARG'
and 1 = (select count(*) from obra_autor oa2
					where oa2.cod_obra = oa.cod_obra)
and 1 < (select count(*) from obra_autor oa2
					where oa2.cod_autor = oa.cod_autor)
and (select count(*) from obra_autor oa2
			where oa2.cod_autor = oa.cod_autor) = 
		(select count(*) from obra_tema ot2 natural join obra_autor oa2
			where oa2.cod_autor = oa.cod_autor
			group by ot2.cod_tema
            order by count(*) desc
            limit 1);
            