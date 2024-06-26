-- MySQL Script generated by MySQL Workbench
-- Fri Jan 14 15:02:12 2024
-- Model: LittleLemon    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Little_Lemon_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Little_Lemon_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Little_Lemon_DB` DEFAULT CHARACTER SET utf8 ;
USE `Little_Lemon_DB` ;

-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`Menu` (
  `MenuID` INT NOT NULL,
  `MenuItemName` VARCHAR(45) NULL,
  `Type` VARCHAR(45) NULL,
  `Cuisine` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`Orders` (
  `OrderID` INT NOT NULL,
  `TableNo` INT NOT NULL,
  `MenuID` INT NULL,
  `BookingID` INT NULL,
  `Quantity` INT NULL,
  `TotalCost` FLOAT NULL,
  `OrderDate` DATE NULL,
  `OrderDeliveryID` INT NULL,
  PRIMARY KEY (`OrderID`, `TableNo`),
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `BookingID_idx` (`BookingID` ASC) VISIBLE,
  INDEX `OrderDeliveryID_idx` (`OrderDeliveryID` ASC) VISIBLE,
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `Little_Lemon_DB`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `BookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `Little_Lemon_DB`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrderDeliveryID`
    FOREIGN KEY (`OrderDeliveryID`)
    REFERENCES `Little_Lemon_DB`.`OrderDeliveryStatus` (`OrderDeliveryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`OrderDeliveryStatus` (
  `OrderDeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(255) NULL,
  PRIMARY KEY (`OrderDeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`StaffInformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`StaffInformation` (
  `EmployeeID` INT NOT NULL,
  `EmployeeName` VARCHAR(255) NOT NULL,
  `Role` VARCHAR(255) NULL,
  `Address` VARCHAR(255) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(255) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `TableNo` INT NULL,
  `CustomerID` INT NULL,
  `BookingDate` DATE NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `TableNo_idx` (`TableNo` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `EmployeeID_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `TableNo`
    FOREIGN KEY (`TableNo`)
    REFERENCES `Little_Lemon_DB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Little_Lemon_DB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `EmployeeID`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `Little_Lemon_DB`.`StaffInformation` (`EmployeeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Little_Lemon_DB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Little_Lemon_DB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(255) NOT NULL,
  `Address` VARCHAR(255) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;







SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
