#LAB 2 - SQL
USE sakila;

#1.  Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM actor
WHERE first_name = 'Scarlett';

#2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(rental_id) AS "Avail. Films" , COUNT(return_date) AS "Rented Films"
FROM rental;

#Total inventory or available NOW?

SELECT count(rental_date), count(return_date) from rental;
SELECT count((rental_date-return_date)) from rental;


#3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT min(length) as min_duration, max(length) as max_duration
FROM film;

#4. What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME(AVG(length*60)) FROM film;

#5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) AS 'diff. last names'
FROM actor;

#6. Since how many DAYS has the company been operating (check DATEDIFF() function)? check first rental-today DATEDIFF
SELECT DATEDIFF(max(return_date),min(rental_date)) AS 'Operating days' from rental;

#7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, MONTH(rental_date) as month, DAY(rental_date) as day
FROM rental
LIMIT 20;

#8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, IF(weekday(rental_date)<6,"workday","weekend") as day_type, WEEKDAY(rental_date) as checkday
FROM rental;

#9. Get release years.
SELECT release_year
FROM film;

#10. Get all films with ARMAGEDDON in the title.
SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%';

#11. Get all films which title ends with APOLLO.
SELECT *
FROM film
WHERE title LIKE '%APOLLO';

#12. Get 10 the longest films.
SELECT *
FROM film
ORDER BY length DESC
LIMIT 10;

#13. How many films include Behind the Scenes content?

SELECT COUNT(*) AS 'Behind the Scenes included'
FROM film
WHERE special_features LIKE "%Behind_the_Scenes%"; 

