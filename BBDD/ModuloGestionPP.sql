CREATE DATABASE bd_gestion;
use bd_gestion;

create table tiponegocio(idtiponegocio int primary key,tiponegocio varchar(50));/*Salon belleza, BARBERSHOR, SPA*/
create table planes(idplan varchar(3) primary key,plan varchar(2));/*PLAN 1 ,PLAN ECONOMICO, PLAN PREMIUM*/

create table if not exists tb_departamento(iddepartamento char(2) primary key,departamento varchar(50));
create table if not exists tb_provincia(iddepartamento char(2),idprovincia char(2),provincia varchar(50),primary key(iddepartamento,idprovincia));
create table if not exists tb_distrito(iddepartamento char(2),idprovincia char(2),iddistrito char(2),distrito varchar(50),primary key(iddistrito,idprovincia,iddepartamento));

create table clientePP(
id int primary key auto_increment,
documentonegocio varchar(15),
razonsocial varchar(100),
idtiponegocio int,
direccion varchar(300),
iddepartamento char(2),
idprovincia char(2),
iddistrito char(2),
telefono varchar(15),
celular varchar(15),
celular2 varchar(15),
correo varchar(15),
documentoRepre varchar(15),
nombresRepre varchar(100),
idplan varchar(3),
monto decimal(9,2),
fecharegistro date,
foreign key(iddistrito) references tb_diutrito(iddistrito),
foreign key(idtiponegocio) references tiponegocio(idtiponegocio),
foreign key(idplan) references planes(idplan)
);
alter table clientepp add rutadb varchar(100);
alter table clientepp add db varchar(100);
alter table clientepp add user varchar(100);
alter table clientepp add password varchar(100);

select * from clientepp;

/**aqui se almacenara los contrat6os de los clientes*/
create table clientePPContrato(
idcontrato int primary key auto_increment,
idcliente int,
fechainicio date,
fechafin date,
nulldate date default null,
monto decimal(9,2),
foreign key (idcliente)references clientePP(id)
);



/***tablas de planes * modulos***/
create table modulos(
idmodulo int primary key auto_increment,
nombremodulo varchar(50),
rutamodulo varchar(100),
rutaimgmodulo varchar(100),
fechregistro date,
fechaproduccion date,
isactivo int default 1,
desarrolladopor varchar(30));


create table moduloplan(
idplan varchar(3),
idmodulo int,
fecharegistro date,
isactivo int  default 1,
foreign key (idplan) references planes(idplan),
foreign key (idmodulo) references modulos(idmodulo)
);


select * from bdproysonko.tb_color;

-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `usuario` (
  idusuario varchar(100)  unique,
  `login` VARCHAR(50) NULL,
  `password` VARCHAR(50) NULL,
  `fechRegistro` DATE NULL,
  `isActivo` INT NULL,
  `pinSeguridad` VARCHAR(6) NOT NULL,
  `token` VARCHAR(15) NULL,
  PRIMARY KEY (`idusuario`)
    );
