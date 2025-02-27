USE  [AdventureWorksDW];

SELECT TRIM(';' FROM ';;Hello World;;');

SELECT PATINDEX('%123%', 'Hello123World');

SELECT SUBSTRING('Hello123World', 6, 3);

SELECT PATINDEX('gr[ae]y', LOWER('gray'));