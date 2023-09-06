-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SGE
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SGE` ;

-- -----------------------------------------------------
-- Schema SGE
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SGE` DEFAULT CHARACTER SET armscii8 ;
USE `SGE` ;

-- -----------------------------------------------------
-- Table `SGE`.`turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`turma` ;

CREATE TABLE IF NOT EXISTS `SGE`.`turma` (
  `idturma` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `ano` INT NULL,
  PRIMARY KEY (`idturma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`aluno` ;

CREATE TABLE IF NOT EXISTS `SGE`.`aluno` (
  `idaluno` INT NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `dt_nascimento` DATE NULL,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `turma_idturma` INT NOT NULL,
  PRIMARY KEY (`idaluno`, `turma_idturma`),
  INDEX `fk_aluno_turma_idx` (`turma_idturma` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_turma`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `SGE`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`professor` ;

CREATE TABLE IF NOT EXISTS `SGE`.`professor` (
  `idprofessor` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `especializacao` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idprofessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`dicplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`dicplina` ;

CREATE TABLE IF NOT EXISTS `SGE`.`dicplina` (
  `iddicplina` INT NOT NULL,
  `cod_diciplina` VARCHAR(45) NULL,
  `carga_horaria` INT NULL,
  `ano` INT NULL,
  PRIMARY KEY (`iddicplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`ministra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`ministra` ;

CREATE TABLE IF NOT EXISTS `SGE`.`ministra` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`leciona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`leciona` ;

CREATE TABLE IF NOT EXISTS `SGE`.`leciona` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`associado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`associado` ;

CREATE TABLE IF NOT EXISTS `SGE`.`associado` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`turma_has_professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`turma_has_professor` ;

CREATE TABLE IF NOT EXISTS `SGE`.`turma_has_professor` (
  `turma_idturma` INT NOT NULL,
  `professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`turma_idturma`, `professor_idprofessor`),
  INDEX `fk_turma_has_professor_professor1_idx` (`professor_idprofessor` ASC) VISIBLE,
  INDEX `fk_turma_has_professor_turma1_idx` (`turma_idturma` ASC) VISIBLE,
  CONSTRAINT `fk_turma_has_professor_turma1`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `SGE`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_has_professor_professor1`
    FOREIGN KEY (`professor_idprofessor`)
    REFERENCES `SGE`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`professor_has_dicplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`professor_has_dicplina` ;

CREATE TABLE IF NOT EXISTS `SGE`.`professor_has_dicplina` (
  `professor_idprofessor` INT NOT NULL,
  `dicplina_iddicplina` INT NOT NULL,
  PRIMARY KEY (`professor_idprofessor`, `dicplina_iddicplina`),
  INDEX `fk_professor_has_dicplina_dicplina1_idx` (`dicplina_iddicplina` ASC) VISIBLE,
  INDEX `fk_professor_has_dicplina_professor1_idx` (`professor_idprofessor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_dicplina_professor1`
    FOREIGN KEY (`professor_idprofessor`)
    REFERENCES `SGE`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_dicplina_dicplina1`
    FOREIGN KEY (`dicplina_iddicplina`)
    REFERENCES `SGE`.`dicplina` (`iddicplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SGE`.`turma_has_dicplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SGE`.`turma_has_dicplina` ;

CREATE TABLE IF NOT EXISTS `SGE`.`turma_has_dicplina` (
  `turma_idturma` INT NOT NULL,
  `dicplina_iddicplina` INT NOT NULL,
  PRIMARY KEY (`turma_idturma`, `dicplina_iddicplina`),
  INDEX `fk_turma_has_dicplina_dicplina1_idx` (`dicplina_iddicplina` ASC) VISIBLE,
  INDEX `fk_turma_has_dicplina_turma1_idx` (`turma_idturma` ASC) VISIBLE,
  CONSTRAINT `fk_turma_has_dicplina_turma1`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `SGE`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_has_dicplina_dicplina1`
    FOREIGN KEY (`dicplina_iddicplina`)
    REFERENCES `SGE`.`dicplina` (`iddicplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
