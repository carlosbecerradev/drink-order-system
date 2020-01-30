-- use test
-- drop database PedidoLicores;
create database bd_donlicor;

use bd_donlicor;

create table Usuario(
	id_usuario int auto_increment primary key,
	username varchar(20) unique,
    contrasenia varchar(20),
    celular int
);

create table Pedido (
	id_pedido int auto_increment primary key,
    id_usuario int,
    fecha date,
    monto_final decimal(7,2),
    constraint fk_usuario_pedido foreign key (id_usuario) references Usuario(id_usuario)
);

create table Producto (
	id_producto int auto_increment primary key,
    nombre varchar(50),    
    precio double(6,2),
    stock int
);

create table DetallePedido (
	id_detalle_pedido int auto_increment primary key,
    id_pedido int,
    id_producto int,
    cantidad int,
    constraint fk_detped_pedido foreign key (id_pedido) references Pedido(id_pedido),
    constraint fk_detped_prudcto foreign key (id_producto) references Producto(id_producto)
);

use PedidoLicores;
-- select * from Usuario;
insert into Usuario(username, contrasenia, celular) values ('carlos', '123', 914423555);
insert into Usuario(username, contrasenia, celular) values ('paul', '123', 914423255);
insert into Usuario(username, contrasenia, celular) values ('brian', '123', 914433555);
insert into Usuario(username, contrasenia, celular) values ('garcia', '123', 914424445);
-- select * from Pedido;
-- select * from Producto;
insert into Producto(nombre, precio, stock) values ('vodka RUSKAYA', 20.00, 100);
insert into Producto(nombre, precio, stock) values ('ron CARTAVIO', 40.00, 100);
insert into Producto(nombre, precio, stock) values ('whisky JOHNNIE WALKER', 50.00, 100);
insert into Producto(nombre, precio, stock) values ('pisco SANTIAGO QUEIROLO', 80.00, 100);
insert into Producto(nombre, precio, stock) values ('pisco PORTON', 90.00, 100);
-- select * from DetallePedido;









