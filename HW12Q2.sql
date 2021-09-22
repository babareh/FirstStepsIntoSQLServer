--مبلغ فروش هر فصل به هر مشتری  
--ماتریسی
SELECT
	SOH.CustomerID							 AS Customer,
	P.FirstName +' ' +P.LastName			 AS CustomerNames,
	
	SUM(
	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 1 
		THEN SOD.LineTotal
		Else 0
		End )								 AS Winter,
	SUM(

	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 2 
		THEN SOD.LineTotal
		Else 0
		END  )								  AS Spring,
	SUM(
	
	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 3 
		THEN SOD.LineTotal 
		Else 0
		END      )								AS Summer,
	SUM(

	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 4 
		THEN SOD.LineTotal 
		Else 0
	END	)										AS Fall,
	SUM(SOD.LineTotal )                         AS TotalSales
FROM 
	Sales.SalesOrderHeader						AS SOH
INNER JOIN
	Sales.Customer								AS C
ON
	SOH.CustomerID = C.CustomerID
INNER JOIN
	Sales.SalesOrderDetail						AS SOD
ON 
	SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN
	Person.Person								AS P
ON
	P.BusinessEntityID = C.PersonID
GROUP BY
	--DATEPART (year, SOH.OrderDate),
	SOH.CustomerID,
	P.FirstName,
	P.LastName
ORDER BY
	1