
SELECT DISTINCT
	UnitPrice * OrderQty   AS  Total 
FROM 
	SALES.SalesOrderDetail AS SOD
--WHERE
--	SOD.UnitPrice BETWEEN 100 AND 150
ORDER BY 
	Total

--64 rows

SELECT
	UnitPrice * OrderQty   AS  Total 
FROM 
	SALES.SalesOrderDetail AS SOD
WHERE
	SOD.UnitPrice BETWEEN 100 AND 150
ORDER BY 
	Total
--1930 rows