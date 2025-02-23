-- Grouping and using aggregate functions.

SELECT
	Category,
	COUNT(*) AS products_count,
	FORMAT(MAX(ListPrice), '.00') AS max_price,
	FORMAT(MIN(ListPrice), '.00') AS min_price,
	FORMAT(AVG(ListPrice), '.00') AS avg_price
FROM Product WITH(NOLOCK)
GROUP BY Category
--  ORDER BY MAX(ListPrice) DESC;

-- Filterting the groups of data.

-- Get the categories whose min price is greater than $10.

SELECT
	Category,
	COUNT(1) AS products_count,
	MIN(ListPrice) AS min_price,
	MAX(ListPrice) AS max_price
FROM Product
-- Group products by category.
GROUP BY Category
-- Keep product categories whose min price is greater than $10.
HAVING MIN(ListPrice) > 10

-- Let's see the Components category.

SELECT Product, Category, ListPrice
FROM Product
WHERE Category IN ('Components')
ORDER BY ListPrice DESC;

