USE [AdventureWorksDW];

-- Converting between types.

DECLARE @BirthDate CHAR(12) = '2001-03-13ddd';

SELECT DATEADD(
	DAY,
	1,
	ISNULL(TRY_CAST(@BirthDate AS DATE), '')
);

SELECT PARSE('9.10005' AS DECIMAL(10, 4));