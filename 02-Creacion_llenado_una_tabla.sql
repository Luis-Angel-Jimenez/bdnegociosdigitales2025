
--Creación de la bas de datos tienda1

--Crear base de datos tienda 1

create database tienda1;

--Utilizar una base de datos 

use tienda1;

-- SQL - LDD
--Crear tabla de categoria 

create table categoria(
categoriaID int not null,
nombrecatego varchar (20) not null,
constraint pk_categoria
primary key (categoriaID),
constraint unico_nombre
unique (nombrecatego)
);

-- SQL - LMD
--Agregar registros a la tabla categoria

insert into categoria
values(1, 'Carnes Frias');

insert into categoria(categoriaID, nombrecatego)
values (2, 'Linea Blanca');

insert into  categoria(nombrecatego, categoriaID)
values ('Vinos y Licores', 3);

insert into categoria
values (4, 'Ropa'),
(5, 'Dulces'),
(6, 'Lacteos');

insert into categoria (nombrecatego, categoriaID)
values ('Panaderia', 7),
('Zapateria', 8),
('Jugeteria', 9);

insert into categoria
values (10, 'Panaderia');

select * from categoria;

select * from categoria
order by categoriaID asc;