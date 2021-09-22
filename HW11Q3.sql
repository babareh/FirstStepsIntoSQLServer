--فروش هر فصل هر سال که از صدهزار دلار بیشتر باشد
--فروش خیلی بیشتر از یک میلیون هست و شرط در جواب تاثیذ ندارد 
SELECT
	DATEPART (YEAR, SOH.OrderDate)				AS YEARs,
	DATEPART (QUARTER, SOH.OrderDate)			AS SeasonID,
	CASE
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 1 THEN 'Winter'
		WHEN DATEPART (QUARTER, SOH.OrderDate) = 2 THEN 'Spring'
		WHEN DATEPARt (QUARTER, SOH.OrderDate) = 3 THEN 'Summer'
		WHEN DATEPARt (QUARTER, SOH.OrderDate) = 4 THEN 'Fall'

	END											AS SeasonName,
	SUM (SOD.LineTotal)							AS Amount
FROM
	Sales.SalesOrderHeader						AS SOH
INNER JOIN
	Sales.SalesOrderDetail					    AS SOD
ON
	SOH.SalesOrderID = SOD.SalesOrderID
GROUP BY
	DATEPART (QUARTER, SOH.OrderDate),
	DATEPART (YEAR, SOH.OrderDate)
HAVING
	SUM (SOD.LineTotal) > 100000
ORDER BY
	1