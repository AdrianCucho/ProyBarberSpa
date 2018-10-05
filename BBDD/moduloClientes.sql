-- BDBARBERSPA

-- La BD principal o generica se llamara prueba, esta BD se guardara en un archivo o script aparte, para que cuando un cliente nuevo se registre
-- se cambie el nombre y empiece a trabajar
create database SYS_PRUEBA1 DEFAULT CHARACTER SET utf8;
USE SYS_PRUEBA1;

/**########################*/
-- TABLAS DE CONFIGURACION
/**########################*/
-- aqui se registrara el plan actual.
create table planactual(idplan varchar(3),plan varchar(50),fechIniVigencia date,fechFinVigencia date,nulldate date default null,isactivo int default 1);

/***tablas de planes * modulos***/
create table modulos(idmodulo int primary key auto_increment,nombremodulo varchar(50),rutamodulo varchar(100),rutaimgmodulo varchar(100),fechregistro date,
fechaproduccion date,isactivo int default 1,desarrolladopor varchar(30));
create table rol (idrol varchar(4),rol varchar(50));
-- tabla de interseccion entre modulos y planes y roles
create table moduloPlanRol(idplan varchar(3),idrol varchar(4),idmodulo int,fecharegistro date,isactivo int  default 1,foreign key (idplan) references planes(idplan),
foreign key (idmodulo) references modulos(idmodulo),foreign key(idrol)references rol(idrol));









/*###########################*/
/* GESTION DE CLIENTES */
/*###########################*/

-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_EstadoCivil` ---
-- -----------------------------------------------------
CREATE TABLE `tb_EstadoCivil` (idEstadoCivil VARCHAR(2) NOT NULL,descripcion VARCHAR(45) NULL,PRIMARY KEY (idEstadoCivil));
-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_tipdoc`
-- -----------------------------------------------------
CREATE TABLE `tb_tipdoc` (idTipdoc VARCHAR(2) NOT NULL, descripcion VARCHAR(50) NOT NULL,PRIMARY KEY (idTipdoc));

-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_Sexo`
-- -----------------------------------------------------
CREATE TABLE`tb_Sexo` (`idSexo` VARCHAR(2) NOT NULL,`sexo` VARCHAR(50) NULL,PRIMARY KEY (`idSexo`));
  
  -- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_TipoVia`
-- -----------------------------------------------------
CREATE TABLE `tb_TipoVia` (`idTipoVia` VARCHAR(2) NOT NULL,`descripcion` VARCHAR(45) NULL,PRIMARY KEY (`idTipoVia`));
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
    FOREIGN KEY (`idEstadoCivil`)   REFERENCES `Sys_ProyectoBarberSpa`.`tb_EstadoCivil` (`idEstadoCivil`),
    FOREIGN KEY (`idTipoDoc`)   REFERENCES `Sys_ProyectoBarberSpa`.`tb_tipdoc` (`idTipdoc`),
    FOREIGN KEY (`idSexo`)    REFERENCES `Sys_ProyectoBarberSpa`.`tb_Sexo` (`idSexo`),
    FOREIGN KEY (`idTipoVia`)  REFERENCES `Sys_ProyectoBarberSpa`.`tb_TipoVia` (`idTipoVia`),
    FOREIGN KEY (`segmento`)   REFERENCES `Sys_ProyectoBarberSpa`.`tb_segmento` (`idSegmento`));
    
    
    
    
/**TABLAS DE CONTROL -- CONTADORAS,HISTORIALES.VISTAS */
-- falta crear tabla
create table tb_clientevisitas(
id int primary key auto_increment,
idcliente int,
idventa varchar(15),
fechavisita datetime,
monto decimal(9,2) default 0.0,
foreign key(idcliente) references tb_cliente(idCliente),
foreign key(idventa) references tb_venta(idventa)
);    
    
    
