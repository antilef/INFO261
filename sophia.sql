SELECT count(*)
FROM contener
WHERE valor = "mapuche";


SELECT nombre,valor,count(*)
FROM noticia as t1 inner join contener as t2 ON t1.noticia_id = t2.noticia_id
WHERE valor ="Cambio Climatico" GROUP BY (nombre);
ORDER BY count(*) DESC 
#ASC
