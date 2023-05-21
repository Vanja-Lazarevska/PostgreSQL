-- Homework requirement 1/6 --
-- Find all employees with firstname Antonio (or Marko)
SELECT * FROM employee WHERE firstname = 'Marko';

-- Find all employees with dateofbirth greater than '01.01.1979'
SELECT * FROM employee WHERE dateofbirth > '01.01.1979';

-- Find all male employees 
SELECT firstname, lastname, gender FROM employee WHERE gender = 'M';

-- Find all employees with lastname starting with 'V'
SELECT * FROM employee WHERE firstname LIKE 'V%';

-- Find all employees hired in Octomber/2014
SELECT firstname, lastname, hiredate, gender FROM employee WHERE hiredate BETWEEN '2014.10.01' AND '2014.10.30';

-- Find all employees with lasntame starting with 'S' hired in February/2014 
SELECT * FROM employee WHERE lastname LIKE 'S%' AND hiredate BETWEEN '2014.02.01' AND  '2014.02.28';



-- Homework requirement 2/6 --
-- Find all employees with firstname Aleksandar ordered by lastname
SELECT * FROM employee WHERE firstname = 'Aleksandar' ORDER BY lastname;

-- List all employees ordered by firstname
SELECT * FROM employee ORDER BY firstname;

-- Find all male employees ordered by hiredate starting from the last hired
SELECT * FROM employee WHERE gender = 'M' ORDER BY hiredate DESC;



-- Homework requirement 3/6 --
-- List all business entity region and customer region names in single result set with duplicates
SELECT region FROM businessentity UNION ALL SELECT regionname FROM customer;

-- List all business entity region and customer region names in single result without dulicates
SELECT region FROM businessentity UNION SELECT regionname FROM customer;

-- List all common region names between business entity and customer
SELECT region FROM businessentity INTERSECT SELECT regionname FROM customer;



-- Homework requirement 4/6 --
-- Provide create table script for the Order table where it won't allow an orderDate before 01.01.2010
ALTER TABLE "Order" ADD CONSTRAINT checkOrderDate CHECK(orderdate > '2010.01.01')


-- Provide create table script for the product table where the price will always be at least 20% higher than the cost
ALTER TABLE product ADD CONSTRAINT checkPrice CHECK(price > (price*20/100) + cost)


-- Provide create table script for the product table where all description values will be unique
ALTER TABLE product ADD CONSTRAINT unique UNIQUE(description)