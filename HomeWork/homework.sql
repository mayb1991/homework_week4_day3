-- I am sturggling with this one I guess I'm better at creating a database then I am searching
-- for things in one. I have worked last night and moring and afternoon on these and I felt kinda confident in
-- the begining but towrads the end I lost that confidents. The good news is I understand what info is needed I
-- just can't firure out the code for it. 



-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name, city
FROM customer
INNER JOIN address
ON customer.customer_id = address.address_id
INNER JOIN city
ON city.city_id = address.city_id
WHERE city = 'Texas'
ORDER BY city;

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount)>175
    ORDER BY SUM(amount)
);

-- 4. List all customers that live in Nepal (use the city
-- table) 
-- I dont think this City is in the table of citys at all I tried many different ways
-- and I either get Nepal does not existe or the city_id it to ambigiest.
SELECT city_id, city
FROM address
INNER JOIN city
ON address.address_id = city.city_id
WHERE city = "Nepal";

SELECT city
FROM city
WHERE city = "Nepal";


-- 5. Which staff member had the most
-- transactions?
SELECT first_name, last_name
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
;
-- I found all the TRANSACTION but i cant seem to figure out how to seprate them to only show
-- the staff member who has the most TRANSACTIONS. I belive the answer is Jon Stephens but I cant get it 
-- printed to the console.


-- 6. How many movies of each rating are
-- there?

SELECT rating, COUNT(title)
FROM film
GROUP BY rating, title;

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE customer_id = 1
    GROUP BY customer_id
    HAVING SUM(amount)>6.99
    ORDER BY SUM(amount)
);
SELECT amount, customer_id
FROM payment
WHERE amount > 6.99 AND customer_id < 1;

-- 8. How many free rentals did our store give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0;


