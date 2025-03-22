## Store Procedures

```SQL

-- Crear un Store procedure para seleccionar todos los clientes
Create or alter procedure spu_mostrar_clientes
as
Begin
	Select * from Customers;
End;
go
-- Ejecutar un store con transact
exec spu_mostrar_Clientes
go

--Crear un sp que muestre los clientes por pais 
--Parametros de entrada

create or alter proc sp_customersporpais
--Parametros
@pais1 nvarchar(15),-- Parametro de entrada
@pais2 nvarchar(15)
as 
begin
	Select * from Customers
	where Country in (@pais1 , @pais2);
end;
go
--Fin del Store

--Ejecuta un store
Declare @p1 nvarchar(15) = 'Spain';
Declare @p2 nvarchar(15) = 'Germany';

exec sp_customersporpais @p1, @p2;

exec sp_customersporpais 'Germany', 'Mexico';

exec sp_customersporpais 'Brazil', 'Spain';

exec sp_customersporpais 'Spain', 'Mexico';
go

--Ejercicios

-- Generar un reporte que permita visualisar los  datos de compra de un 
-- determinado cliente, en un rango de fechas, mostrando, 
-- el monto total de compras por producto, mediante un sp

Use Northwind;

Select * from Orders
go

create or alter proc sp_Reporte_datos_Compra
as
begin
	select  p.ProductName, c.CompanyName, o.RequiredDate,
	sum(od.Quantity * od.UnitPrice) as 'Total de Ventas'
	from Customers as c
	inner join Orders as o
	on c.CustomerID = o.CustomerID
	inner join [Order Details] as od
	on od.OrderID = o.OrderID
	inner join Products as p
	on od.ProductID = p.ProductID
	where o.RequiredDate between '1996-01-01' and '1996-30-12'
	group by p.ProductName, c.CompanyName, o.RequiredDate;
end;
go


CREATE or alter VIEW [dbo].[VistaOrdenesCompra]
AS
SELECT ORD.OrderID AS 'Numero Orden',
ORD.OrderDate AS 'Fecha de orden',
ORD.RequiredDate AS 'Fecha de Requisicion',
CONCAT(EM.FirstName, ' ', EM.LastName) AS 'Nombre del empleado',
CUS.CompanyName AS 'Nombre del cliente',
PRO.ProductName as 'Nombre del Producto',
CAT.CategoryName AS 'Nombre de la categoria',
OD.UnitPrice AS 'Precio de venta',
OD.Quantity AS 'Cantidad vendida',
(OD.Quantity * OD.UnitPrice) AS 'Importe'
FROM 
Categories AS CAT
INNER JOIN Products AS PRO
ON CAT.CategoryID = PRO.CategoryID
INNER JOIN [Order Details] AS OD
ON OD.ProductID = PRO.ProductID
INNER JOIN Orders AS ORD
ON ORD.OrderID = OD.OrderID
INNER JOIN Customers AS CUS
ON CUS.CustomerID = ORD.CustomerID
INNER JOIN Employees AS EM
ON EM.EmployeeID = ORD.EmployeeID
GO


CREATE OR ALTER proc spu_informe_ventas_clientes
--parametros
@nombre nvarchar (40) = 'Vins et alcools Chevalier', --parametro de entrada con valor por default
@fechaInicial DateTime,
@fechaFinal DateTime
as
begin
Select [Nombre del Producto], [Nombre del cliente], sum(Importe) AS 'Monto total'
from VistaOrdenesCompra
where [Nombre del cliente] = @nombre 
and [Fecha de orden] between @fechaInicial and @fechaFinal
group by [Nombre del Producto], [Nombre del cliente];
end;

SELECT * FROM dbo.VistaOrdenesCompra
select * from Customers

--Ejecucion de un store procedure con parametros de Entrada

exec spu_informe_ventas_clientes 'Vins et alcools Chevalier', 
								 '1996-01-01', '1997-01-01'

--Ejecucion de un store procedure con parametros en diferente posicion

exec spu_informe_ventas_clientes @fechaFinal = '1997-01-01',
								 @nombre ='Vins et alcools Chevalier',
								 @fechaInicial = '1996-01-01' 

--Ejecucion de un store procedure con parametros de entrada con un 
--campo que tiene un valor por default
exec spu_informe_ventas_clientes  
								 @fechaInicial = '1996-01-01', 
								 @fechaFinal = '1997-01-01'
go
								 
--Store Procedure con parametros de salida
create or alter proc spu_obtener_numero_clientes
@customerid nchar(5),
@totalCustomers int output -- parametro de salida
as 
begin 
	Select @totalCustomers = COUNT(*) from Customers
	where CustomerID = @customerid;
	end;
go

declare @numero int;
exec spu_obtener_numero_clientes @customerid = 'ANATAR',
								 @totalCustomers = @numero output;
print @numero;
go

--Crear un store procedure que permita saber si un alumno aprobo o reprobo
create or alter proc spu_comparar_calificacion
@calif decimal(10,2) --Parametro de entrada
as 
begin
	if @calif >= 0 and @calif <= 10
	begin
	 if @calif >= 8
	 print 'La Calificacion es aprobatoria'
	 else
	 print 'La Calificacion es reprobatoria'
	 end;
	 else
	 print 'Una calificacion no valida'
end;
go

exec spu_comparar_calificacion @calif = 10
go

-- Crear un sp que permita verificar si un cliente existe antes de devolver 
--su informacion

create or alter proc spu_obtener_cliente_siexiste
@numeroCliente nchar
as
begin
	if exists(select 1 from Customers where CustomerID = @numeroCliente)
		select * from Customers where CustomerID = @numeroCliente;
	else
		print 'El cliente no existe' 
end;
go

select * from Customers
select 1 from Customers where CustomerID = 'AROUT'

exec spu_obtener_cliente_siexiste @numeroCliente = 'AROUT'
go

-- crear un sp que permita insertar un cliente,
--pero se debe verificar primero no exista

--create or alter proc spu_insertar_
--crear un 
create or alter proc spu_agregar_cliente
	@id nchar(5),
	@nombre nvarchar(40),
	@city nvarchar(15) = 'San Miguel'
as
begin
	if exists(select 1 from Customers where CustomerID = @id)
	begin
		print ('El cliente ya existe')
		return 1
	end
	insert into Customers(customerID, companyname)
	values (@id, @nombre)
	print('Cliente insertado exitosamente');
	return 0;
end;
go

exec spu_agregar_cliente 'ALFKI', 'Patito de Hule'

Select * from Customers

exec spu_agregar_cliente 'ALFKC', 'Patito de Hule'

GO
CREATE OR ALTER PROC spu_agregar_cliente_TRY_CATCH
	@id nchar(5),
	@nombre nvarchar(40),
	@city nvarchar(15) = 'San Miguel'
as
begin
	begin try
		insert into Customers(customerID, companyname)
		values (@id, @nombre)
		print('Cliente insertado exitosamente');
	end try
	begin catch
		print ('El cliente ya existe')
	end catch
end;

exec spu_agregar_cliente 'ALFKD', 'Muneca vieja'
go
-- Manejo de ciclos en store procedures

--Imprimir el numero de veces que indique el usuario

create or alter proc spu_imprimir
	@numero int
as
begin
	if @numero <= 0
	begin
		print ('El numero no puede ser 0 o negativo')
		return
	end

	declare @i int 
	set @i = 1;

	while(@i <= @numero)
	begin
		print concat('Numero ', @i)
		set @i = @i + 1;
	end
end;

exec spu_imprimir @numero = 10