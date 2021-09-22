--مبلغ فروش سالیانه)هر فصل) به هر مشتری
SELECT
	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 1 THEN 'Winter'
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 2 THEN 'Spring'
		WHEN DATEPARt (QUARTER, SOH.OrderDate) = 3 THEN 'Summer'
		WHEN DATEPARt (QUARTER, SOH.OrderDate) = 4 THEN 'Fall'

	END											AS SeasonName,
	SOH.CustomerID                 AS Customer,
	SUM(SOD.LineTotal)             AS SalesAmount,
	P.FirstName +' ' +P.LastName   AS Names
FROM 
	Sales.SalesOrderHeader		   AS SOH
INNER JOIN
	Sales.Customer                 AS C
ON
	SOH.CustomerID = C.CustomerID
INNER JOIN
	Sales.SalesOrderDetail         AS SOD
ON 
	SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN
	Person.Person                   AS P
ON
	P.BusinessEntityID = C.PersonID
GROUP BY
	DATEPART (QUARTER, SOH.OrderDate),
	SOH.CustomerID,
	P.FirstName,
	P.LastName
Order By
	1