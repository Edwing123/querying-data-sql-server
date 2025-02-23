USE AdventureWorksDW;

-- Get the 50% of the records, no order specified.

SELECT TOP(50) PERCENT
	(FirstName + ' ' + LastName) AS FullName, Occupation
FROM Customer WITH(NOLOCK);

-- Get the set of occupations.

SELECT DISTINCT Occupation
FROM Customer;

-- Filtering data.

-- Customers whose first name is not Sam.
SELECT *
FROM Customer
WHERE FirstName <> 'Sam';

-- Customers whose first name is Sam.
SELECT *
FROM Customer
WHERE FirstName = 'Sam';

-- Customers whose first name starts with Sam.
SELECT *
FROM Customer
WHERE FirstName LIKE 'Sam%';

-- More complex filtering.

SELECT *
FROM Customer
WHERE FirstName LIKE 'Sam%' AND YearlyIncome BETWEEN 50000 AND 100000;

-- OR-ing

SELECT FirstName, LastName, YearlyIncome, Occupation
FROM Customer
WHERE FirstName LIKE 'Sam%'
	AND (YearlyIncome < 50000 OR YearlyIncome > 100000);