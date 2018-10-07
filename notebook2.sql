/*ejercicio 3_1*/
SELECT title FROM film;

/*ejercicio 3_2*/
SELECT DISTINCT release_year FROM sakila.film GROUP BY release_year;

/*ejercicio 3_3*/
SELECT title FROM sakila.film
WHERE 
    rental_duration > 4;
GO

/*ejercico 3_4*/

SELECT customer_id,rental_id,amount,payment_date FROM sakila.payment
WHERE
    payment_date BETWEEN cast('2005-07-01'AS date) AND cast('2005-08-01'AS date);
GO

/*ejercicio 4_1*/
SELECT count(*) AS total FROM sakila.customer;

/*ejercicio 4_2*/
SELECT count(*) FROM sakila.rental GROUP BY customer_id;

/*ejercicio 4_3*/
SELECT MAX(total) FROM (SELECT customer_id,count(*) AS total FROM sakila.rental GROUP BY customer_id) AS t1;
/*numero maximo de arriendos de un cliente de todos los clientes*/

/*ejercicio 4_5*/
SELECT staff_id,count(*) AS total FROM sakila.payment GROUP BY staff_id;
/*ejercicio 4_6*/

SELECT staff_id,MAX(total) FROM
(
SELECT staff_id,SUM(amount) AS total FROM sakila.payment
WHERE
	payment_date BETWEEN cast('2005-08-23 00:00:00' AS datetime) AND cast('2005-08-23 23:59:59' AS datetime)
GROUP BY
    staff_id
ORDER BY total DESC
) AS t1;


/*ejercicio 5_1*/

SELECT title,name AS lang FROM sakila.film AS t1 INNER JOIN sakila.language AS t2;


/*ejercicio 5_2*/

SELECT first_name AS "NOMBRE", last_name AS "APELLIDO", rental_id, title, inventory_id
FROM sakila.customer AS t1
INNER JOIN sakila.film AS t2 ON t2.title = "CHICAGO NORTH"
INNER JOIN sakila.inventory AS t4 ON t4.film_id = t2.film_id
INNER JOIN sakila.rental AS t3 ON t3.inventory_id = t4.inventory_id AND t1.customer_id = t3.customer_id


/*ejercicio 5_3*/

SELECT first_name AS "NOMBRE", last_name AS "APELLIDO", city AS "CIUDAD"
FROM sakila.customer AS t1
INNER JOIN sakila.address AS t3 ON t3.address_id = t1.address_id
INNER JOIN sakila.city AS t2 ON t3.city_id=t2.city_id;


/*ejercicio 5_4*/

SELECT title, count(*)
FROM  sakila.film AS t1
INNER JOIN sakila.inventory AS t2 ON t2.film_id = t1.film_id
INNER JOIN sakila.rental AS t3 ON t3.inventory_id = t2.inventory_id
GROUP BY title;


/*ejercicio 5_5*/

SELECT filmtitle, MAX(total)
FROM
(
SELECT title AS filmtitle, sum(amount) AS total
FROM sakila.payment AS t1
INNER JOIN sakila.rental AS t2 ON t1.rental_id = t2.rental_id
INNER JOIN sakila.inventory AS t3 ON t3.inventory_id = t2.inventory_id
INNER JOIN sakila.film AS t4 ON t4.film_id = t3.film_id
GROUP BY title
ORDER BY total DESC
)
AS tfinal;


/*ejercicio 5_6*/

SELECT first_name, last_name, amount
FROM sakila.customer
INNER JOIN sakila.payment USING(customer_id)
WHERE
    amount > 10
GROUP BY customer_id;


