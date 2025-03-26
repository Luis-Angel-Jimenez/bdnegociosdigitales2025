## Views
## Hecho por : Luis Angel Jimenez



- Views

- Una vista sirve para encapsular una consulta muy grande
```SQL
/*create view nombreVista
AS
Select columnas 
from tabla 
where condicion*/

use Northwind
go

Create or alter view VistaCategorias_Todas
as 
Select CategoryID, CategoryName, [Description], Picture 
from Categories
Where CategoryName = 'Beverages'
go

Select * from VistaCategorias_Todas
Where CategoryName = 'Beverages'

drop view VistaCategorias_Todas

Select * from Customers
go

--Crea una vista que permita visualizar los clientes de mexico y brasil

create or alter view VistaClientes_Latinos
as
Select * from Customers  
where Country in ('Mexico', 'Brazil')
go

Select CompanyName as 'Cliente', City as 'Ciudad', Country as 'Pais' 
from VistaClientes_Latinos
where City= 'Sao Paulo'
order by 2 desc
go

Select distinct vc1.Country from Orders as o
inner join VistaClientes_Latinos as vc1
on vc1.CustomerID = o.CustomerID
go

Select * from Orders as o
inner join VistaClientes_Latinos as vc1
on vc1.CustomerID = o.CustomerID
go

Select * from Orders as o
left join VistaClientes_Latinos as vc1
on vc1.CustomerID = o.CustomerID
go

Select * from Orders as o
right join VistaClientes_Latinos as vc1
on vc1.CustomerID = o.CustomerID
go

--Crear una vista que contenga los datos de todas las ordenes, 
--los productos, categorias de productos,empleados y clientes, en la orden calcular el importe
create or alter view Datos_de_todas_las_Ordenes
as
Select o.OrderID as 'Numero de Orden', 
o.OrderDate as 'Fecha de Orden', 
o.RequiredDate as 'Fecha de Requisicion',
CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre de Empleado', 
cu.CompanyName as 'Nombre del Cliente', 
p.ProductName as 'Nombre del Producto',
c.CategoryName as 'Nombre de la Categoria', 
od.UnitPrice as 'Precio de Venta', 
od.Quantity as 'Cantidad de Venta', 
(od.Quantity * od.UnitPrice) as 'Importe'
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on p.ProductID = od.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on o.CustomerID = cu.CustomerID
inner join Employees as e
on o.EmployeeID = e.EmployeeID
go


create or alter view dbo.[vistaordenescompra]
as
Select o.OrderID as 'Numero de Orden', 
o.OrderDate as 'Fecha de Orden', 
o.RequiredDate as 'Fecha de Requisicion',
CONCAT(e.FirstName, ' ', e.LastName) as 'Nombre de Empleado', 
cu.CompanyName as 'Nombre del Cliente', 
p.ProductName as 'Nombre del Producto',
c.CategoryName as 'Nombre de la Categoria', 
od.UnitPrice as 'Precio de Venta', 
od.Quantity as 'Cantidad de Venta', 
(od.Quantity * od.UnitPrice) as 'Importe'
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on p.ProductID = od.ProductID
inner join Orders as o
on od.OrderID = o.OrderID
inner join Customers as cu
on o.CustomerID = cu.CustomerID
inner join Employees as e
on o.EmployeeID = e.EmployeeID
go

create schema rh

create table rh.tablarh(
id int primary key,
nombre nvarchar(50)
)
go

-- Vista Horizontal
create or alter view rh.Viewcategoriasproductos
as
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID;
go

select * from rh.Viewcategoriasproductos

select count(distinct [numero Orden]) as [Numero de Ordenes]
from vistaordenescompra

select sum([Cantidad Vendida] * [Precio de Venta]) as [importe Total]
from vistaordenescompra
Go

select sum(importe) as [importe Total]
from vistaordenescompra
where year([Fecha de Orden]) between '1995' and '1996'  
Go

create or alter view vista_ordenes_1995_1996
as
select [Nombre del Cliente] as 'Nombre Cliente',
sum(importe) as [importe Total]
from vistaordenescompra
where year([Fecha de Orden])
between '1995' and '1996'  
group by [Nombre del Cliente]
having count(*)>2


create schema rh

create table rh.tablarh (
  id int primary key,
  nombre nvarchar(50)
)


-- vista horizontal
create or alter view rh.viewcategoriasproductos
as
select c.CategoryID, CategoryName, p.ProductID, p.ProductName
from
Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID;
GO

select * from rh.viewcategoriasproductos