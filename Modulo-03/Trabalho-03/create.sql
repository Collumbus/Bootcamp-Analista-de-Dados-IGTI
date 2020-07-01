-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bootcamp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bootcamp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bootcamp` DEFAULT CHARACTER SET utf8 ;
USE `bootcamp` ;

-- -----------------------------------------------------
-- Table `bootcamp`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootcamp`.`estado` (
  `CodEstadoIBGE` INT NOT NULL,
  `NomeEstado` VARCHAR(45) NOT NULL,
  `SiglaEstado` CHAR(2) NOT NULL,
  `Regiao` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`CodEstadoIBGE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bootcamp`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootcamp`.`cidade` (
  `CodigoCompletoIBGE` VARCHAR(45) NOT NULL,
  `CodigoCidadeIBGE` VARCHAR(10) NOT NULL,
  `NomeCidade` VARCHAR(150) NOT NULL,
  `CodEstadoIBGE` INT NOT NULL,
  PRIMARY KEY (`CodigoCompletoIBGE`),
  INDEX `fk_Cidade_Estado_idx` (`CodEstadoIBGE` ASC) VISIBLE,
  CONSTRAINT `fk_Cidade_Estado`
    FOREIGN KEY (`CodEstadoIBGE`)
    REFERENCES `bootcamp`.`estado` (`CodEstadoIBGE`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bootcamp`.`tipounidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootcamp`.`tipounidade` (
  `idTipoUnidade` INT NOT NULL AUTO_INCREMENT,
  `dscTipoUnidade` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idTipoUnidade`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bootcamp`.`imovel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bootcamp`.`imovel` (
  `idImovel` INT NOT NULL AUTO_INCREMENT,
  `codRegistro` VARCHAR(45) NOT NULL,
  `Disponibilidade` CHAR(1) NULL DEFAULT NULL,
  `idTipoUnidade` INT NOT NULL,
  `areaImovel` DECIMAL(6,2) NULL DEFAULT NULL,
  `valorIPTU` DECIMAL(10,2) NULL DEFAULT NULL,
  `valorCondominio` DECIMAL(10,2) NULL DEFAULT NULL,
  `qtdeQuartos` INT NULL DEFAULT NULL,
  `qtdeBanheiro` INT NULL DEFAULT NULL,
  `qtdeSuite` INT NULL DEFAULT NULL,
  `qtdeSala` INT NOT NULL DEFAULT '1',
  `qtdeVagas` INT NOT NULL DEFAULT '0',
  `CodigoCompletoIBGE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idImovel`),
  INDEX `fk_Imovel_TipoUnidade_idx` (`idTipoUnidade` ASC) VISIBLE,
  INDEX `fk_Imovel_Cidade1_idx` (`CodigoCompletoIBGE` ASC) VISIBLE,
  CONSTRAINT `fk_Imovel_Cidade1`
    FOREIGN KEY (`CodigoCompletoIBGE`)
    REFERENCES `bootcamp`.`cidade` (`CodigoCompletoIBGE`),
  CONSTRAINT `fk_Imovel_TipoUnidade`
    FOREIGN KEY (`idTipoUnidade`)
    REFERENCES `bootcamp`.`tipounidade` (`idTipoUnidade`))
ENGINE = InnoDB
AUTO_INCREMENT = 36
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `bootcamp`.`tipounidade`
-- -----------------------------------------------------
START TRANSACTION;
USE `bootcamp`;
INSERT INTO `bootcamp`.`tipounidade` (`idTipoUnidade`, `dscTipoUnidade`) VALUES (1, 'Casa');
INSERT INTO `bootcamp`.`tipounidade` (`idTipoUnidade`, `dscTipoUnidade`) VALUES (2, 'Casa geminada');
INSERT INTO `bootcamp`.`tipounidade` (`idTipoUnidade`, `dscTipoUnidade`) VALUES (3, 'Apartamento tipo');
INSERT INTO `bootcamp`.`tipounidade` (`idTipoUnidade`, `dscTipoUnidade`) VALUES (4, 'Apartamento cobertura');
INSERT INTO `bootcamp`.`tipounidade` (`idTipoUnidade`, `dscTipoUnidade`) VALUES (5, 'Apartamento área privativa');
INSERT INTO `bootcamp`.`tipounidade` (`idTipoUnidade`, `dscTipoUnidade`) VALUES (6, 'Flat');

COMMIT;

