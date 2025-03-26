## Ejemplo de Left Join 
## Hecho por : Luis Angel Jimenez

```SQL

-- Carga full

insert into Products_new
Select p.ProductID, p.ProductName,
cu.CompanyName, ca.CategoryName, od.UnitPrice, p.Discontinued, GETDATE()
from Products as p 
inner join Categories as ca
on p.CategoryID = ca.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on cu.CustomerID = o.CustomerID

Select * from Products_new

drop table Products_new
--crear una tabla apartir de una consulta

Select p.ProductID, p.ProductName,
cu.CompanyName, ca.CategoryName, od.UnitPrice, p.Discontinued, GETDATE() as 'Inserted_date'
into Products_new
from Products as p 
inner join Categories as ca
on p.CategoryID = ca.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on cu.CustomerID = o.CustomerID


--Crear la tabla con solo la estructura

Select * from Products_new

Select top 0 p.ProductID, p.ProductName,
cu.CompanyName, ca.CategoryName, od.UnitPrice, p.Discontinued, GETDATE() as 'Inserted_date'
into Products_new
from Products as p 
inner join Categories as ca
on p.CategoryID = ca.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on cu.CustomerID = o.CustomerID

-- Con alias

Select * from Products_new

Select top 0 p.ProductID, p.ProductName as 'Product',
cu.CompanyName as 'Customer', ca.CategoryName as 'Category', od.UnitPrice, p.Discontinued, GETDATE() as 'Inserted_date'
into Products_new
from Products as p 
inner join Categories as ca
on p.CategoryID = ca.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on cu.CustomerID = o.CustomerID

-- Carga full

Select * from Products_new

insert into Products_new (ProductID,ProductName, CompanyName, CategoryName, UnitPrice, Discontinued, Inserted_date)
Select p.ProductID, p.ProductName,
cu.CompanyName, ca.CategoryName, od.UnitPrice, p.Discontinued, GETDATE()
from Products as p 
inner join Categories as ca
on p.CategoryID = ca.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on cu.CustomerID = o.CustomerID



drop table Products_new

Select top 0 p.ProductID, p.ProductName,
cu.CompanyName, ca.CategoryName, od.UnitPrice, p.Discontinued, GETDATE() as 'Inserted_date'
into Products_new
from Products as p 
inner join Categories as ca
on p.CategoryID = ca.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on cu.CustomerID = o.CustomerID

Alter table Products_new
add productbk int not null identity (1,1)

alter table Products_new 
add constraint pk_products_new 
primary key (productbk)

Select pn.ProductID,pn.ProductName, pn.CompanyName, pn.CategoryName, pn.UnitPrice, pn.Discontinued, pn.Inserted_date,
p.ProductID, p.ProductName from Products as p
inner join Products_new as pn
on p.ProductID = pn.ProductID
where p.ProductName = 'Elote Feliz'

Select pn.ProductID,pn.ProductName, pn.CompanyName, pn.CategoryName, pn.UnitPrice, pn.Discontinued, pn.Inserted_date,
p.ProductID, p.ProductName from Products as p
left join Products_new as pn
on p.ProductID = pn.ProductID
where pn.ProductID is null

Select pn.ProductID,pn.ProductName, pn.CompanyName, pn.CategoryName, pn.UnitPrice, pn.Discontinued, pn.Inserted_date,
p.ProductID, p.ProductName from Products as p
left join Products_new as pn
on p.ProductID = pn.ProductID
where pn.ProductID is null
--CONAULTA DELTA

insert into Products_new (ProductID,ProductName, CompanyName, CategoryName, UnitPrice, Discontinued, Inserted_date)
Select p.ProductID, p.ProductName,
cu.CompanyName, ca.CategoryName, od.UnitPrice, p.Discontinued, GETDATE() as 'Inserted_date'
from Products as p 
LEFT join Categories as ca
on p.CategoryID = ca.CategoryID
LEFT join [Order Details] as od
on od.ProductID = p.ProductID
LEFT join Orders as o
on od.OrderID = o.OrderID
LEFT join Customers as cu
on cu.CustomerID = o.CustomerID
LEFT join Products_new as pn
on pn.ProductID = p.ProductID
where pn.ProductID is null




select top 10 *
into Products2
from Products

select * from Products
select * from Products2

select * from Products as p1
inner join Products2 as p2
on p1.ProductID = p2.ProductID

select * from Products as p1
left join Products2 as p2
on p1.ProductID = p2.ProductID

select * from Products as p1
right join Products2 as p2
on p1.ProductID = p2.ProductID