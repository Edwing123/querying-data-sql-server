USE AdventureWorksDW;

-- Four types of joins: CROSS JOIN, INNER JOIN, OUTER JOIN, SELF JOIN.

-- The join process is composed of three phases:
-- 1. Create a cartisian product between the tables in the join.
-- 2. Filter rows based on a predicate.
-- Add outer rows.

-- Join types are determined on which phase the joining process goes up to.

-- CROSS JOIN: they only get up to the phase #1.
-- They create the combination between two tables.
-- Basically, Each customer record will be joined to every product record.
-- We get C * P records, where C is the number if customers and P the number of orders.

--SELECT COUNT(CustomerKey) FROM Customer;
--SELECT COUNT(ProductKey) FROM Product;

--SELECT CustomerKey, ProductKey
--FROM Customer CROSS JOIN Product;

-- INNER JOIN: filtering rows from the cartesian product of the two tables.
SELECT c.FirstName, o.OrderDateKey, o.SalesAmount
FROM Customer AS c
	INNER JOIN Orders AS o
	-- Only rows that satisfied this condition are kept.
	ON c.CustomerKey = o.CustomerKey;

-- INNER JOIN is the default join type, so we can leave out the INNER keyword:

SELECT c.CustomerKey, c.FirstName, c.LastName, COUNT(o.OrderKey) AS orders_placed
FROM Customer AS c JOIN Orders AS o ON c.CustomerKey = o.CustomerKey
GROUP BY c.FirstName, c.LastName, c.CustomerKey
ORDER BY orders_placed DESC;

-- OUTER JOINs: they go through all the phases of the joining process.
-- They are like INNER JOIN, but the non-matching rows from the table placed on
-- the right or the left are also included, in the case of LEFT OUTER JOIN AND RIGHT OUTER JOIN.

-- LEFT OUTER JOIN: keep the rows on the left table even if they don't have common matching
-- rows on the right table.
SELECT c.CustomerKey, c.FirstName, c.LastName, COUNT(o.OrderKey) AS orders
FROM Customer AS c LEFT OUTER JOIN Orders AS o ON c.CustomerKey = o.CustomerKey
WHERE o.OrderKey IS NULL
GROUP BY c.FirstName, c.LastName, c.CustomerKey;

-- RIGHT OUTER JOIN: keep the rows on the right table even if they don't have common matching
-- rows on the left table.

-- FULL JOIN: return all rows.
--SELECT c.FirstName, c.LastName, o.OrderKey
--FROM Customer AS c FULL OUTER JOIN Orders AS o ON c.CustomerKey = o.CustomerKey;

