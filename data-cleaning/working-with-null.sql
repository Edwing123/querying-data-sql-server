USE [AdventureWorksDW];

SELECT c.FirstName, c.LastName, st.CountryName
FROM [Customer] AS c
	CROSS JOIN SalesTerritory AS st;
