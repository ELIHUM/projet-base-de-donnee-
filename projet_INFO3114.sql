-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: projet
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `categoryID` int NOT NULL,
  `categoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Beverages'),(2,'Condiments'),(3,'Confections'),(4,'Dairy Products'),(5,'Grains/Cereals'),(6,'Meat/Poultry'),(7,'Produce'),(8,'Seafood');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `customerID` char(5) NOT NULL,
  `contactName` varchar(50) NOT NULL,
  `contactTitle` varchar(50) NOT NULL,
  `companyName` varchar(50) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('ANATR','Ana Tracy','Owner','Ana Trades Limited'),('AROUT','Thomas Hardy','Sales Representative','Around the Horn'),('BOTTM','Elizabeth Lincoln','Accounting Manager','Botta Markets Limited'),('BSBEV','Victoria Ashworth','Sales Representative','Basana Beverages'),('CONSH','Elizabeth Brown','Sales Representative','Consolidated Holdings'),('EASTC','Ann Devon','Sales Agent','Eastern Connection'),('HANAR','Mario Pontes','Accounting Manager','Hana Canes Limited'),('HILAA','Carlos Hernández','Sales Representative','Hero Abas and Sons Limited'),('HUNGC','Yoshi Latimer','Sales Representative','Coyote Import Store'),('HUNGO','Patricia AKena','Sales Associate','All Night Grocers '),('ISLAT','Helen Bennett','Marketing Manager','Islands Traders'),('LAUGB','Yoshi Tannamuri','Marketing Assistant','Baker Wine Cellars'),('LEHMS','Renate Messner','Sales Representative','Lehmanns Marketing'),('MAISD','Catherine Dewey','Sales Agent','Mason Drew'),('OLDWO','Rene Phillips','Sales Representative','Old World Delicacies'),('QUEEN','Lúcia Carvalho','Marketing Assistant','Queen Cousins'),('QUICK','Horst Kloss','Accounting Manager','Quick Shooters '),('RATTC','Paula Wilson','Assistant Sales Representative','Canyon Grocery'),('RICSU','Michael Holz','Sales Manager','Richter Supermarkt'),('SEVES','Hari Kumar','Sales Manager','Seven Seas Imports'),('THECR','Liu Wong','Marketing Assistant','The Cracker Box'),('TOMSP','Karin Josephs','Marketing Manager','Toms Special'),('TORTU','Miguel Angel Paolino','Owner','Top Restaurant');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `orderID` int NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `unitPrice` float NOT NULL,
  `shippedDate` date NOT NULL,
  `discount` float NOT NULL,
  `shipVia` int NOT NULL,
  `quantity` int NOT NULL,
  `freight` float NOT NULL,
  `productID` int NOT NULL,
  `customerID` char(5) NOT NULL,
  `employeeID` int NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `COMMANDE_CLIENTS_FK` (`customerID`),
  KEY `COMMANDE_EMPLOYES_FK` (`employeeID`),
  KEY `COMMANDE_PRODUITS_FK` (`productID`),
  CONSTRAINT `COMMANDE_CLIENTS_FK` FOREIGN KEY (`customerID`) REFERENCES `clients` (`customerID`),
  CONSTRAINT `COMMANDE_EMPLOYES_FK` FOREIGN KEY (`employeeID`) REFERENCES `employes` (`employeeID`),
  CONSTRAINT `COMMANDE_PRODUITS_FK` FOREIGN KEY (`productID`) REFERENCES `produits` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (10249,'1996-05-07','1996-02-10',18.6,'1996-10-07',0,1,9,11.61,14,'TOMSP',6),(10250,'1996-08-07','1996-05-08',42.4,'1996-12-07',0.15,2,35,65.83,51,'HANAR',4),(10253,'1996-10-07','1996-09-09',10,'1996-12-09',0,2,20,58.17,31,'HANAR',3),(10255,'1996-12-07','1996-09-08',44,'1996-12-08',0,3,30,148.33,59,'RICSU',9),(10272,'1996-02-08','1996-02-09',27.8,'1996-06-08',0,2,24,98.03,72,'RATTC',6),(10273,'1996-05-08','1996-02-09',24.8,'1996-12-08',0.05,3,24,76.07,10,'QUICK',3),(10276,'1996-08-08','1996-02-10',24.8,'1996-12-09',0,3,15,13.84,10,'TORTU',8),(10293,'1996-08-29','1996-02-12',50,'1996-11-09',0,3,12,21.18,18,'TORTU',1),(10298,'1996-05-09','1996-03-10',15.2,'1996-11-09',0,2,40,168.22,2,'HUNGO',6),(10304,'1996-12-09','1996-10-10',16,'1996-11-10',0,2,30,63.79,49,'TORTU',1),(10321,'1996-03-10','1996-10-11',14.4,'1996-11-10',0,2,10,3.43,35,'ISLAT',3),(10346,'1996-05-11','1996-10-14',30.4,'1996-08-11',0,3,20,142.08,56,'RATTC',3),(10372,'1996-04-12','1997-01-01',64.8,'1996-09-12',0.25,2,12,890.78,20,'QUEEN',5),(10373,'1996-05-12','1997-02-01',10.6,'1996-11-12',0.2,3,80,124.12,58,'HUNGO',4),(10375,'1996-06-12','1997-03-01',18.6,'1996-09-12',0,2,15,20.12,14,'HUNGC',3),(10377,'1996-09-12','1997-06-01',36.4,'1996-09-13',0.15,3,20,22.21,28,'SEVES',1),(10380,'1996-12-12','1997-09-01',20.7,'1996-09-15',0.1,3,18,35.03,30,'HUNGO',8),(10395,'1996-12-13','1997-09-02',28.8,'1997-03-01',0,1,8,184.41,69,'HILAA',6),(10400,'1997-01-01','1997-09-03',14.4,'1997-03-02',0,3,35,83.93,35,'EASTC',1),(10401,'1997-01-01','1997-09-04',20.7,'1997-10-01',0,1,18,12.51,30,'RATTC',1),(10406,'1997-07-01','1997-09-09',8,'1997-10-03',0.1,1,30,108.04,21,'QUEEN',7),(10410,'1997-10-01','1997-07-02',2,'1997-10-07',0,3,49,2.4,33,'BOTTM',3),(10411,'1997-10-01','1997-07-02',15.5,'1997-10-08',0.2,3,40,23.65,44,'BOTTM',9),(10435,'1997-04-02','1997-07-03',15.2,'1997-07-02',0,2,10,9.21,2,'CONSH',8),(10438,'1997-06-02','1997-06-03',7.3,'1997-07-03',0.2,2,15,8.24,19,'TOMSP',3),(10441,'1997-10-02','1997-06-04',35.1,'1997-07-06',0,2,50,73.02,27,'OLDWO',3),(10471,'1997-11-03','1997-08-04',24,'1997-07-10',0,3,30,45.59,7,'BSBEV',2),(10472,'1997-12-03','1997-09-04',3.6,'1997-07-12',0.05,1,80,4.2,24,'SEVES',8),(10495,'1997-03-04','1997-01-05',7.2,'1997-11-04',0,3,10,4.65,23,'LAUGB',3),(10497,'1997-04-04','1997-02-05',30.4,'1997-07-04',0,1,14,36.21,56,'LEHMS',7),(10498,'1997-07-04','1997-05-05',4.5,'1997-11-04',0,2,14,29.75,24,'HILAA',8),(10503,'1997-11-04','1997-09-05',23.25,'1997-04-16',0,2,70,16.74,14,'HUNGO',6),(10523,'1997-01-05','1997-09-06',39,'1997-04-22',0.1,2,25,77.63,17,'SEVES',7),(10529,'1997-07-05','1997-04-06',24,'1997-09-05',0,2,14,66.69,55,'MAISD',5),(10532,'1997-09-05','1997-06-06',25.89,'1997-12-05',0,3,15,74.46,30,'EASTC',7),(10534,'1997-12-05','1997-09-06',25.89,'1997-05-14',0,2,10,27.94,30,'LEHMS',8),(10558,'1997-04-06','1997-02-07',9.5,'1997-10-06',0,2,25,72.97,47,'AROUT',1),(10620,'1997-05-08','1997-02-09',4.5,'1997-08-14',0,3,5,0.94,24,'LAUGB',2),(10621,'1997-05-08','1997-02-09',9.2,'1997-11-08',0,2,5,23.73,19,'ISLAT',4),(10624,'1997-07-08','1997-04-09',45.6,'1997-08-19',0,2,10,94.8,28,'THECR',4),(10625,'1997-08-08','1997-05-09',23.25,'1997-08-14',0,1,3,43.9,14,'ANATR',3);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenir`
--

DROP TABLE IF EXISTS `contenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenir` (
  `productID` int NOT NULL,
  `orderID` int NOT NULL,
  PRIMARY KEY (`productID`,`orderID`),
  KEY `CONTENIR_COMMANDE_FK` (`orderID`),
  CONSTRAINT `CONTENIR_COMMANDE_FK` FOREIGN KEY (`orderID`) REFERENCES `commande` (`orderID`),
  CONSTRAINT `CONTENIR_PRODUITS_FK` FOREIGN KEY (`productID`) REFERENCES `produits` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenir`
--

LOCK TABLES `contenir` WRITE;
/*!40000 ALTER TABLE `contenir` DISABLE KEYS */;
INSERT INTO `contenir` VALUES (14,10249),(51,10249),(41,10250),(51,10250),(31,10253),(49,10253),(16,10255),(36,10255),(59,10255),(20,10272),(31,10272),(72,10272),(10,10273),(31,10273),(33,10273),(40,10273),(76,10273),(10,10276),(13,10276),(18,10293),(2,10298),(36,10298),(49,10304),(59,10304),(71,10304),(35,10321),(56,10346),(20,10372),(38,10372),(60,10372),(72,10372),(58,10373),(71,10373),(14,10375),(28,10377),(39,10377),(30,10380),(53,10380),(69,10395),(35,10400),(30,10401),(56,10401),(65,10401),(71,10401),(21,10406),(28,10406),(36,10406),(40,10406),(33,10410),(44,10411),(59,10411),(2,10435),(72,10435),(19,10438),(34,10438),(57,10438),(27,10441),(7,10471),(56,10471),(24,10472),(51,10472),(23,10495),(41,10495),(77,10495),(56,10497),(72,10497),(77,10497),(24,10498),(40,10498),(14,10503),(65,10503),(17,10523),(55,10529),(68,10529),(69,10529),(30,10532),(66,10532),(30,10534),(40,10534),(54,10534),(47,10558),(51,10558),(52,10558),(53,10558),(73,10558),(24,10620),(52,10620),(19,10621),(28,10624),(29,10624),(44,10624),(14,10625),(42,10625),(60,10625);
/*!40000 ALTER TABLE `contenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS `employes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employes` (
  `employeeID` int NOT NULL,
  `employeeLastName` varchar(50) NOT NULL,
  `employeeFirstName` varchar(50) NOT NULL,
  `employeeTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES `employes` WRITE;
/*!40000 ALTER TABLE `employes` DISABLE KEYS */;
INSERT INTO `employes` VALUES (1,'Davolio','Nancy','Sales Representative'),(2,'Fuller','Andrew','Vice President, Sales'),(3,'Leverling','Janet','Sales Representative'),(4,'Peacock','Margaret','Sales Representative'),(5,'Buchanan','Steven','Sales Manager'),(6,'Suyama','Michael','Sales Representative'),(7,'King','Robert','Sales Representative'),(8,'Callahan','Laura','Inside Sales Coordinator'),(9,'Dodsworth','Anne','Sales Representative');
/*!40000 ALTER TABLE `employes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseurs` (
  `supplierID` int NOT NULL,
  `supplierCompanyName` varchar(50) NOT NULL,
  `supplierContactName` varchar(50) NOT NULL,
  `supplierContactTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`supplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseurs`
--

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
INSERT INTO `fournisseurs` VALUES (1,'Exotic Liquids Suppliers','Cooper Limited','Purchasing Manager'),(2,'New Orleans Cajun Delights','Shelley Burke','Order Administrator'),(3,'Kella Homestead','Regina Murphy','Sales Representative'),(4,'Tokyo Traders','Yoshi Nagase','Marketing Manager'),(6,'Mayuma Ltd','Mayumi Ohno','Marketing Representative'),(7,'Pavlova Ltd','Pavlova Ltd','Ian Devling'),(8,'Specialty Biscuits Ltd','Specialty Biscuits Ltd','Peter Wilson'),(9,'PB Limited','Lars Peterson','Sales Agent'),(10,'Frescos Americanas LTD','Carlos Diaz','Marketing Manager'),(11,'Heli Limited','Petra Winkler','Sales Manager'),(12,'Pluto Limited','Martin Bein','International Marketing Mgr.'),(13,'Nord Suppliers','Sven Petersen','Coordinator Foreign Markets'),(14,'Formanta Supply Limited','Elio Rossi','Sales Representative'),(15,'Nord Suppliers','Beate Vileid','Marketing Manager'),(16,'Bigfoot Breweries','Cheryl Saylor','Regional Account Rep.'),(17,'Sven AB','Michael Björn','Sales Representative'),(18,'Atom Suppliers','Greene Nodier','Sales Manager'),(19,'New England Seafood Cannery','Robb Merchant','Wholesale Account Agent'),(20,'Leka Trading','Chandra Leka','Owner'),(22,'Zaam Snowpick','Dirk Luchte','Accounting Manager'),(23,'Kart Kouriers','Anne Heikkonen','Product Manager'),(24,'Gooday',' Mate','Wendy Mackenzie'),(25,'Ma Maison','Jean-Guy Lauzon','Marketing Manager'),(26,'Pasta bris Limited','Giovanni Giudici','Order Administrator'),(27,'Escar Nouve Limited','Marie Delamare','Sales Manager'),(28,'Gabaana','Eliane Noz','Sales Representative');
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `productID` int NOT NULL,
  `unitPriceOne` float NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productUnitPrice` float NOT NULL,
  `quantityPerUnit` text NOT NULL,
  `unitinStock` int NOT NULL,
  `reorderlevel` int NOT NULL,
  `discontinued` tinyint(1) NOT NULL,
  `unitsOnOrder` int NOT NULL,
  `supplierID` int NOT NULL,
  `categoryID` int NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `PRODUITS_FOURNISSEURS_FK` (`supplierID`),
  KEY `PRODUITS_CATEGORIE_FK` (`categoryID`),
  CONSTRAINT `PRODUITS_CATEGORIE_FK` FOREIGN KEY (`categoryID`) REFERENCES `categorie` (`categoryID`),
  CONSTRAINT `PRODUITS_FOURNISSEURS_FK` FOREIGN KEY (`supplierID`) REFERENCES `fournisseurs` (`supplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (2,19,'Chang',19,'24 - 12 oz bottles',17,25,0,40,1,1),(7,30,'Uncle Bob\'s Organic Dried Pears',30,'12 - 1 lb pkgs.',15,10,0,0,3,7),(10,31,'Ikura',31,'12 - 200 ml jars',31,0,0,0,4,8),(13,6,'Konbu',6,'2 kg box',24,5,0,0,6,8),(14,23.25,'Tofu',23.25,'40 - 100 g pkgs.',35,0,0,0,6,7),(16,17.45,'Pavlova',17.45,'32 - 500 g boxes',29,10,0,0,7,3),(17,39,'Alice Mutton',39,'20 - 1 kg tins',0,0,1,0,7,6),(18,62.5,'Carnarvon Tigers',62.5,'16 kg pkg.',42,0,0,0,7,8),(19,9.2,'Teatime Chocolate Biscuits',9.2,'10 boxes x 12 pieces',25,5,0,0,8,3),(20,81,'Sir Rodney\'s Marmalade',81,'30 gift boxes',40,0,0,0,8,3),(21,10,'Sir Rodney\'s Scones',10,'24 pkgs. x 4 pieces',3,5,0,40,8,3),(23,9,'Tunnbröd',9,'12 - 250 g pkgs.',61,25,0,0,9,5),(24,4.5,'Guaraná Fantástica',4.5,'12 - 355 ml cans',20,0,1,0,10,1),(27,43.9,'Schoggi Schokolade',43.9,'100 - 100 g pieces',49,30,0,0,11,3),(28,45.6,'Rössle Sauerkraut',45.6,'25 - 825 g cans',26,0,1,0,12,7),(29,123.79,'Thüringer Rostbratwurst',123.79,'50 bags x 30 sausgs.',0,0,1,0,12,6),(30,25.89,'Nord-Ost Matjeshering',25.89,'10 - 200 g glasses',10,15,0,0,13,8),(31,12.5,'Gorgonzola Telino',12.5,'12 - 100 g pkgs',0,20,0,70,14,4),(33,2.5,'Geitost',2.5,'500 g',112,20,0,0,15,4),(34,14,'Sasquatch Ale',14,'24 - 12 oz bottles',111,15,0,0,16,1),(35,18,'Steeleye Stout',18,'24 - 12 oz bottles',20,15,0,0,16,1),(36,19,'Inlagd Sill',19,'24 - 250 g  jars',112,20,0,0,17,8),(38,263.5,'Côte de Blaye',263.5,'12 - 75 cl bottles',17,15,0,0,18,1),(39,18,'Chartreuse verte',18,'750 cc per bottle',69,5,0,0,18,1),(40,18.4,'Boston Crab Meat',18.4,'24 - 4 oz tins',123,30,0,0,19,8),(41,9.65,'Jack\'s New England Clam Chowder',9.65,'12 - 12 oz cans',85,10,0,0,19,8),(42,14,'Singaporean Hokkien Fried Mee',14,'32 - 1 kg pkgs.',26,0,1,0,20,5),(44,19.45,'Gula Malacca',19.45,'20 - 2 kg bags',27,15,0,0,20,2),(47,9.5,'Zaanse koeken',9.5,'10 - 4 oz boxes',36,0,0,0,22,3),(49,20,'Maxilaku',20,'24 - 50 g pkgs.',10,15,0,60,23,3),(51,53,'Manjimup Dried Apples',53,'50 - 300 g pkgs.',20,10,0,0,24,7),(52,7,'Filo Mix',7,'16 - 2 kg boxes',38,25,0,0,24,5),(53,32.8,'Perth Pasties',32.8,'48 pieces',0,0,1,0,24,6),(54,7.45,'Tourtière',7.45,'16 pies',21,10,0,0,25,6),(55,24,'Pâté chinois',24,'24 boxes x 2 pies',115,20,0,0,25,6),(56,38,'Gnocchi di nonna Alice',38,'24 - 250 g pkgs.',21,30,0,10,26,5),(57,19.5,'Ravioli Angelo',19.5,'24 - 250 g pkgs.',36,20,0,0,26,5),(58,13.25,'Escargots de Bourgogne',13.25,'24 pieces',62,20,0,0,27,8),(59,55,'Raclette Courdavault',55,'5 kg pkg.',79,0,0,0,28,4),(60,34,'Camembert Pierrot',34,'15 - 300 g rounds',19,0,0,0,28,4),(65,21.05,'Louisiana Fiery Hot Pepper Sauce',21.05,'32 - 8 oz bottles',76,0,0,0,2,2),(66,17,'Louisiana Hot Spiced Okra',17,'24 - 8 oz jars',4,20,0,100,2,2),(68,12.5,'Scottish Longbreads',12.5,'10 boxes x 8 pieces',6,15,0,10,8,3),(69,36,'Gudbrandsdalsost',36,'10 kg pkg.',26,15,0,0,15,4),(71,21.5,'Flotemysost',21.5,'10 - 500 g pkgs.',26,0,0,0,15,4),(72,34.8,'Mozzarella di Giovanni',34.8,'24 - 200 g pkgs.',14,0,0,0,14,4),(73,15,'Röd Kaviar',15,'24 - 150 g jars',101,5,0,0,17,8),(76,18,'Lakkalikööri',18,'500 ml',57,20,0,0,23,1),(77,13,'Original Frankfurter grüne Soße',13,'12 boxes',32,15,0,0,12,2);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-21 21:56:50
CREATE VIEW VentesParEmploye AS
SELECT 
    e.employeeID,
    e.employeeLastName,
    e.employeeFirstName,
    SUM(c.quantity) AS total_products_sold,
    SUM(c.unitPrice * c.quantity * (1 - c.discount)) AS total_revenue
FROM COMMANDE c
JOIN EMPLOYES e ON c.employeeID = e.employeeID
GROUP BY e.employeeID, e.employeeLastName, e.employeeFirstName;

DELIMITER $$
CREATE TRIGGER update_stock_after_commande
AFTER INSERT ON COMMANDE
FOR EACH ROW
BEGIN
    UPDATE PRODUITS
    SET unitinStock = unitinStock - NEW.quantity
    WHERE productID = NEW.productID;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Check_Reorder()
BEGIN
    SELECT 
        productID, 
        productName, 
        unitinStock, 
        reorderlevel
    FROM PRODUITS
    WHERE unitinStock < reorderlevel;
END$$
DELIMITER ;

-- Création de l'utilisateur admin avec tous les privilèges sur la base Projet
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'Admin';
GRANT ALL PRIVILEGES ON Projet.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;

-- Création de l'utilisateur operateur avec uniquement un accès en lecture sur la base Projet
CREATE USER 'operateur'@'localhost' IDENTIFIED BY 'Operateur';
GRANT SELECT ON Projet.* TO 'operateur'@'localhost';
FLUSH PRIVILEGES;



