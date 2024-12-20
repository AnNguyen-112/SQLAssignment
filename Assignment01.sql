--Write queries for following scenarios - 
--AdventureWorks Database
Use AdventureWorks2019
Go

--1. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter.
SELECT ProductID, Name, Color, ListPrice
From Production.Product

--2. Write a query that retrieves the columns ProductID, Name, 
--Color and ListPrice from the Production.Product table, excludes the rows that ListPrice is 0.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE ListPrice != 0

--3. Write a query that retrieves the columns ProductID, Name, Color and ListPrice
--from the Production.Product table, the rows that are NULL for the Color column.
SELECT ProductID, Name, Color, ListPrice
From Production.Product
WHERE Color is Null


--4. Write a query that retrieves the columns ProductID, Name, Color and ListPrice 
--from the Production.Product table, the rows that are not NULL for the Color column.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL


--5. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows 
--that are not NULL for the column Color, and the column ListPrice has a value greater than zero.
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL AND ListPrice > 0


--6. Write a query that concatenates the columns Name and Color from the Production.Product 
--table by excluding the rows that are null for color.
SELECT Name + ' ' + Color AS [Name Color]
FROM Production.Product
Where Color Is Not Null



--7. Write a query that generates the following result set  from Production.Product:
SELECT 'NAME: ' + NAME + ' -- ' + 'COLOR: ' + COLOR
FROM Production.Product
WHERE Name like '%Crankarm'
OR Name like 'Chainring%'
ORDER BY Name desc;



--8. Write a query to retrieve the to the columns ProductID and Name 
--from the Production.Product table filtered by ProductID from 400 to 500
SELECT ProductID, NAME
FROM Production.Product
WHERE ProductID Between 400 and 500

--9. Write a query to retrieve the to the columns  ProductID, Name and color 
--from the Production.Product table restricted to the colors black and blue
SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color IN ('black','blue')

--10. Write a query to get a result set on products that begins with the letter S.
SELECT *
FROM Production.Product
Where Name  Like 'S%'

--11. Write a query that retrieves the columns Name and ListPrice from the Production.Product table. 
--Your result set should look something like the following. Order the result set by the Name column. 
SELECT Name, ListPrice 
From Production.Product
WHERE Name Like 'S%'
Order by Name asc;

-- 12  Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should look something like the following. 
--Order the result set by the Name column. The products name should start with either 'A' or 'S'
SELECT NAME, ListPrice
FROM Production.Product
WHERE NAME Like 'A%' OR NAME Like 'S%';


-- 13. Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is then not followed by the letter K. 
--After this zero or more letters can exists. Order the result set by the Name column.
SELECT *
FROM Production.Product
WHERE Name like 'SPO[^k]%'
ORDER BY NAME ;

--14 Write a query that retrieves unique colors from the table Production.Product. 
--Order the results  in descending  manner.
SELECT DISTINCT Color
FROM Production.Product
ORDER BY Color DESC;

