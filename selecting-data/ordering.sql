USE AdventureWorksDW;

-- Ordering data.

SELECT TOP(6)
	Product,
	ListPrice,
	Category
FROM Product
ORDER BY ListPrice DESC;

-- WITH TIES gets the next records only
-- if the records ListPrice is equal
-- to the last row.

SELECT TOP(6) WITH TIES
	Product,
	ListPrice,
	Category
FROM Product
ORDER BY ListPrice DESC;

-- It's like getting the rows that have
-- a tie with the last row.