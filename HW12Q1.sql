--مبلغ فروش سالبانه  هر کالا ماتریسی
SELECT
	 PP.productnumber					     AS productnumber,
	 PP.[Name]                               AS ProductName,
	DATEPART(YEAR, SOH.OrderDate)		     AS Dates,
	SUM(
	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 1 
		THEN SOD.LineTotal
		Else 0
		End )   AS Winter,
	SUM(

	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 2 
		THEN SOD.LineTotal
		Else 0
		END  )    AS Spring,
	SUM(
	
	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 3 
		THEN SOD.LineTotal 
		Else 0
		END )   AS Summer,
	SUM(

	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 4 
		THEN SOD.LineTotal 
		Else 0
	END	)			AS Fall,
	SUM(SOD.LineTotal)                      AS TotalSales
FROM
	Sales.SalesOrderHeader					 AS SOH
INNER JOIN
	Sales.SalesOrderDetail					 AS SOD
ON
	SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN
	Production.Product						  AS PP
ON
	PP.ProductID = SOD.ProductID
GROUP BY
	DATEPART(YEAR, SOH.OrderDate),
 	PP.productnumber,
	PP.[Name]
	
Order By
	3,1
