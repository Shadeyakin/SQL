--PROJECT 3

--GET ME A REPORT OF THE NUMBER OF EMPLOYEES IN THE COMPANY.


SELECT COUNT(EMPID) AS NUMBEREMPLOYEES
FROM HR.Employees

--GET ME A REPORT OF ALL EMPLOYEES REGION AND THE NUMBER OF EMPLOYEES WHO LEAVES IN THAT REGION

SELECT REGION,COUNT(EMPID)
FROM HR.Employees
GROUP BY REGION

--GET ME A REPORT OF ALL ORDER ID"S AND THE TOTAL AMOUNT OF FREIGHTS
-- ASSOCIATED WITH THAT ORDER

 SELECT ORDERID, SUM(FREIGHT) AS TOTALFREIGHT
 FROM SALES.ORDERS
 GROUP BY orderid

 --GET ME A REPORT OF ORDER ID,ORDER DATE AND THE COMPLETE LOCATION 
 --OF THE ORDER WHICH IS A COMBINATION OF SHIPCITY AND SHIPREGION

SELECT ORDERID,ORDERDATE,CONCAT(SHIPCITY, ',' ,SHIPREGION)AS SHIPLOCATION
FROM SALES.ORDERS

--GET THE EMPLOYEE NAME WHICH IS THE COMBINATION OF THE FIRST AND LAST
--NAME,THE CITY AND THE FIRST THREE CHARACTER OF THE EMPLOYEE'S CITY AS
--ABBREVIATED CITY

SELECT CONCAT(FIRSTNAME,' ',LASTNAME) AS NAMES, CITY, SUBSTRING(CITY,1,3) AS ABV 
FROM [HR].[Employees]

SELECT CONCAT(FIRSTNAME,' ',LASTNAME) AS NAMES, CITY, LEFT(CITY,3) AS ABV 
FROM [HR].[Employees]


--GET THE EMPLOYEE LASTNAME,FIRSTNAME AND THE LENGHT OF CHARACTER OF THE 
--EMPLOYEE'S LASTNAME AS NAME LENGHT.

SELECT LASTNAME,FIRSTNAME,LEN(LASTNAME)AS NAMELENGHT
FROM[HR].[Employees]

--GET THE SHIPPER_ID,CONTACT NAME AND THE REGION.PLEASE REPLACE ALL THE NULL
--REGION WITH 'CA'

--SELECT  O.[shipperid], C.CONTACTNAME, COALESCE(C.REGION, 'CA' )AS REGION
--FROM SALES.CUSTOMERS AS C
--JOIN SALES.ORDERS AS O
--ON C.CUSTID = O.CUSTID  


SELECT  SS.[shipperid], S.CONTACTNAME, ISNULL(S.REGION, 'CA' )AS REGION    --OR COALESCE
FROM  [Production].[Suppliers] AS S
JOIN [Production].[Products] AS P
ON S.supplierid = P.supplierid
JOIN [Sales].[OrderDetails] AS SD
ON P.PRODUCTID = SD.PRODUCTID
JOIN SALES.ORDERS AS SO
ON SD.orderid = SO.orderid
JOIN  [Sales].[Shippers] AS SS
ON SO.[shipperid] = SS.[shipperid]

--GET THE EMPLOYEE LASTNAME,FIRSTNAME,AND NUMBER OF YEARS  HE/SHE
--HAS BEEN EMPLOYED BY THE COMPANY

SELECT LASTNAME,FIRSTNAME, FLOOR((DATEDIFF(DD,[hiredate],GETDATE()))/365.25) AS YEARS,
FROM [HR].[Employees]





--GET THE EMPLOYEE LASTNAME, FIRSTNAME,TITLE AND AGE

SELECT [lastname],[firstname],[title],FLOOR(DATEDIFF(DD,[birthdate],getdate())/365.25) AS age
from [HR].[Employees]

--SELECT FLOOR(DATEDIFF(DD,'08/02/1995',getdate())/365.25) AS age

--Get the employee lastname,firstname,title and age for all employees with
--greater than the average age

SELECT [Lastname],[Firstname],[Title],FLOOR(DATEDIFF(DD,[birthdate],getdate())/365.25) AS Age
from [HR].[Employees]
WHERE FLOOR(DATEDIFF(DD,[birthdate],getdate())/365.25)>
  (
              SELECT AVG(FLOOR(DATEDIFF(DD,[birthdate],getdate()))/365.25)
			   from [HR].[Employees])


--GROUP BY  [Lastname],[Firstname],[Title]


--USE THE NUMBS TABLE TO GENERATE A RESULT WITH A ROW FOR EACH WEEKDAY (1 THROUGH 7) AND 
--SHIFT NUMBER (1 THROUGH 3), ASSUMING THERE ARE THREE SHIFTS A DAY .THE RESULTS CAN LATER
--BE USED AS THE BASIS FOR BUILDING INFORMATION ABOUT ACTIVITIES IN THE DIFFERENT SHIFTS IN 
--THE  DIFFERENT DAYS. WITH 7 DAYS A WEEK AND  3 SHIFTS EVERYDAY, THE RESULT SHOULD BE 21 ROWS    

SELECT W.N AS WEEKDAY,S.N AS SHIFT 
FROM [dbo].[Nums]AS W
CROSS JOIN [Nums] AS S
WHERE W.N <=7 AND S.N <= 3
CASE  W.N AS WEEKDAY
 WHEN W.N = 1 THEN 'MONDAY' ,
   WHEN W.N = 2 THEN 'TUESDAY',
   ELSE 'WEDNESDAY',
END;
FROM [dbo].[Nums]AS W
 



--12.Write a query that returns suppliers from Japan and the products they
--supply.
select p.[productid], p.[supplierid],s.[country]
from[Production].[Products] as p
join[Production].[Suppliers] as s
on s.[supplierid] = p.[supplierid]
where country = 'japan'

--13.Write a query to return the employee id, the employee name which is a
--combination of the first and last names and match with their manager’s
--name which is a combination of their first and last names.


--14.Write a query that returns suppliers from Japan and the products they
--supply, including suppliers from Japan that don’t have related products.



--15.Write a query that returns locations that are employee locations or
--customer locations or both. (i.e: location here is selecting country,
--region, city)



--16.Write a query that returns locations that are employee locations or
--customer locations. (i.e: location here is selecting country, region, city)



--17.Generate a report showing all customers without orders. Please
--remember to include null in your filter.



--18. Write a query that returns all customers, but matches orders only if
--they were placed in FEBRUARY 2008.




-