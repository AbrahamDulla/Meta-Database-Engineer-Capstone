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
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customerId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `customerscol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `productId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `subCategory` VARCHAR(45) NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`productId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `orderId` INT NOT NULL,
  `orderscdateol` VARCHAR(45) NOT NULL,
  `shipDate` VARCHAR(45) NOT NULL,
  `shipMode` VARCHAR(45) NOT NULL,
  `totalCost` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  `discount` INT NULL,
  `customerId` INT NULL,
  `shipingCost` DOUBLE NOT NULL,
  `orderPriority` VARCHAR(45) NOT NULL,
  `productId` INT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `customer_fk_idx` (`customerId` ASC) VISIBLE,
  INDEX `product_fk_idx` (`productId` ASC) VISIBLE,
  CONSTRAINT `customer_fk`
    FOREIGN KEY (`customerId`)
    REFERENCES `mydb`.`customers` (`customerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `product_fk`
    FOREIGN KEY (`productId`)
    REFERENCES `mydb`.`product` (`productId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
