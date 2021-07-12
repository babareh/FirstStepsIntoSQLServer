USE AdventureWorks2019
Go


SELECT DISTINCT 
  *
FROM 
     Production.Product

WHERE 
     ([Name] <> 'Blade' AND Color = 'Silver' )

     OR ProductID = 377

--Result= 0 rows

SELECT 
  *
FROM
      Sales.Currency

WHERE
      [Name] = 'Yen'

-- currency.code is JPY


SELECT 
*

FROM
Sales.CurrencyRate As Rate

WHERE
FromCurrencyCode = 'USD' 

And 

CurrencyRateDate ='2013-04-05'

--11 ROWS
