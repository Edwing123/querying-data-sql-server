USE [AdventureWorksDW];

SELECT
	UPPER(LTRIM(st.CountryCode)) AS CountryCode,
	TRIM(BOTH '*' FROM st.CountryName),
	COUNT(c.CustomerKey) AS customers_count
FROM [Customer] AS c
	INNER JOIN [SalesTerritory] AS st
		ON c.GeographyKey = st.GeographyKey
GROUP BY LTRIM(st.CountryCode), st.CountryName
ORDER BY CountryCode DESC;

-- Canada is mispelled.

SELECT
	UPPER(LTRIM(st.CountryCode)) AS CountryCode,
	REPLACE(TRIM('*' FROM st.CountryName), 'Cansda', 'Canada'),
	COUNT(c.CustomerKey) AS customers_count
FROM [Customer] AS c
	INNER JOIN [SalesTerritory] AS st
		ON c.GeographyKey = st.GeographyKey
GROUP BY LTRIM(st.CountryCode), st.CountryName
ORDER BY CountryCode DESC;

-- More text manipulation.

SELECT
	CONCAT_WS(' ', FirstName, LastName) AS FullName,
	LEFT(FirstName, 1) + LEFT(LastName, 1) AS Intials
FROM [Customer]
WHERE FirstName LIKE '%Sam%';