-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: compra
-- ------------------------------------------------------
-- Server version	8.0.29

-- LAS TABLAS INCLUIDAS EN ESTE BACKUP SON CATEGORIA, DELIVERY, ESTACIONALIDAD, ESTADO MADUREZ, ORDEN, PRESENTACION, PRODUCTO, PRODUCTOSMASCOMPRADOS, PRODUCTOSORDEN, TAMANO, USUARIO

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `descripcionCategoria` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Fruta'),(2,'Verdura'),(3,'Fruto Seco');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `idDelivery` int NOT NULL AUTO_INCREMENT,
  `deliveryDate` date NOT NULL,
  PRIMARY KEY (`idDelivery`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'2023-02-08'),(2,'2023-02-09'),(3,'2023-02-10');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacionalidad`
--

DROP TABLE IF EXISTS `estacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacionalidad` (
  `idEstacionalidad` int NOT NULL AUTO_INCREMENT,
  `descripcionEstacionalidad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idEstacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacionalidad`
--

LOCK TABLES `estacionalidad` WRITE;
/*!40000 ALTER TABLE `estacionalidad` DISABLE KEYS */;
INSERT INTO `estacionalidad` VALUES (1,'Sí está en temporada'),(2,'No está en temporada');
/*!40000 ALTER TABLE `estacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `idStatus` int NOT NULL AUTO_INCREMENT,
  `descripcionStatus` varchar(40) NOT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'pendiente'),(2,'terminado'),(3,'con problemas');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `madurez`
--

DROP TABLE IF EXISTS `madurez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `madurez` (
  `idMadurez` int NOT NULL AUTO_INCREMENT,
  `descripcionMadurez` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idMadurez`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `madurez`
--

LOCK TABLES `madurez` WRITE;
/*!40000 ALTER TABLE `madurez` DISABLE KEYS */;
INSERT INTO `madurez` VALUES (1,'Por madurar'),(2,'Madura');
/*!40000 ALTER TABLE `madurez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idDelivery` int NOT NULL,
  `idStatus` int NOT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idDelivery` (`idDelivery`),
  KEY `idStatus` (`idStatus`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`idDelivery`) REFERENCES `delivery` (`idDelivery`),
  CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`idStatus`) REFERENCES `estado` (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,2,1,1),(2,1,1,2),(3,3,2,1),(4,4,2,1),(5,5,2,2);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentacion`
--

DROP TABLE IF EXISTS `presentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentacion` (
  `idPresentacion` int NOT NULL AUTO_INCREMENT,
  `descripcionPresentacion` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` VALUES (1,'1 kilo'),(2,'500gr'),(3,'250gr'),(4,'100gr');
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(40) NOT NULL,
  `imagenProducto` varchar(500) NOT NULL,
  `precioProducto` decimal(10,2) NOT NULL,
  `costoProducto` decimal(10,2) NOT NULL,
  `idCategoria` int NOT NULL,
  `idEstacionalidad` int NOT NULL,
  `idPresentacion` int NOT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idEstacionalidad` (`idEstacionalidad`),
  KEY `idPresentacion` (`idPresentacion`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idEstacionalidad`) REFERENCES `estacionalidad` (`idEstacionalidad`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`idPresentacion`) REFERENCES `presentacion` (`idPresentacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Fresa','fkjdsnfkljsdhflk32497h',10.00,5.00,1,2,2),(2,'Melón','fdkjnsf987423nklj',10.00,4.00,2,1,1),(3,'Camote','dnmsa9d93whndojkw',2.00,1.00,2,1,1),(4,'Palta','dnsaidnas8dnlanm',17.00,10.00,1,1,1),(5,'Maní','dñasmd9swdsja9sdn',20.00,13.00,3,1,4);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productosmascomprados`
--

DROP TABLE IF EXISTS `productosmascomprados`;
/*!50001 DROP VIEW IF EXISTS `productosmascomprados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productosmascomprados` AS SELECT 
 1 AS `nombreProducto`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productosorden`
--

DROP TABLE IF EXISTS `productosorden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productosorden` (
  `idProductosOrden` int NOT NULL AUTO_INCREMENT,
  `idOrder` int NOT NULL,
  `idProduct` int NOT NULL,
  `idTamano` int DEFAULT NULL,
  `idMadurez` int DEFAULT NULL,
  `cantidad` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idProductosOrden`),
  KEY `idOrder` (`idOrder`),
  KEY `idProduct` (`idProduct`),
  KEY `idTamano` (`idTamano`),
  KEY `idMadurez` (`idMadurez`),
  CONSTRAINT `productosorden_ibfk_1` FOREIGN KEY (`idOrder`) REFERENCES `orden` (`idOrder`),
  CONSTRAINT `productosorden_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `producto` (`idProduct`),
  CONSTRAINT `productosorden_ibfk_3` FOREIGN KEY (`idTamano`) REFERENCES `tamano` (`idTamano`),
  CONSTRAINT `productosorden_ibfk_4` FOREIGN KEY (`idMadurez`) REFERENCES `madurez` (`idMadurez`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productosorden`
--

LOCK TABLES `productosorden` WRITE;
/*!40000 ALTER TABLE `productosorden` DISABLE KEYS */;
INSERT INTO `productosorden` VALUES (16,2,1,NULL,NULL,1),(17,2,3,NULL,NULL,4),(18,2,4,3,2,1),(21,4,3,NULL,NULL,2),(22,4,5,NULL,NULL,1),(23,1,1,NULL,NULL,1),(24,1,2,2,NULL,2),(25,1,3,NULL,NULL,6),(26,1,4,2,1,5),(27,2,1,NULL,NULL,1),(28,2,3,NULL,NULL,4),(29,2,4,3,2,1),(30,3,2,1,NULL,3),(31,3,1,NULL,NULL,1),(32,4,3,NULL,NULL,2),(33,4,5,NULL,NULL,1);
/*!40000 ALTER TABLE `productosorden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idStock` int NOT NULL AUTO_INCREMENT,
  `idProduct` int NOT NULL,
  `numeroStock` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idStock`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `producto` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,5),(2,2,7),(3,3,4),(4,4,5),(5,5,3);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamano`
--

DROP TABLE IF EXISTS `tamano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tamano` (
  `idTamano` int NOT NULL AUTO_INCREMENT,
  `descripcionTamano` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idTamano`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamano`
--

LOCK TABLES `tamano` WRITE;
/*!40000 ALTER TABLE `tamano` DISABLE KEYS */;
INSERT INTO `tamano` VALUES (1,'Pequeño'),(2,'Mediano'),(3,'Grande');
/*!40000 ALTER TABLE `tamano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `telefono` decimal(10,0) NOT NULL,
  `mail` varchar(70) NOT NULL,
  `direccion` varchar(70) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Dominguez',947888444,'reree@gmail.com','Avenida Juan chavez 543'),(2,'Juana','Martinez',987654622,'dfdfdf@gmail.com','Jiron calua 333'),(3,'Elsa','Bordelmar',987654322,'sdsdsd@gmail.com','Calle gamarra 1010'),(4,'Jaime','Perez',987654623,'hola@gmail.com','Calle humberto cienaga 870'),(5,'Raul','Lopez',987654323,'gfgdsf@gmail.com','Avenida San Cristobal 2010');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `productosmascomprados`
--

/*!50001 DROP VIEW IF EXISTS `productosmascomprados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productosmascomprados` AS select `t1`.`nombreProducto` AS `nombreProducto`,`t2`.`cantidad` AS `cantidad` from (`producto` `t1` left join `productosorden` `t2` on((`t1`.`idProduct` = `t2`.`idProduct`))) order by `t2`.`cantidad` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 17:50:12
