Use Adventureworks2019
Go

--1. How many products can you find in the Production.Product table?
SELECT Count(ProductID)
FROM Production.Product
-- So 504 products


--2.      Write a query that retrieves the number of products in the Production.Product table 
--that are included in a subcategory. The rows that have NULL in column ProductSubcategoryID 
--are considered to not be a part of any subcategory.
SELECT  COUNT (ProductID)
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
-- so 295 products


--3.      How many Products reside in each SubCategory? Write a query to display the results with the following titles.

--ProductSubcategoryID CountedProducts

-------------------- ---------------

SELECT ProductSubcategoryID, Count(ProductID) as CountedProducts
FROM Production.Product
WHERE ProductSubcategoryID is not null
GROUP BY ProductSubcategoryID

--4.      How many products that do not have a product subcategory.
SELECT Count (ProductID)
FROM Production.Product
WHERE ProductSubcategoryID IS NULL

--5.      Write a query to list the sum of products quantity in the Production.ProductInventory table.
SELECT SUM(Quantity) AS TotalQuantity
FROM Production.ProductInventory;



--6.    Write a query to list the sum of products in the Production.ProductInventory table 
--and LocationID set to 40 
--and limit the result to include just summarized quantities less than 100.
--              ProductID    TheSum

              -----------        ----------
SELECT ProductID, Sum (Quantity) As [TotalQuantity]
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING Sum(Quantity) < 100

--7.    Write a query to list the sum of products with the shelf information in the Production.ProductInventory table 
--and LocationID set to 40 and limit the result to include just summarized quantities less than 100

--    Shelf      ProductID    TheSum

    ----------   -----------        -----------
SELECT Shelf, ProductID, Sum (Quantity) as TheSum
From Production.ProductInventory
WHERE LocationID = 40 
GROUP BY Shelf, ProductID
Having Sum (Quantity) < 100

--8. Write the query to list the average quantity for products 
--where column LocationID has the value of 10 from the table Production.ProductInventory table.
SELECT AVG (Quantity) as Quantity
FROM Production.ProductInventory
WHERE LocationID = 10

--9.    Write query  to see the average quantity  of  products by shelf  from the table Production.ProductInventory

 --   ProductID   Shelf      TheAvg

    ----------- ---------- -----------

SELECT ProductID, Shelf, AVG (Quantity) as TheAvg
FROM Production.ProductInventory
GROUP BY ProductID, Shelf

--10.  Write query  to see the average quantity  of  products by shelf 
--excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory

  --  ProductID   Shelf      TheAvg

    ----------- ---------- -----------
	SELECT ProductID, Shelf, Avg(Quantity) TheAvg
	FROM Production.ProductInventory
	WHERE Shelf != 'N/A'
	GROUP BY ProductID, Shelf

--11.  List the members (rows) and average list price in the Production.Product table. 
--This should be grouped independently over the Color and the Class column. Exclude the rows where Color or Class are null.

    --Color                        Class              TheCount          AvgPrice

    -------------- - -----    -----------            ---------------------
	SELECT Color, Class, Count (*) As TheCount, Avg (ListPrice) As AvgPrice 
	FROM Production.Product 
	WHERE Color  IS NOT NULL AND Class IS NOT NULL
	GROUP BY Color, Class

--Joins:

--12.   Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. 
--Join them and produce a result set similar to the following.

   -- Country                        Province

    ---------                          ----------------------
SELECT PCP.Name AS Country,PSP.Name AS Province
FROM Person.CountryRegion AS PCP JOIN Person.StateProvince AS PSP ON PCP.CountryRegionCode = PSP.CountryRegionCode;

	

--13.  Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and 
--list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following.
-- Country                        Province

    ---------                          ----------------------

SELECT pcp.Name as Country, psp.Name as Province
FROM Person.CountryRegion as pcp JOIN Person.StateProvince AS PSP ON PCP.CountryRegionCode = PSP.CountryRegionCode
WHERE pcp.Name in ('Germany','Canada');


 --Using Northwnd Database: (Use aliases for all the Joins)
 Use NorthWind
 Go

--14.  List all Products that has been sold at least once in last 27 years.
SELECT Distinct p.ProductID as ProductID, o.OrderID as OrderID, o.OrderDate as OrderDate
From Products p Join [Order Details] od On p.ProductID = od.ProductID 
Join Orders o ON o.OrderID = od.OrderID
WHERE o.OrderDate >= DATEADD(Year, -27, GetDate())


--15.  List top 5 locations (Zip Code) where the products sold most.
SELECT TOP 5  o.ShipPostalCode AS ZipCode,  Sum (od.Quantity) as SaleCount
From Products p Join [Order Details] od On p.ProductID = od.ProductID 
Join Orders o ON o.OrderID = od.OrderID
WHERE o.ShipPostalCode IS NOT NULL
Group By o.ShipPostalCode
Order By SaleCount desc;


--16.  List top 5 locations (Zip Code) where the products sold most in last 27 years.
SELECT TOP 5 o.ShipPostalCode As [Zip Code], Sum (od.Quantity) as SaleCount
FROM Products p JOIN [Order Details] OD on p.ProductID= od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -27, GETDATE()) and o.ShipPostalCode IS NOT NULL
GROUP BY O.ShipPostalCode
Order By SaleCount desc;


--17.   List all city names and number of customers in that city.     

--18.  List city names which have more than 2 customers, and number of customers in that city

--19.  List the names of customers who placed orders after 1/1/98 with order date.

--20.  List the names of all customers with most recent order dates

--21.  Display the names of all customers  along with the  count of products they bought

--22.  Display the customer ids who bought more than 100 Products with count of products.

--23.  List all of the possible ways that suppliers can ship their products. Display the results as below

--    Supplier Company Name                Shipping Company Name

    ---------------------------------            ----------------------------------

--24.  Display the products order each day. Show Order date and Product Name.

--25.  Displays pairs of employees who have the same job title.

--26.  Display all the Managers who have more than 2 employees reporting to them.

--27.  Display the customers and suppliers by city. The results should have the following columns

--City

--Name

--Contact Name,

--Type (Customer or Supplier)