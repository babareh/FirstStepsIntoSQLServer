--فروش هر سال از صدهزار دلار بیشتر باشد ویو
CREATE VIEW Sales.YearsSales 
	AS
SELECT
	DATEPART(YEAR, SOH.OrderDate)				 AS Dates,
	CASE
	 WHEN
	  SUM(
	  CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 1 
		THEN SOD.LineTotal
		Else 0
		End ) > 100000
	THEN 	
		SUM(
			CASE
			WHEN DATEPART (QUARTER, SOH.OrderDate) = 1 
			THEN SOD.LineTotal
			Else 0
			End )
			ELSE  NULL
		END										AS Winter,

	CASE
	WHEN
	  SUM(
	 CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 2
		THEN SOD.LineTotal
		Else 0
		End ) > 100000
	THEN 	
		SUM(
			CASE
			WHEN DATEPART (QUARTER, SOH.OrderDate) = 2 
			THEN SOD.LineTotal
			Else 0
			End )
			ELSE  NULL
		END										AS Spring,

	CASE
	 WHEN
	  SUM(
	  CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 3 
		THEN SOD.LineTotal
		Else 0
		End ) > 100000
	THEN 	
		SUM(
			CASE
			WHEN DATEPART (QUARTER, SOH.OrderDate) = 3
			THEN SOD.LineTotal
			Else 0
			End )
			ELSE  NULL
		END										AS Summer,
		CASE
	WHEN
	  SUM(
	 CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 4
		THEN SOD.LineTotal
		Else 0
		End ) > 100000
	THEN 	
		SUM(
			CASE
			WHEN DATEPART (QUARTER, SOH.OrderDate) =4 
			THEN SOD.LineTotal
			Else 0
			End )
			ELSE  NULL
		END										AS Fall,

	SUM(SOD.LineTotal )                         AS TotalSales
FROM
	Sales.SalesOrderHeader						AS SOH
INNER JOIN
	Sales.SalesOrderDetail					    AS SOD
ON
	SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY
	DATEPART (YEAR, SOH.OrderDate)
ORDER BY
	1