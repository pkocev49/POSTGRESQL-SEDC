-- Homework requirement 1/6
-- Find all Employees with FirstName = Antonio (change Marko)

SELECT * FROM employee
UPDATE employee
SET firstname = 'Marko'
WHERE firstname = 'Borce'

-- Find all Employees with DateOfBirth greater than ‘01.01.1979’
SELECT * FROM employee
WHERE dateofbirth > '01.01.1979'

-- Find all Male Employees 
SELECT * FROM employee
WHERE gender = 'M'

-- Find all Employees with LastName starting With ‘T’
SELECT * FROM employee
WHERE lastname LIKE 'T%'

-- Find all Employees hired in January/1988
SELECT * FROM employee
WHERE hiredate BETWEEN '2015-01-01' AND '2015-01-31'

-- Find all Employees with LastName starting With ‘J’ hired in January/1988
SELECT * FROM employee
WHERE lastname LIKE 'T%'
AND  hiredate BETWEEN '2015-01-01' AND '2015-01-31'

-- Homework requirement 2/6
-- Find all Employees with FirstName = Antonio ordered by Last Name
SELECT * FROM employee
WHERE firstname = 'Antonio'
ORDER BY lastname

-- List all Employees ordered by FirstName
SELECT * FROM employee
ORDER BY firstname

-- Find all Male employees ordered by HireDate, starting from the last hired

SELECT * FROM employee
WHERE gender = 'M'
ORDER BY hiredate DESC

-- Homework requirement 3/6

-- List all Business Entity region and Customer region names in single result set WITH duplicates

SELECT region FROM businessentity
UNION ALL
SELECT regionname FROM customer


-- List all Business Entity region and Customer region names in single result set WITHOUT duplicates

SELECT region FROM businessentity
UNION 
SELECT regionname FROM customer

-- List all common region names between Business Entities and Customers

SELECT region FROM businessentity
INTERSECT
SELECT regionname FROM customer

-- Homework requirement 4/6
-- Provide create table script for the Order table where it won’t allow an orderDate before 01.01.2010
CREATE TABLE "Order" (
    Id serial PRIMARY KEY NOT NULL,
    OrderDate date NULL CHECK(OrderDate > '01.01.2010' ),
    Status smallint NULL,
    BusinessEntityId integer NULL,
    CustomerId integer NULL,
    EmployeeId integer NULL,
    TotalPrice float(2) NULL,
    Comment varchar(500) NULL
);



-- Provide create table script for the Product table where the price will always be AT LEAST 20% higher than the cost
CREATE TABLE IF NOT EXISTS Product (
    Id serial PRIMARY KEY NOT NULL,
    Code varchar(50) NULL,
    Name varchar(100)  NULL,
    Description varchar(5000)  NULL,
    Weight float(2) NULL,
    Price float(2) CHECK(price >= cost * 1.2) NULL,
    Cost float(2) NULL
);




-- Provide create table script for the Product table where all description values will be UNIQUE
CREATE TABLE IF NOT EXISTS Product (
    Id serial PRIMARY KEY NOT NULL,
    Code varchar(50) NULL,
    Name varchar(100)  NULL,
    Description varchar(5000) UNIQUE NULL,
    Weight float(2) NULL,
    Price float(2) CHECK(price >= cost * 1.2) NULL,
    Cost float(2) NULL
);

