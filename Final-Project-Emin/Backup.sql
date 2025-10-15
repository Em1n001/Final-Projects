CREATE DATABASE  IF NOT EXISTS `ecommerce_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce_db`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpu4bcbluhsxagirmbdn7dilm5` (`product_id`),
  CONSTRAINT `FKpu4bcbluhsxagirmbdn7dilm5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,2000,NULL,10),(14,1,100,33,10),(15,1,1999.99,33,17),(16,1,1499,33,19),(17,1,1999.99,33,17),(18,1,6500,33,16),(19,1,2500,33,20),(20,1,1750,33,22),(26,1,100,36,10),(27,1,1499,36,19),(28,1,2000,34,12),(29,1,1200,34,19),(30,1,2000,38,16),(36,1,800,39,9),(38,1,2100,41,31);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `cart_number` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `expiry_month` varchar(255) DEFAULT NULL,
  `expiry_year` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `cvc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtpihbdn6ws0hu56camb0bg2to` (`cart_id`),
  CONSTRAINT `FKtpihbdn6ws0hu56camb0bg2to` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Bineqedi','1234567812345678','Azerbaijan','emin@gmail.com','06',2025,'Emin','0554104410','Quliyev','1009',20,NULL,NULL),(2,'Bineqedi','1234567812345678','Azerbaijan','emin@gmail.com','06',2025,'Emin','0554104410','Quliyev','1009',20,'Baku',NULL),(3,'Bineqedi','1234567812345678','Azerbaijan','emin@gmail.com','06',2025,'Emin','0554104410','Quliyev','1009',20,'Baku','111'),(4,'Bineqedi','1234 1234 1234 1234','Azerbaijan','emin@gmail.com','06',2025,NULL,'0554104410',NULL,'1009',30,'Baku','121'),(7,'Bineqedi','1234567812345678','Azerbaijan','emin@gmail.com','06',2025,'Emin','0554104410','Quliyev','1009',20,'Baku','111'),(8,'Bineqedi','1234 1234 1234 1234','Azerbaijan','emin@gmail.com','06',2025,NULL,'0554104410',NULL,'1009',36,'Baku','111'),(11,'Kadikoy','1234 1234 1234 1234','Turkiye','emin@gmail.com','05',2025,NULL,'0554104410',NULL,'1009',36,'Istanbul','111'),(15,'Vodafone Park','1234 1234 1234 1234','Azerbaijan','emin@gmail.com','08',2025,NULL,'0554104410',NULL,'1009',36,'Istanbul','111'),(16,'Kadikoy','1234 1234 1234 1234','Azerbaijan','emin@gmail.com','08',2025,NULL,'0554104410',NULL,'1009',38,'Istanbul','111');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `image` text,
  `model` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (9,'Asus','https://dlcdnwebimgs.asus.com/gain/99c0e8a5-d78b-4b1e-927d-7f4fb82ed013/w185','F15',NULL,800,NULL,'Smart',5,'Ən son 10-cu Nəsil Intel® Core™ i7 CPU və GeForce® GTX 1660 Ti GPU ilə təchiz edilmiş, hərəkətli oyun prosesi sürətli, axıcıdır və 144Hz-ə qədər sürətli IPS səviyyəli displeyləri tam doyurur. Sələflərindən kiçik və daha portativ şassi ilə öyünsə də, bu oyun noutbuku daha yüksək batareya ömrü üçün daha böyük 90Wh batareyaya malikdir. '),(10,'AirPods','https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-4-select-202409_FV1_FMT_WHH?wid=752&hei=636&fmt=jpeg&qlt=90&.v=WnVKRVRUTFVsYThXaWkydWViL1Q3YmRudmFtWnZKZ0szeGF4cDZsczlhOWU5bTRrM1hZbmw5eCtiRXdXMENIbGg5cFlXTXBPaHRzU3RjRTMyRlg3eTd0UkdMSDBFQ1ZUdTNVa3daQmFjd1hvRUpUejJXeHlMOSsrLy9ZbWFSbmo','Apple',NULL,100,32,'Aksesuar',5,'Olağanüstü uyum ve ses performansı için yeniden tasarlandı. H2 çipin gücü sayesinde, Ses İzolasyonu özelliğiyle aramalarda sesler daha net ve ellerinizi kullanmadan Siri’yle iletişime geçebiliyorsunuz.Dipnot¹⁷ Sesin etrafınızı sarmasını sağlayan, dinamik kafa izleme özellikli Kişiselleştirilmiş Uzamsal Ses teknolojisi.Dipnot  '),(12,'TUF','https://techbar.az/wp-content/uploads/2025/09/2023-ASUS-TUF-Gaming-A15-FA507-Mecha-Jaeger-Grey-3Sayt-1000x832-1.png','i5',NULL,2000,32,'Smart',5,'Ən son 10-cu Nəsil Intel® Core™ i7 CPU və GeForce® GTX 1660 Ti GPU ilə təchiz edilmiş, hərəkətli oyun prosesi sürətli, axıcıdır və 144Hz-ə qədər sürətli IPS səviyyəli displeyləri tam doyurur. Sələflərindən kiçik və daha portativ şassi ilə öyünsə də, bu oyun noutbuku daha yüksək batareya ömrü üçün daha böyük 90Wh batareyaya malikdir. '),(16,'Iphone 17','https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/iphone-card-40-17pro-202509_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=WVVFRzUzVk1oblJhbW9PbGNSU25ja3doNjVzb1FWSTVwZWJJYThYTHlrNzQzbUlIR1RvazhDRHNOQlYvM3g2dFIwdkZSSnBZYjhOaHBpM2lkYTFBUEZHTmVoMWFVZloyU3lqdmZCOUFEeDF6K2N6UFd4K21VWHNnbWZBQ3hSanQ','Apple',NULL,2000,32,'Phone',5,'120 Hz’e kadar ProMotion teknolojisine sahip 6.3 inç ekran. dipnot ¹ Çizilmelere karşı 3 kat daha dayanıklı Ceramic Shield 2. Dövme alüminyum yekpare tasarım, Pro kamera sistemi. Tümü 48 MP arka kameralar ve optik kalitede 8 kat zoom ile daha da yakınlaşın.'),(17,'Acer','https://texnomart.az/wp-content/uploads/2021/08/Noutbuk-Acer-A315-57G-15.6-FHD-Core-i3-1005G1-NV-MX330-2GB-4GB-1000-GB-DOS-3.jpg','i4',NULL,1000,32,'Smart',5,'Ən son 10-cu Nəsil Intel® Core™ i7 CPU və GeForce® GTX 1660 Ti GPU ilə təchiz edilmiş, hərəkətli oyun prosesi sürətli, axıcıdır və 144Hz-ə qədər sürətli IPS səviyyəli displeyləri tam doyurur. Sələflərindən kiçik və daha portativ şassi ilə öyünsə də, bu oyun noutbuku daha yüksək batareya ömrü üçün daha böyük 90Wh batareyaya malikdir. '),(18,'Hoco','https://strgimgr.umico.az/sized/840/918747-12940f1dee4fae12dcb444911013477c.jpg','X3',NULL,300,32,'Smart',5,'Hoco W55 naqilsiz qulaqlıqları: keyfiyyətli səs və hərəkət azadlığının dadını çıxarın Hoco W55 naqilsiz qulaqlıqları sizi naqillərin olmaması sayəsində musiqi dinləməkdə komfort təmin edir və hərəkət azadlığı verir. Keyfiyyətli səs: keyfiyyətli dinamiklər və Bluetooth 5.4 texnologiyası sayəsində təmiz və güclü səsin dadını çıxarın. '),(19,'HP','https://bestel.az/storage/28607/conversions/media-librarypB2AZZ-lg.jpg','i5',NULL,1200,32,'Smart',5,'Ən son 10-cu Nəsil Intel® Core™ i7 CPU və GeForce® GTX 1660 Ti GPU ilə təchiz edilmiş, hərəkətli oyun prosesi sürətli, axıcıdır və 144Hz-ə qədər sürətli IPS səviyyəli displeyləri tam doyurur. Sələflərindən kiçik və daha portativ şassi ilə öyünsə də, bu oyun noutbuku daha yüksək batareya ömrü üçün daha böyük 90Wh batareyaya malikdir. '),(20,'Iphone 16','https://kontakt.az/media/catalog/product/cache/a404967cc40694dc557cd869288440a4/t/m/tm-dg-sbp-1105-sm-2920_1.png','Apple',NULL,120,33,'Phone',4,'Ən son 10-cu Nəsil Intel® Core™ i7 CPU və GeForce® GTX 1660 Ti GPU ilə təchiz edilmiş, hərəkətli oyun prosesi sürətli, axıcıdır və 144Hz-ə qədər sürətli IPS səviyyəli displeyləri tam doyurur. Sələflərindən kiçik və daha portativ şassi ilə öyünsə də, bu oyun noutbuku daha yüksək batareya ömrü üçün daha böyük 90Wh batareyaya malikdir.  '),(22,'Acer','https://cdn.cimri.io/image/860x860/acer-aspire-a315-22-46r7-amd-a4-9120-4gb-ram-128gb-ssd-linux-156-dizustu-bilgisayar_650040916.jpg','i5',NULL,1200,33,'Smart',5,'Ən son 10-cu Nəsil Intel® Core™ i7 CPU və GeForce® GTX 1660 Ti GPU ilə təchiz edilmiş, hərəkətli oyun prosesi sürətli, axıcıdır və 144Hz-ə qədər sürətli IPS səviyyəli displeyləri tam doyurur. Sələflərindən kiçik və daha portativ şassi ilə öyünsə də, bu oyun noutbuku daha yüksək batareya ömrü üçün daha böyük 90Wh batareyaya malikdir. '),(27,'Keyboard','https://business.shoppable.ph/_next/image?url=https%3A%2F%2Fshoppable-dev.s3.ap-southeast-1.amazonaws.com%2Fproducts%2F75000d15-7493-4df6-8b16-06c984611d91.webp&w=1080&q=75','Aula',NULL,80,37,'Aksesuar',2,'120 Hz’e kadar ProMotion teknolojisine sahip 6.3 inç ekran. dipnot ¹ Çizilmelere karşı 3 kat daha dayanıklı Ceramic Shield 2. Dövme alüminyum yekpare tasarım, Pro kamera sistemi. Tümü 48 MP arka kameralar ve optik kalitede 8 kat zoom ile daha da yakınlaşın. '),(28,'Mouse','https://www.rampage.com.tr/cdn/shop/files/12479.png?v=1746708961&width=1000','Rampage',NULL,120,37,'Aksesuar',5,'Ən son 10-cu Nəsil Intel® Core™ i7 CPU və GeForce® GTX 1660 Ti GPU ilə təchiz edilmiş, hərəkətli oyun prosesi sürətli, axıcıdır və 144Hz-ə qədər sürətli IPS səviyyəli displeyləri tam doyurur. Sələflərindən kiçik və daha portativ şassi ilə öyünsə də, bu oyun noutbuku daha yüksək batareya ömrü üçün daha böyük 90Wh batareyaya malikdir.  '),(31,'Samsung','https://cellucity.co.za/wp-content/uploads/2024/10/Samsung-Galaxy-S24-FE-Blue-128GB-5G.jpg','S 24',NULL,2100,41,'Phone',3,'Gelişmiş 10 bit HDR kalitesinde, çok daha etkileyici bir videografi deneyimiyle tanışın. Ayrıca kumlanmayı gidermede daha başarılı olan gelişmiş uygulama işlemcisi teknolojimiz sayesinde grenli gece çekimlerine elveda diyebilirsiniz.');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'emin@gmail.com','Emin','1234','Guliyev','Emin'),(3,'emin@gmail.com','Eli','$2a$10$k1VZVrgWI.6s/K.cXlZ9qukRZ556Jn4I5f0hocTKIiw9VWg2oQIsq','Guliyev','Eli'),(4,'emin@gmail.com','Eli','$2a$10$VBw0engOg3/z0oJktvL9YuijFbehUzkUcCynC5VD1rvMwa/DwKTP6','Guliyev','Esma'),(5,'emin@gmail.com','Eli','$2a$10$1b19cCvlnLcb9AXUBSQLp.o3qPzHF13Q4tyF1by4Pc0dyFrp70J3a','Guliyev','Isa'),(6,'emin@gmail.com','Isa','$2a$10$3IUU3rb5VgxAmvkSFnm6yOpptsvvUaogwQzrjp5XHeKcdjflJeaji','Guliyev','Isad'),(7,'emin@gmail.com','Elekber','$2a$10$HVpEZMvVvfXaWriq4i6.BOS0SbablkrGSzssto8vqWXFfAiwScP8e','Guliyev','Elekber'),(8,'emin@gmail.com','Nermin','$2a$10$JsFJFFdsVXm.YjTDEdirSu1hYbXWRd0/SOflxDQjmbXppY63NWfwi','Guliyev','Nermin'),(9,'emin@gmail.com','Tural','$2a$10$GrMBbPGn4ib6mHra5So8AuCY1Ek1ZV54/uR6u/swy.xZE7/j9xp2O','Guliyev','Tural'),(10,'emin@gmail.com','Emil','$2a$10$0KrgPeVj4sCpx/ESkpn9BeGo0RzTxIhue.0WRG8XffnkWOk9Hz2dG','Guliyev','Emil'),(11,'emin@gmail.com','Azad','$2a$10$OSU5AbcJw2PelLHIi7M36et7.ZlQNwswC1gBi4PpjNlJotfq5bWxa','Guliyev','Azad'),(12,'emin@gmail.com','Esi','$2a$10$.qGyL8AzLO.o/MhEcLPge.cAb0NzabMa6wKcP/QOr6ya.5m9YkBpa','Guliyev','Esi'),(13,'emin@gmail.com','Elsen','$2a$10$NmJEHCDsiFFLT21Zsj/5PuZ9pvwxXPDILms3BWAx2ZFcY3UL4S.B.','Guliyev','Elsen'),(14,'emin@gmail.com','Elcan','$2a$10$jATmEwCk0dsEKMbFT7IvfuJUQefUGejqgBoIsoOPtmpBey1xZFLU6','Guliyev','Elcan'),(15,'emin@gmail.com','Elvin','$2a$10$i3KFo59rOJbEVrk.obvPhuBVHjaIeFXmKa.UI9IAgmXPJStJIg.Km','Guliyev','Elvin'),(16,'emin@gmail.com','Tunar','$2a$10$bL7vWWwS27pgzWqnE1u8B.IrsvFlha8iqbXGLiJaqQVYRkCeIYD/C','Guliyev','Tunar'),(17,'ilham@gmail.com','Ilham','$2a$10$yKv8aECx5B3lNgE1K.Y5H..YTifFg88A60a3T9LRy3uvGYuTIfqCa','Guliyev','Ilham'),(18,'xedice@gmail.com','Xedice','$2a$10$65A3evbp2MPn63BY2TwQreSZZLG9g2R0f.C/2kqObS4ktlloHZMn2','Guliyev','xedice'),(19,'vahid@gmail.com','Vahid','$2a$10$l9l9gTlcuMuQIhJu.wJf..HKFF1mM72CLnzLEBFpsH.BX.wH39AXy','Memmedov','vahid'),(20,'nermin@gmail.com','Nermin','$2a$10$y0Cx1GrzVCFR0kjPZY82terkmDrtGZ5WHYNf.LhgZqrpvPaIC1Ot2','Memmedova','nermin2'),(21,'emin@gmail.com','Emin ','$2a$10$Erx/NmDflft94lZ1ggY8Y.ZQNndL2Bi1dR47OMgbagKZmS8fhcUfm','Quliyev ','emin1'),(22,'emin@gmail.com','Emin ','$2a$10$tImaIVm08kv7UfMz/G74quBC6h7kf2Zgw5mFModJlBONOWgoLDTc6','Quliyev ','emo'),(23,'emin@gmail.com','Emin','$2a$10$hj5nxzyvtrD.7v9uhZhe/eMTvCSGTb1Pd7MLlWxUYtQkScFfkyMWK','Quliyev','emin12'),(24,'emin@gmail.com','Emin','$2a$10$NvPQurniJCAcU9jww7H98eKavmNC27qmKYmSPlVZyk.M3L6tyhdGi','Quliyev','emoo'),(25,'emin@gmail.com','Emin','$2a$10$3G2um7YLs1iYCtrDsOYFb.QqOr.eEZ/yhSjQ3MoA3Bh7C9b0DgdK2','Quliyev','emin13'),(26,'mahir@gmail.com','Mahir','$2a$10$j672X0SP1/0TLxt8TSzeouCtOpQwradS0JgqI2QNuPVUsBcw4yE1O','Guliyev','Mahir'),(27,'azru@gmail.com','Azru','$2a$10$8ZFzV0hyIX09hxfjPWDLjuCR88cPKu8wA7VnHBQQyn0lIvmOsfG3W','Guliyev','Azru'),(28,'mehemmed@gmail.com','Mehemmed','$2a$10$lhxXQVmY5uHykDP/zTSl2.8BPZj4L00.1DX6XXij4HDqCdjmcfSoS','Guliyev','Mehemmed'),(29,'emin@gmail.com','Emin','$2a$10$7UjyVq4YdjWqdZOsLYpuKOUS.Bg/YIVjn4SPUY1ItpJ89CpZ2CMr.','Quliyev','emin123'),(30,'emin@gmail.com','Emin','$2a$10$uT9NTluXY66jU.eutY/BfuY4ZOe3p5Yj1.WpI2DX.sjbFqj7fvlTK','Quliyev','emin111'),(31,'emin@gmail.com','Emin','$2a$10$Bo9e5m1u6ob1/1MW6Qm4Aucctw2RIYXtnNVH32cjVzbGjMb4LQdwy','Quliyev','eminn1'),(32,'hesen@gmail.com','Hesen','$2a$10$nWEEYvJsDgSCFYF2CW1j1.bNLE3MWk/vQ0CLGn6Ok4VnOS6gQlEk6','Guliyev','Hesen'),(33,'emin@gmail.com','Emin','$2a$10$bydV1lE1XGMhKzBtooZqbuMsddIO2l2GkYtnQl6q/kL6anIdUNPcW','Quliyev','emin11'),(34,'emin@gmail.com','Emin','$2a$10$NhebWZu5WtQ.Oe0UAiYZe.4LnX/zPhbexdh8Zw0jUbU41wc2Plk/m','Quliyev','emmmin1'),(35,'elinununini@gmail.com','Elnare','$2a$10$iOloCbsp.GFIXm5MZ4skb.0jWkpUcyIo15sKFHe5Zz4XFNUmPT8q2','quliyeva','  ruyatam'),(36,'elinununini@gmail.com','Elnare','$2a$10$TpORWXZAAWSnVUs9yb0JzO.1/LJAdI8eii6loDCZv6gzyLjvvw8V6','Quliyeva','ruyatam'),(37,'emin@gmail.com','Emin','$2a$10$KY1DkXpIkZYS/102qlHeueiV08y5upEgWfxPUZoe1oOCRYWDatDZy','Quliyev','emin15'),(38,'emin@gmail.com','Emin','$2a$10$OUIwFiB.VBqeZlemCbaWEerK1j7G91ShnKw1Jn.hStAXq5zNKx2Y2','Quliyev','emin122'),(39,'emin@gmail.com','Emin','$2a$10$TTJdF3wuth9Ig1G2sdCZyeD1AdF6znFAZn7RsW95iP1iMNewmJC.y','Quliyev','emin133'),(40,'emin@gmail.com','Emin','$2a$10$DVZhNNnYoAYEf9jPHWoPeOY8XOS8GND/3kCWVOet5LgoZRfp1q.J.','Quliyev','emn1111'),(41,'emin@gmail.com','Emin','$2a$10$cemiswXvbTw9HPVbXphp7.PieJKDJO2deQnPBk.mMNfqOiDPLkwGq','Quliyev','emin11111');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 21:04:38
