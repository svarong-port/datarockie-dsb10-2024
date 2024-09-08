/*
Instruction
1. reate at least 3 tables about restaurant
    1. Transactions
    2. Waiters
    3. Menu
    4. Ingredients
    5. etc.
2. write at least 3 queries
    1. WITH
    2. Subquery
    3. Aggregate functions & GROUP BY
    4. etc.
*/


-- Modes & header
.mode table
.header on

    
-- Creat 3 tables

    -- Table #1
CREATE TABLE diners (
    dinerid int unique,
    firstname text,
    lastname text,
    gender text,
    age int    
);
    -- Table #2
CREATE TABLE waiters (
    waiterid int unique,
    firstname text,
    lastname text,
    level text
);

    -- Table #3
CREATE TABLE menus (
    menuid int unique,
    menutitle text,
    type text,
    price_thb real
);

    -- Table #4
CREATE TABLE orders (
    dinerid int,
    waiterid int,
    menuid int,
    timestamp datetime
);


-- Insert data
    -- Table #1
INSERT INTO diners values
    (1, 'John', 'Jackson', 'Male', 25),
    (2, 'Jane', 'Johnson', 'Female', 30),
    (3, 'Jim', 'Jensen', 'Male', 35),
    (4, 'Jane', 'Jimenez', 'Female', 40),
    (5, 'Jim', 'Joubert', 'Male', 45);

    -- Table #2
INSERT INTO waiters values
    (1, 'Max', 'Miller', 'Manager'),
    (2, 'Mary', 'Martinez', 'Junior'),
    (3, 'Meg', 'Mitchell', 'Senior');

    -- Table #3
INSERT INTO menus values
    (1, 'Pizza', 'Main Course', 100),
    (2, 'Burger', 'Main Course', 80),
    (3, 'Salad', 'Appetizer', 50),
    (4, 'Fries', 'Appetizer', 30),
    (5, 'Soda', 'Drink', 20),
    (6, 'Ice Cream', 'Dessert', 40),
    (7, 'Cake', 'Dessert', 60);

    -- Table #4
INSERT INTO orders values
    (1, 1, 1, '2023-01-01 10:39:54'),
    (1, 1, 2, '2023-01-01 10:40:00'),
    (1, 1, 3, '2023-01-01 10:40:11'),
    (2, 2, 4, '2023-01-01 13:01:12'),
    (2, 2, 5, '2023-01-01 13:01:23'),
    (3, 3, 6, '2023-01-01 15:19:31'),
    (4, 2, 7, '2023-01-01 16:09:10'),
    (5, 1, 1, '2023-01-01 17:47:15');


-- Query #1 - WITH (find diners who dine in the afternoon)
WITH afternoon_diners AS (
    SELECT * 
    FROM diners
    JOIN orders
    ON diners.dinerid = orders.dinerid
    WHERE timestamp >= '2023-01-01 12:00:00'
)

SELECT
    firstname,
    lastname
FROM afternoon_diners;


-- Query #2 - Subquery (find diners who are older than average)
SELECT
    firstname || ' ' || lastname AS fullname
FROM diners
WHERE age >= (SELECT AVG(age) FROM diners);


-- Query #3 - Aggregate (find out how many times each waiter gets an order)
SELECT
    orders.waiterid,
    waiters.firstname || ' ' || waiters.lastname AS waiter_name,
    COUNT(*) AS number_of_serves
FROM orders
JOIN waiters
ON orders.waiterid = waiters.waiterid
GROUP BY waiter_name;
