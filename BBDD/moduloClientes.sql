-- BDBARBERSPA

-- La BD principal o generica se llamara prueba, esta BD se guardara en un archivo o script aparte, para que cuando un cliente nuevo se registre
-- se cambie el nombre y empiece a trabajar
-- drop database SYS_PRUEBA1;
create database SYS_PRUEBA1 DEFAULT CHARACTER SET utf8;
USE SYS_PRUEBA1;

/**########################*/
-- TABLAS DE CONFIGURACION
/**########################*/
-- aqui se registrara el plan actual.
create table planactual(idplan varchar(3),plan varchar(50),fechIniVigencia date,fechFinVigencia date,nulldate date default null,isactivo int default 1);
/***tablas de planes * modulos***/
create table modulos(idmodulo int primary key auto_increment,nombremodulo varchar(50),rutamodulo varchar(100),rutaimgmodulo varchar(100),fechregistro date,
fechaproduccion date,isactivo int default 0,desarrolladopor varchar(30),idplan varchar(3),idrol varchar(3),
foreign key (idplan) references planactual(idplan),
foreign key(idrol) references rol(idrol)
);

create table configuracion(id int primary key,db varchar(100),usr varchar(100),pwd varchar(100),
fechregistro date,fechinivig date,fechfinvig date,nulldate date default null,isactivo int default 0,nomCliente varchar(100));


-- ###############################################################
-- TBLAS ALIMENTADORAS
-- ###############################################################
create table dia(id varchar(2) primary key,dia varchar(50));
insert into dia (id,dia)values ('LU','Lunes'),('MA','Martes'),('MI','Miercoles'),('JU','Jueves'),('VI','Viernes'),('SA','Sabado'),('DO','Domingo');
create table rol( idrol varchar(3) primary key,rol varchar(50));
insert into rol (idrol,rol)values('R','Root'),('A','Administrador'),('V','Vendedor'),('C','Cliente');
create table tipoEmpleado(idtipoEmpleado varchar(5) primary key,tipoEmpleado varchar(50));
insert into tipoEmpleado(idtipoempleado,tipoempleado)values('A','Administrador'),('B','Barbero');
create table categorias(id int primary key auto_increment,categoria varchar(100));-- se representa las categorias de los productos.
insert into categorias(categoria)values('Cortes'),('Peinados'),('Mascarillas');
create  table estado(idestado int primary key, estado varchar(30));
insert into estado(idestado,estado)values(1,'Pendiente'),(2,'Emitida'),(3,'Cancelada');


/*###########################*/
/* GESTION DE CLIENTES */
/*###########################*/

-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_EstadoCivil` ---
-- -----------------------------------------------------
CREATE TABLE `tb_EstadoCivil` (idEstadoCivil VARCHAR(2) NOT NULL,descripcion VARCHAR(45) NULL,PRIMARY KEY (idEstadoCivil));
insert into tb_EstadoCivil(idestadocivil,descripcion)values('S','Soltero'),('C','Casado'),('NI','No Informado');
-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_tipdoc`
-- -----------------------------------------------------
CREATE TABLE `tb_tipdoc` (idTipdoc VARCHAR(3) NOT NULL, descripcion VARCHAR(50) NOT NULL,PRIMARY KEY (idTipdoc));
insert into tb_tipdoc(idtipdoc,descripcion)values('DNI','DNI'),('RUC','RUC'),('PAS','Pasaporte'),('CEX','Carnet Extranjeria');
-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_Sexo`
-- -----------------------------------------------------
CREATE TABLE`tb_Sexo` (`idSexo` VARCHAR(2) NOT NULL,`sexo` VARCHAR(50) NULL,PRIMARY KEY (`idSexo`));
  insert into tb_sexo(idsexo,sexo)values('M','Masculino'),('F','Femenino'),('NI','No Informado');
  -- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_TipoVia`
-- -----------------------------------------------------
CREATE TABLE `tb_TipoVia` (`idTipoVia` VARCHAR(5) NOT NULL,`descripcion` VARCHAR(50) NULL,PRIMARY KEY (`idTipoVia`));
insert into tb_tipovia(idtipovia,descripcion)values('AV.','Avenida'),('Cl','Calle'),('PJ','Pasaje'),('Pr','Paradero');
  -- -------------------------
-- Table tb_departamento - tb-provincia - tb_diostrito
-- ------------------------
create table tb_departamento(iddepartamento char(2) primary key,departamento varchar(50));
create table tb_provincia(iddepartamento char(2),idprovincia char(2),provincia varchar(50),primary key(iddepartamento,idprovincia));
create table tb_distrito(iddepartamento char(2),idprovincia char(2),iddistrito char(2),distrito varchar(50),primary key(iddistrito,idprovincia,iddepartamento));

-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_segmento` --Este campo nos permitira categorizar nuestros clientes. VIP - NORMAL ETC
-- -----------------------------------------------------
CREATE TABLE `tb_segmento` (`idSegmento` INT NOT NULL,`segmento` VARCHAR(45) NULL,PRIMARY KEY (`idSegmento`));
insert into tb_segmento(idsegmento,segmento)values(1,'VIP'),(2,'Premium'),(3,'Frecuente'),(4,'Regular');  
  
  /*TB PRINCIPALES*/
CREATE TABLE `tb_cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `apePaterno` VARCHAR(50) NULL,
  `apeMaterno` VARCHAR(50) NULL,
  `nombres` VARCHAR(100) NULL,
  `nrodocumento` VARCHAR(11) NULL,
  nrodocumento2 varchar(11)null,
  `idTipoDoc` VARCHAR(2) NOT NULL,
  `idSexo` VARCHAR(2) NOT NULL,
  `fecNacimiento` DATE NULL,
  `idEstadoCivil` VARCHAR(2) NOT NULL,
  `idTipoVia` VARCHAR(5) NOT NULL,
  `direccion` VARCHAR(300) NULL,
  iddepartamento char(2),
  idprovincia char(2),
  iddistrito char(2),
  `celular` VARCHAR(15) NULL,
  `celular2` VARCHAR(15) NULL,
  `telefono` VARCHAR(15) NULL,
  `correo` VARCHAR(50) NULL,
  `isactivo` INT NOT NULL,
  `fechaRegistro` DATE NULL,
  `segmento` INT NOT NULL,
  `canVisitas` INT NULL,
  PRIMARY KEY (`idCliente`),
  foreign key (iddepartamento) references tb_distrito(iddistrito),
    FOREIGN KEY (`idEstadoCivil`)   REFERENCES `tb_EstadoCivil` (`idEstadoCivil`),
    FOREIGN KEY (`idTipoDoc`)   REFERENCES `tb_tipdoc` (`idTipdoc`),
    FOREIGN KEY (`idSexo`)    REFERENCES `tb_Sexo` (`idSexo`),
    FOREIGN KEY (`idTipoVia`)  REFERENCES `tb_TipoVia` (`idTipoVia`),
    FOREIGN KEY (`segmento`)   REFERENCES `tb_segmento` (`idSegmento`));
    
    
-- ###################################################
-- FIDELIZACIÓN
-- ###################################################
create table fidelizacion(
id int auto_increment,
idcliente int,
codigocliente varchar(8),
cantVisitas int default 0,
descuento decimal(9,2),
fechregistro date,
primary key(id,codigocliente),
foreign key(idcliente) references tb_cliente(idCliente)
);


    
/*###########################*/
/* GESTION DE EMPLEADOS */
/*###########################*/

CREATE table empleado(
idemp int auto_increment primary key,
idcliente int,
fecharegistro date,
sueldobase decimal(9,2) default 0.0,
comision decimal(9,2) default 0.0,
idtipoEmpleado varchar(5),
isactivo int default 1,
foreign key(idtipoEmpleado) references tipoEmpleado(idtipoEmpleado));

create table horario(idhorario int primary key auto_increment,idempleado int,dia varchar(2),horaEntra time,horaSal time,
foreign key(idempleado) references empleado(idemp),foreign key(dia)references dia(id));
create table controlHorario(id int auto_increment primary key,idempleado int,fecha datetime default now());

-- (Se va a asociar los empleados con la categoria - especialidad)
create table empleadoEspecialidad(idempleado int,idcategoria int,fecha datetime default now(),
foreign key(idempleado) references empleado(idemp),foreign key(idcategoria)references categorias(id));

    
/*###########################*/
/* GESTION DE USUARIOS */
/*###########################*/

create table usuario(
idusuario varchar(50) primary key unique,
password varchar(50),
correo varchar(100),
idrol varchar(3),
apePaterno varchar(50),
apeMaterno varchar(50),
nombre varchar(50),
celular varchar(15),
pinseguridad varchar(4),
fechregistro datetime default now(),
fechaUltimoSesion datetime,
token varchar(50),
isactivo int default 0,
idcliente int null,
idempleado int null,
foreign key(idcliente) references tb_cliente(idcliente),
foreign key(idempleado) references empleado(idemp),
foreign key(idrol) references rol(idrol)
);
insert into usuario(idusuario,password,correo,idrol,nombre,isactivo)values('rootprueba','123456','adrian.cucho@publitecperu.com','R','Adrian',1);
















-- ##########################################
-- PRODUCTOS -- la idea es pasar todos los servicios como productos.
-- ##########################################
create table tipoProducto(id char(1) primary key,tipo varchar(50));-- aca se va a definir si es producto(P) o servicio(S)
create table productos(
id int primary key auto_increment,
idtipo int,
nombre varchar(50),
descripcion varchar(300),
precioVenta decimal(9,2) default 0.0,
precioCompra decimal(9,2) default 0.0,
isPromo int default 0,
isActivo int default 1,
stock int default 0,
fechRegistro date default now(),
foreign key(idtipo) references tipoProducto(id));

-- ######################################################################
-- table control. - se va a tener el control de las entradas y salidas de productos.
-- ######################################################################
create table tipoEntradaSalida(id char(1),tipo varchar(50));
create table entradaSalida(
id int auto_increment primary key,
tipo char(1),
idproducto int,
cantidad int default 1,
preUni decimal(9,2) default 0.0,
precioCompra decimal(9,2) default 0.0,
fechaRegistro date,
iduser int,
foreign key(iduser) references usuario(idusuario),
foreign key(idproducto)references productos(id)
);


-- tabla de promociones.
/*
Esta tabla funcionara de la siguiente forma:
Si el tipo de promocion es por el total de su compra, se utilizara el campo PORCENTAJE!!
Si es por producto se utilizara el PROCENTAJE o PRECIODESCUENTO
Si es por cliente fiel(tarjeta), se tomara porcentajeespecial(para todos) o producto + procentajeespecial

*/
create table tipoPromocion(id int primary key auto_increment,tipoPromocion varchar(50));
create table promociones(
id int primary key auto_increment,
idproducto int null,
tipoPromocion int,
procentaje decimal(9,2),
porcentajeespecial decimal(9,2),
preciodescuento decimal(9,2),
cantMaxima int default 0,
fechregistro date,
fechaIniVigencia datetime,
fechaFinVigencia datetime,
foreign key(idproducto) references productos(id),
foreign key(tipoPromocion)references tipoPromocion(id));



/*#######################################################*/
-- TABLA DE VENTAS
/*#######################################################*/
create table ventas(
id int auto_increment,
idventa varchar(15) primary key,
fechVenta datetime default now(),
idcliente int null,
codigocliente int,
idusuario int,
preLiquida decimal(9,2) default 0.0,
preComision decimal(9,2) default 0.0,
preNeta decimal(9,2) default 0.0,
igv decimal(9,2) default 0.0,
descuento decimal(9,2) default 0.0,
preTOTAL decimal(9,2) default 0.0,
idestado int,
foreign key(idestado) references estado(idestado),
foreign key(idcliente)references tb_cliente(idCliente),
foreign key(idusuario)references usuario(idusuario),
foreign key(codigocliente)references fidelizacion(codigocliente)
);

create table detalleventa(
id int auto_increment,
idventa varchar(15),
idproducto int,
cantidad int default 0,
preUni decimal(9,2),
preventa decimal(9,2),
foreign key(idproducto) references productos(id)
);




-- #####################################################
-- TABLAS DE PAGOS Y COMISIONES
-- #####################################################
/* para realizar el pago, se va a buscar el monto a pagar meidante un filtro de fechas entre las ventas realizadas*/
create table pagos(
id int auto_increment primary key,
nroPago int,
fechPago datetime default now(),
fechIni date,
fechFin date,
idempleado int,
idestado int,
foreign key(idestado) references estado(idestado),
foreign key(idempleado)references empleado(idemp)
);




-- ##########################################################
-- TABLAS DE AGENDA
-- ##########################################################
create table horas(hora time);
create table agenda(
idagenda int auto_increment primary key,
idestado int,
idservicio int,
idempleado int,
fechRegistro date,
fechReserva date,
horareserva time,
duracion time,
foreign key(idestado) references estado(idestado),
foreign key(idservicio) references productos(id),
foreign key(idempleado) references empleado(idemp)
);




/*###########################*/
/* TABLAS DE CONTROL - contadores, historiales */ -- estas tablas seran llenadas por triggers
/*###########################*/
--

-- falta crear tabla
create table tb_clientevisitas(
id int primary key auto_increment,
idcliente int,
idventa varchar(15),
fechavisita datetime,
monto decimal(9,2) default 0.0,
foreign key(idcliente) references tb_cliente(idCliente),
foreign key(idventa) references ventas(idventa)
);    
    

    
