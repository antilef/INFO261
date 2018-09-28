select title from film LIMIT 20;
SELECT DISTINCT release_year from film;
select title from film where rental_duration>4;
SELECT customer_id,rental_id,amount,payment_date
 from payment where payment_date BETWEEN 
 cast('2005-07-01' AS DATE)
 AND CAST('2005-08-01' AS DATE);

select COUNT(*) from customer;
select customer_id,COUNT(*) from rental GROUP BY customer_id;
SELECT staff_id ,count(*) from payment group by staff_id;


SELECT MAX(staff),staff_id FROM(SELECT staff_id,count(*)  as staff 
from payment where payment_date BETWEEN   cast('2005-08-23 00:00:00' AS DATE)
AND CAST('2005-08-24 00:00:00' AS DATE) GROUP BY staff_id) as t2;


SELECT title,name from  film as t1 inner join language as t2;

					
SELECT first_name ,last_name from customer as t1 inner join film as t2 where
 t2.title='CHICAGO NORTH';

SELECT first_name,last_name,city from customer as t1 inner join city as t2;

select title,COUNT(*)from inventory as t1 inner join film as t2 inner join rental as t3  
where t1.film_id=t2.film_id AND t1.inventory_id=t3.inventory_id GROUP BY title;

SELECT MAX(finalsum),title FROM (SELECT SUM(amount) as finalsum,title from film as t1 
inner join inventory as t2 inner join rental as t3
inner join payment as t4 where  t1.film_id=t2.film_id AND t3.inventory_id=t2.inventory_id 
AND t4.rental_id=t3.rental_id GROUP BY title) as filmC;


SELECT MAX(finalsum),title FROM (SELECT SUM(amount)as finalsum,title FROM film as t1 inner 
join inventory as t2 ON t1.film_id=t2.film_id inner join rental as t3 ON 
t2.inventory_id=t3.inventory_id inner join payment as t4 ON t3.rental_id=t4.rental_id GROUP BY title)as filmC;

/*
SELECT title,amount from film as t1 inner join inventory as t2 inner join rental as t3
inner join payment as t4 where  t1.film_id=t2.film_id AND t3.inventory_id=t2.inventory_id 
AND t4.rental_id=t3.rental_id;*/
