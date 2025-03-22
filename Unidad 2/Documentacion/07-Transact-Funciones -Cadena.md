## Transact Funciones Cadena

```SQL

--Funciones de Cadena
--las funciones de Cadena permiten manipular tipos de datos como varchar, 
-- nvarchar, char, nchar

--Funcion Len -> Devuelve la longitud de una cadena

--Declaracion de una variable


Declare @numero int;
set @numero = 10;

Declare @Texto varchar(50) = 'Hola, Josh!'

-- obtener el tama;o de la cadena almacenada em ala variable texto

Select len(@Texto) as 'Longitud'

Select companyname, len(CompanyName) from Customers

-- Funcion Left Extrae un determinado de caracteres desde el inicio de la cadena


go
--Upper -> Convierte una cadena en mayusculas
select Upper (@Texto2) as Mayuscula;
Select SUBSTRING(@Texto2, 7, 5);

Declare @Texto2 VARCHAR(50) = 'Hola, Mundo!';
SELECT CONCAT(
Left(@Texto2, 5), 
Upper(SUBSTRING(@Texto2, 7, 5)), 
RIGHT(@Texto2,1))
go

update Customers
set CompanyName = UPPER (CompanyName)
where Country in ('Mexico', 'Germany')
Select * from Customers;
go


-- Trim -> quita espacios en blanco en de una cadena

Declare @Texto2 VARCHAR(50) = '          Hola, Mundo!         ';
Select Trim(@Texto2)

Declare @Texto3 VARCHAR(50) = '          Hola, Mundo!         ';
Select LTrim(@Texto3)

Declare @Texto4 VARCHAR(50) = '          Hola, Mundo!         ';
Select RTrim(@Texto4)

Select trim ('       Test          ') as Result


go
