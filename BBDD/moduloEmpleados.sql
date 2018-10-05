-- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_Perfil` -- En esta tabla definiremos el tipo de empleado(admin,barber,recepcion)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_Perfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `perfil` VARCHAR(45) NULL,
  PRIMARY KEY (`idPerfil`));

create table tb_dias(id int primary key,dia varchar(50));
  
  -- -----------------------------------------------------
-- Table `Sys_ProyectoBarberSpa`.`tb_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sys_ProyectoBarberSpa`.`tb_empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `fechRegistro` DATE NULL,
  `sueldo` DECIMAL(9,2) NULL default 0.0,
  `comision` DECIMAL(9,2) NULL default 0.0,
  `idPerfil` INT NOT NULL,
  `isActivo` INT default 1,
  `foto` VARCHAR(100) NULL,
  PRIMARY KEY (`idEmpleado`),
    FOREIGN KEY (`idCliente`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_cliente` (`idCliente`),
    FOREIGN KEY (`idPerfil`)
    REFERENCES `Sys_ProyectoBarberSpa`.`tb_Perfil` (`idPerfil`));
    
-- ------
-- tablas de horarios, control, asistencias
-- ----
create table horarios(
idhorario int 
);
