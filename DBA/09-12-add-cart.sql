-- cakeweb.Customers definition

CREATE TABLE `Customers` (
  `CustomerId` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerId`),
  UNIQUE KEY `account` (`Account`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- cakeweb.Products definition

CREATE TABLE `Products` (
  `ProductId` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) NOT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Price` decimal(18,2) NOT NULL,
  `StockQuantity` int NOT NULL,
  `Description` text,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- cakeweb.Cart definition

CREATE TABLE `Cart` (
  `CustomerId` int NOT NULL,
  `ProductId` int NOT NULL,
  PRIMARY KEY (`CustomerId`,`ProductId`),
  KEY `ProductId` (`ProductId`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `Customers` (`CustomerId`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`ProductId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- cakeweb.Orders definition

CREATE TABLE `Orders` (
  `OrderId` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `ShipDate` datetime DEFAULT NULL,
  `ShippingAddress` varchar(200) DEFAULT NULL,
  `TotalAmount` decimal(18,2) NOT NULL,
  `OrderStatus` varchar(50) NOT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`OrderId`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `Customers` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- cakeweb.Payments definition

CREATE TABLE `Payments` (
  `PaymentId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int DEFAULT NULL,
  `PaymentDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `PaymentAmount` decimal(18,2) NOT NULL,
  `PaymentMethod` varchar(50) NOT NULL,
  `PaymentStatus` varchar(50) NOT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PaymentId`),
  KEY `OrderId` (`OrderId`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- cakeweb.Shipping definition

CREATE TABLE `Shipping` (
  `ShippingId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int DEFAULT NULL,
  `ShippingMethod` varchar(100) NOT NULL,
  `TrackingNumber` varchar(100) DEFAULT NULL,
  `ShippingCost` decimal(18,2) NOT NULL,
  `ShippedDate` datetime DEFAULT NULL,
  `DeliveredDate` datetime DEFAULT NULL,
  `ShippingStatus` varchar(50) NOT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ShippingId`),
  KEY `OrderId` (`OrderId`),
  CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- cakeweb.OrderItems definition

CREATE TABLE `OrderItems` (
  `OrderItemId` int NOT NULL AUTO_INCREMENT,
  `OrderId` int DEFAULT NULL,
  `ProductId` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(18,2) NOT NULL,
  `TotalPrice` decimal(18,2) GENERATED ALWAYS AS ((`Quantity` * `UnitPrice`)) VIRTUAL,
  PRIMARY KEY (`OrderItemId`),
  KEY `OrderId` (`OrderId`),
  KEY `ProductId` (`ProductId`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `Orders` (`OrderId`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `Products` (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
