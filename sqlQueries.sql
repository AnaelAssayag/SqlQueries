USE exercices;

-- 1. Write a SQL statement to prepare a list with salesman name, 
-- customer name and their cities for the salesmen and customer who belongs 
-- to the same city. 
-- 
SELECT 
  salesman.name AS Salesman, 
  customer.cust_name AS Customer, 
  customer.city AS City
FROM customer
JOIN salesman ON  customer.city = salesman.city
WHERE customer.city = salesman.city




-- 2. Write a SQL statement to make a list with order no,
--  purchase amount, customer name and their cities for those orders which 
-- order amount between 500 and 2000.

SELECT 
	Orders.ord_no AS orderNumber, 
	Orders.purch_amt AS amount, 
	customer.cust_name AS customerName, 
	customer.city AS city
FROM Orders
JOIN customer ON Orders.customer_id = customer.customer_id
WHERE Orders.purch_amt BETWEEN 500 and 2000;


-- 3. Write a SQL statement to know which salesman are working for which customer.
-- 
SELECT 
	salesman.name AS salesman ,
	customer.cust_name AS customer
FROM salesman
JOIN customer ON salesman.salesman_id = customer.salesman_id
WHERE salesman.salesman_id = customer.salesman_id

-- 
-- 4/Write a SQL statement to find the list of customers who appointed a salesman
--  for their jobs who gets a commission from the company is more than 12%.
-- 

SELECT 
	customer.customer_id, 
	customer.cust_name, 
	customer.city, 
	customer.grade,
	salesman.commission
FROM customer
JOIN salesman ON customer.salesman_id = salesman.salesman_id
WHERE salesman.commission > .12
-- 

-- 5. Write a SQL statement to find the list of customers who appointed a salesman 
-- for their jobs who does not live in the same city 
-- where their customer lives, and gets a commission is above 12%
-- 
SELECT 
	customer.customer_id, 
	customer.cust_name, 
	customer.city, 
	customer.grade,
	salesman.commission
FROM customer
JOIN salesman ON customer.salesman_id = salesman.salesman_id
WHERE salesman.commission > .12 AND customer.city != salesman.city;

-- 
-- 6. Write a SQL statement to find the details of a order i.e. order number, 
-- order date, amount of order, which customer gives the order and which salesman works 
-- for that customer and how much commission he gets for an order

SELECT 
	Orders.ord_no AS number, 
	Orders.purch_amt AS amount,
	Orders.ord_date AS date,
	customer.cust_name AS customerDate,
	salesman.name AS salesmanDate,
	salesman.commission 
FROM Orders
JOIN customer ON Orders.salesman_id = customer.salesman_id 
JOIN salesman ON Orders.salesman_id = salesman.salesman_id
WHERE customer.salesman_id = salesman.salesman_id;

-- 7. Write a SQL statement to make a join on the tables salesman, 
-- customer and orders in such a form that the same column of each table 
-- will appear once and only the relational rows will come.
-- -- 
	SELECT *
FROM Orders
NATURAL JOIN customer 
NATURAL JOIN salesman ;

-- 8.. Write a SQL statement to make a list in ascending order for the customer 
-- who works either through a salesman or by own. 