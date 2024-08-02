-- MySQL Script generated by MySQL Workbench
-- Sun Jul 28 14:13:56 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RedSocial
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `RedSocial` ;

-- -----------------------------------------------------
-- Schema RedSocial
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RedSocial` DEFAULT CHARACTER SET utf8 ;
USE `RedSocial` ;

-- -----------------------------------------------------
-- Table `RedSocial`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`usuario` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`usuario` (
  `codigo` INT  NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NULL,
  `contrasenia` VARCHAR(60) NULL,
  `descripcion` VARCHAR(180) NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`reaccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`reaccion` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`reaccion` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `positivo` INT DEFAULT 0,
  `negativo` INT DEFAULT 0,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`publicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`publicacion` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`publicacion` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `texto` VARCHAR(200) NULL,
  `usuario_codigo` INT NOT NULL,
  `reaccion_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `usuario_codigo`, `reaccion_codigo`),
  INDEX `fk_publicacion_usuario1_idx` (`usuario_codigo` ASC) VISIBLE,
  INDEX `fk_publicacion_reaccion1_idx` (`reaccion_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_publicacion_usuario1`
    FOREIGN KEY (`usuario_codigo`)
    REFERENCES `RedSocial`.`usuario` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_publicacion_reaccion1`
    FOREIGN KEY (`reaccion_codigo`)
    REFERENCES `RedSocial`.`reaccion` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`respuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`respuesta` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`respuesta` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `tema` VARCHAR(200) NULL,
  `usuario_codigo` INT NOT NULL,
  `publicacion_codigo` INT NOT NULL,
  `reaccion_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `usuario_codigo`, `publicacion_codigo`, `reaccion_codigo`),
  INDEX `fk_respuesta_usuario1_idx` (`usuario_codigo` ASC) VISIBLE,
  INDEX `fk_respuesta_publicacion1_idx` (`publicacion_codigo` ASC) VISIBLE,
  INDEX `fk_respuesta_reaccion1_idx` (`reaccion_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_respuesta_usuario1`
    FOREIGN KEY (`usuario_codigo`)
    REFERENCES `RedSocial`.`usuario` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuesta_publicacion1`
    FOREIGN KEY (`publicacion_codigo`)
    REFERENCES `RedSocial`.`publicacion` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuesta_reaccion1`
    FOREIGN KEY (`reaccion_codigo`)
    REFERENCES `RedSocial`.`reaccion` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`grupo` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`grupo` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `fecha` DATETIME NULL,
  `tema` VARCHAR(40) NULL,
  `descripcion` VARCHAR(200) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`imagen_publicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`imagen_publicacion` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`imagen_publicacion` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(120) NULL,
  `publicacion_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `publicacion_codigo`),
  INDEX `fk_publicacion_imagen_publicacion1_idx` (`publicacion_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_publicacion_imagen_publicacion1`
    FOREIGN KEY (`publicacion_codigo`)
    REFERENCES `RedSocial`.`publicacion` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`miembros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`miembros` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`miembros` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`imagen_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`imagen_usuario` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`imagen_usuario` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(80) NULL,
  `usuario_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `usuario_codigo`),
  INDEX `fk_usuario_imagen_usuario1_idx` (`usuario_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_imagen_usuario1`
    FOREIGN KEY (`usuario_codigo`)
    REFERENCES `RedSocial`.`usuario` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`imagen_respuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`imagen_respuesta` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`imagen_respuesta` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(80) NULL,
  `respuesta_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`, `respuesta_codigo`),
  INDEX `fk_respuesta_imagen_respuesta1_idx` (`respuesta_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_respuesta_imagen_respuesta1`
    FOREIGN KEY (`respuesta_codigo`)
    REFERENCES `RedSocial`.`respuesta` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`amigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`amigo` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`amigo` (
  `codigo` INT NOT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RedSocial`.`usuario_amigo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RedSocial`.`usuario_amigo` ;

CREATE TABLE IF NOT EXISTS `RedSocial`.`usuario_amigo` (
  `usuario_codigo` INT NOT NULL,
  `amigo_codigo` INT NOT NULL,
  PRIMARY KEY (`usuario_codigo`, `amigo_codigo`),
  INDEX `fk_usuario_has_amigo_amigo1_idx` (`amigo_codigo` ASC) VISIBLE,
  INDEX `fk_usuario_has_amigo_usuario1_idx` (`usuario_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_amigo_usuario1`
    FOREIGN KEY (`usuario_codigo`)
    REFERENCES `RedSocial`.`usuario` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_amigo_amigo1`
    FOREIGN KEY (`amigo_codigo`)
    REFERENCES `RedSocial`.`amigo` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
