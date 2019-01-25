-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `idSyndrome` INT NOT NULL AUTO_INCREMENT,
  `syndrome` VARCHAR(45) NOT NULL,
  `syndrome_description` VARCHAR(80) NULL,
  PRIMARY KEY (`idSyndrome`),
  UNIQUE INDEX `idSyndrome_UNIQUE` (`idSyndrome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `idGene` INT NOT NULL AUTO_INCREMENT,
  `gene_name` VARCHAR(45) NOT NULL,
  `start` INT NOT NULL,
  `end` INT NOT NULL,
  `description` VARCHAR(80) NULL,
  `idSyndrome` INT NOT NULL,
  PRIMARY KEY (`idGene`),
  UNIQUE INDEX `idGene_UNIQUE` (`idGene` ASC) VISIBLE,
  INDEX `fk_Gene_1_idx` (`idSyndrome` ASC) VISIBLE,
  CONSTRAINT `fk_Gene_1`
    FOREIGN KEY (`idSyndrome`)
    REFERENCES `mydb`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL AUTO_INCREMENT,
  `patient_name` VARCHAR(45) NOT NULL,
  `patient_gender` ENUM("F", "M") NOT NULL,
  `patient_age` INT NULL,
  `syndrome ID` INT NOT NULL,
  `gene ID` INT NOT NULL,
  PRIMARY KEY (`idPatient`),
  UNIQUE INDEX `idPatient_UNIQUE` (`idPatient` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient_gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient_gene` (
  `idpatient_gene` INT NOT NULL AUTO_INCREMENT,
  `idPatient` INT NOT NULL,
  `idGene` INT NOT NULL,
  PRIMARY KEY (`idpatient_gene`),
  UNIQUE INDEX `idpatient_gene_UNIQUE` (`idpatient_gene` ASC) VISIBLE,
  INDEX `fk_patient_gene_2_idx` (`idGene` ASC) VISIBLE,
  INDEX `fk_patient_gene_1_idx` (`idPatient` ASC) VISIBLE,
  CONSTRAINT `fk_patient_gene_1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patient_gene_2`
    FOREIGN KEY (`idGene`)
    REFERENCES `mydb`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
