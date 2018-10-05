
-- Schema Sys_ProyectoBarberSpa
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Sys_ProyectoBarberSpa` ;

-- -----------------------------------------------------
-- Schema Sys_ProyectoBarberSpa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Sys_ProyectoBarberSpa` DEFAULT CHARACTER SET utf8 ;
USE `Sys_ProyectoBarberSpa` ;










-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_Ubigeo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_Ubigeo` (
  `idUbigeo` INT NOT NULL,
  `idDepartamento` VARCHAR(2) NOT NULL,
  `idProvincia` VARCHAR(2) NOT NULL,
  `idDistrito` VARCHAR(2) NOT NULL,
  `descripcion` VARCHAR(70) NULL,
  PRIMARY KEY (`idUbigeo`));













-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `idPersona` INT  NULL,
  idempleado int null,
  `login` VARCHAR(50) NULL,
  `password` VARCHAR(50) NULL,
  `fechRegistro` DATE NULL,
  `ultRegistro` DATETIME NULL,
  `isActivo` INT NULL,
  `pinSeguridad` VARCHAR(6) NOT NULL,
  `token` VARCHAR(15) NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `idPersona_idx` (`idPersona` ASC),
    FOREIGN KEY (`idPersona`)     REFERENCES `Sys_ProyectoBarberSpa`.`tb_cliente` (`idCliente`),
    foreign key (idempleado) references tb_empleado(idEmpleado)
    );


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_horarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_horarios` (
  `idhorario` INT NOT NULL AUTO_INCREMENT,
  `idEmpleado` INT NOT NULL,
  `dias` VARCHAR(50) NULL,
  `horaEntrada` TIME NULL,
  `horaSalida` TIME NULL,
  `cantHoras` INT NULL,
  PRIMARY KEY (`idhorario`),
  INDEX `idEmpleado_idx` (`idEmpleado` ASC),
  CONSTRAINT `idEmpleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_EmpleadoEspecialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_EmpleadoEspecialidad` (
  `iddetallees` INT NOT NULL AUTO_INCREMENT,
  `idempleado` INT  NULL,
  `fechRegistro` DATE NULL,
  `idcategoria` INT NULL,
  PRIMARY KEY (`iddetallees`),
  CONSTRAINT `idEmpleado`
    FOREIGN KEY (`idempleado`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_TipoPS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_TipoPS` (
  `idTipo` VARCHAR(2) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `NroRuc` VARCHAR(11) NULL,
  `razonSocial` VARCHAR(100) NULL,
  `nomContacto` VARCHAR(100) NULL,
  `idubigeo` INT NOT NULL,
  `telefono` VARCHAR(15) NULL,
  `celular` VARCHAR(15) NULL,
  `celular2` VARCHAR(15) NULL,
  `correo` VARCHAR(100) NULL,
  `sitioWeb` VARCHAR(100) NULL,
  `descripcion` VARCHAR(300) NULL,
  PRIMARY KEY (`idProveedor`),
  INDEX `idubigeo_idx` (`idubigeo` ASC),
  CONSTRAINT `idubigeo`
    FOREIGN KEY (`idubigeo`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_Ubigeo` (`idUbigeo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_ProductoServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_ProductoServicio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idTipo` VARCHAR(2) NOT NULL,
  `idCategoria` INT NOT NULL,
  `nombreProServ` VARCHAR(50) NULL,
  `descripcion` VARCHAR(500) NULL,
  `precioUnidad` DECIMAL(9,2) NULL,
  `idProveedor` INT NOT NULL,
  `stock` INT NULL,
  `descuento` DECIMAL(9,2) NULL,
  `fechRegistro` DATE NULL,
  `isActivo` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `idTipo_idx` (`idTipo` ASC),
  INDEX `idCategoria_idx` (`idCategoria` ASC),
  INDEX `idProveedor_idx` (`idProveedor` ASC),
  CONSTRAINT `idTipo`
    FOREIGN KEY (`idTipo`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_TipoPS` (`idTipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_tipoIngresoSalida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_tipoIngresoSalida` (
  `idtipo` CHAR(1) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_ingresoSalidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_ingresoSalidas` (
  `id` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `idTipo` CHAR(1) NOT NULL,
  `cantidad` INT NULL,
  `fechIngreso` DATE NULL,
  `detalle` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `idTipo_idx` (`idTipo` ASC),
  INDEX `idProducto_idx` (`idProducto` ASC),
  CONSTRAINT `idTipo`
    FOREIGN KEY (`idTipo`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_tipoIngresoSalida` (`idtipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_ProductoServicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_venta` (
  `idventa` VARCHAR(15) NOT NULL,
  `fechRegistro` DATE NOT NULL,
  `idCliente` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  `idestado` INT NULL,
  `preNeto` DECIMAL(9,2) NULL,
  `comision` DECIMAL(9,2) NULL,
  `igv` DECIMAL(9,2) NULL,
  `preBruto` DECIMAL(9,2) NULL,
  `descuento` DECIMAL(9,2) NULL,
  `preTotal` DECIMAL(9,2) NULL,
  PRIMARY KEY (`idventa`),
  INDEX `idCliente_idx` (`idCliente` ASC),
  INDEX `idEmpleado_idx` (`idEmpleado` ASC),
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEmpleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_detalleVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_detalleVenta` (
  `iddetalle` VARCHAR(45) NOT NULL,
  `idventa` VARCHAR(15) NOT NULL,
  `idproducto` INT NOT NULL,
  `cantidad` INT NULL,
  `subtotal` DECIMAL(9,2) NULL,
  PRIMARY KEY (`iddetalle`),
  INDEX `idVenta_idx` (`idventa` ASC),
  INDEX `idProducto_idx` (`idproducto` ASC),
  CONSTRAINT `idVenta`
    FOREIGN KEY (`idventa`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_venta` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idproducto`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_ProductoServicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_estadoAgenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_estadoAgenda` (
  `idEstado` INT NOT NULL,
  `descripcion` VARCHAR(50) NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_horas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_horas` (
  `hora` TIME NOT NULL,
  PRIMARY KEY (`hora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_agenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_agenda` (
  `idagenda` INT NOT NULL AUTO_INCREMENT,
  `idestado` INT NOT NULL,
  `idServicio` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  `fecharegistro` DATETIME NULL,
  `fechReserva` DATE NULL,
  `horareserva` TIME NOT NULL,
  `duracion` TIME NULL,
  PRIMARY KEY (`idagenda`),
  INDEX `idEstado_idx` (`idestado` ASC),
  INDEX `idServicio_idx` (`idServicio` ASC),
  INDEX `idEmpleado_idx` (`idEmpleado` ASC),
  INDEX `horareserva_idx` (`horareserva` ASC),
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idestado`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_estadoAgenda` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idServicio`
    FOREIGN KEY (`idServicio`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_ProductoServicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEmpleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `horareserva`
    FOREIGN KEY (`horareserva`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_horas` (`hora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_ComiEmpProdServ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_ComiEmpProdServ` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idEmpleado` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `comision` DECIMAL(9,2) NULL,
  `fechRegistro` DATE NULL,
  `activo` INT NULL,
  `comentario` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `idEmpleado_idx` (`idEmpleado` ASC),
  INDEX `idProducto_idx` (`idProducto` ASC),
  CONSTRAINT `idEmpleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_ProductoServicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_comision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_comision` (
  `idcomision` INT NOT NULL AUTO_INCREMENT,
  `idventa` VARCHAR(15) NOT NULL,
  `idEmpleado` INT NOT NULL,
  `comision` DECIMAL(9,2) NULL,
  `fechEmision` DATETIME NULL,
  PRIMARY KEY (`idcomision`),
  INDEX `idventa_idx` (`idventa` ASC),
  INDEX `idEmpleado_idx` (`idEmpleado` ASC),
  CONSTRAINT `idventa`
    FOREIGN KEY (`idventa`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEmpleado`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_clienteHistorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_clienteHistorial` (
  `idhistorial` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NOT NULL,
  `idVenta` VARCHAR(15) NOT NULL,
  `fechaVisita` DATE NULL,
  `monto` DECIMAL(9,2) NULL,
  PRIMARY KEY (`idhistorial`),
  INDEX `idcliente_idx` (`idcliente` ASC),
  INDEX `idVenta_idx` (`idVenta` ASC),
  CONSTRAINT `idcliente`
    FOREIGN KEY (`idcliente`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVenta`
    FOREIGN KEY (`idVenta`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
