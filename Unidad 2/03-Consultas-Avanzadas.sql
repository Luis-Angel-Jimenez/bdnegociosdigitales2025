--Join (Juntar) INNER (Default), LEFT (), RIGHT (), CROSS (), FULL (). 
use Northwind;
--Seleccionar todas las categorias y productos
Select * from 
Categories 
INNER JOIN 
Products 
on Categories.CategoryID = Products.CategoryID;

Select Categories.CategoryID,CategoryName, ProductName, UnitsInStock, UnitPrice from 
Categories 
INNER JOIN 
Products 
on Categories.CategoryID = Products.CategoryID;

Select C.CategoryID,CategoryName as 'Nombre de la Categoria', ProductName as 'Nombre del Producto', UnitsInStock as 'Existencia', UnitPrice as 'Precio' from 
Categories as C
INNER JOIN 
Products as P
on C.CategoryID = P.CategoryID;

-- Seleccionar los productos de la categoria beverages y condiments donde la existencia este entre 18 y 30

Select P.ProductID as 'Numero de Producto', P.ProductName as 'Nombre del Producto', C.CategoryID as 'Numero de Categoria',C.CategoryName as 'Nombre Categoria', UnitPrice as 'Precio', UnitsInStock as 'Existencia'
from Products as P inner join Categories as C on C.CategoryID = P.CategoryID
where (C.CategoryName in('Beverages','Condiments')) and P.UnitsInStock between 18 and 30;

-- Seleccionar los productos y sus importes realizados de marzo a junio de 1996,
-- mostrando la fecha de la orden, el id del producto y el importe

Select O.OrderDate, OD.ProductID, OD.OrderID, (OD.UnitPrice * OD.Discount)  from Orders as O inner join [Order Details] AS OD 
ON OD.OrderID = O.OrderID WHERE O.OrderDate between '1996-01-07' and '1996-30-10'

--Mostrar total de ventas de la sonsulta anterior

Select concat('$', ' ', sum(OD.Quantity * OD.UnitPrice)) as 'Importe' from Orders as O inner join [Order Details] AS OD 
ON OD.OrderID = O.OrderID WHERE O.OrderDate between '1996-01-07' and '1996-30-10'




Select GETDATE()