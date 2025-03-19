-- Realizar un pedido 
-- Validar que el pedido no exista 
-- Validar que el cliente exista, que el empleado exista y producto
-- Validar que la cantidad a vender tenga la suficiente stock
-- Insertar el pedido y calcular el importe (Multiplicando el precio del prodcuto
-- por la cantidad vendida)
-- Actualizar el stock del producto(restando el stock menos la cantidad vendida)

create or alter proc spu_realizar_pedido
	@NumeroPedido int,
	@cliente int,
	@empleado int,
	@fabricante char(3),
	@producto char(5),
	@cantidad int
as
begin
	if exists (select 1 from Pedidos where Num_Pedido = @NumeroPedido)
	begin
		print ('El pedido ya existe')
		return
	end
	if not exists (Select 1 from Clientes where Num_Cli = @cliente)
	begin
		print ('El cliente no existe ')
	end
	if not exists (Select 1 from Representantes where Num_Empl = @empleado)
	begin
		print('El empleado no existe')
	end
	if not exists(Select 1 from Productos where Id_fab = @fabricante and Id_producto = @producto)
	begin
		print ('El producto no existe')
	end

	if @cantidad <= 0
	begin
	print('La cantidad no puede ser 0 o negativo')
	return
	end

	declare @stockValido int
	select @stockValido = Stock from Productos where Id_fab = @fabricante and Id_producto = @producto
	
	if @cantidad > @stockValido
	begin
	print ('No hay suficiente stock')
	return
	end

	declare @precio money
	declare @importe money
	
	select @precio = precio from Productos where Id_fab = @fabricante and Id_producto = @producto
	set @importe = @cantidad * @precio

	begin try
	-- Se inserto un Pedido
	insert into Pedidos
	values (@NumeroPedido, GETDATE(), @cliente, @empleado, @fabricante, @producto, @cantidad,@importe);

	update Productos
	set Stock = Stock - @cantidad
	where Id_fab = @fabricante and Id_producto = @producto;

	end try

	begin catch

	print 'Error al actualizar datos'
	return;

	end catch
end;

go

/*if exists (Select 1 from Pedidos where Cantidad <= @cantidad)
	begin
		print ('No hay suficiente stock')
		insert into Pedidos (Num_Pedido, Fecha_Pedido, Cliente, Rep, Fab, Producto, Cantidad, Importe)
		values (@NumeroPedido, CURRENT_DATE, @cliente, @empleado, @fabricante, @producto, @cantidad, sum(@cantidad * precio))
*/

---------------------------------------------------------------------------------------
create or alter proc spu_realizar_pedido
	@NumeroPedido int,
	@cliente int,
	@empleado int,
	@fabricante char(3),
	@producto char(5),
	@cantidad int
as
begin
	if exists (select 1 from Pedidos where Num_Pedido = @NumeroPedido)
	begin
		print ('El pedido ya existe')
		return
	end
	if not exists (Select 1 from Clientes where Num_Cli = @cliente) or 
	not exists (Select 1 from Representantes where Num_Empl = @empleado) or
	not exists(Select 1 from Productos where Id_fab = @fabricante and Id_producto = @producto)
	begin
		print ('Los datos no son validos')
	end
end;
go

use BDEJEMPLO2

exec spu_realizar_pedido @NumeroPedido = 112961, @cliente = 2117, @empleado = 106,
@fabricante = 'REI', @producto ='2A44L', @cantidad = 20

exec spu_realizar_pedido @NumeroPedido = 113070, @cliente = 2117, @empleado = 101,
@fabricante = 'ACI', @producto ='4100X', @cantidad = 20

SELECT * FROM Productos
WHERE Id_fab = 'ACI' AND Id_producto = '4100X'