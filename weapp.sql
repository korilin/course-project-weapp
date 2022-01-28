-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: course_project_weapp
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `nickName` varchar(45) NOT NULL,
  `avatarUrl` text NOT NULL,
  `content` text NOT NULL,
  `timestamp` int NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'korilin','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoexT7qQqmeKf75mBXhMoAkLS0ricsOzPVNcYzqdhpmsnIoWtBvBibhl6bKtzBKc07kFk5Pn8lVL2AQ/132','评论发布测试',1633800523),(2,'korilin','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoexT7qQqmeKf75mBXhMoAkLS0ricsOzPVNcYzqdhpmsnIoWtBvBibhl6bKtzBKc07kFk5Pn8lVL2AQ/132','bug reappear 测试',1633800532),(3,'korilin','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoexT7qQqmeKf75mBXhMoAkLS0ricsOzPVNcYzqdhpmsnIoWtBvBibhl6bKtzBKc07kFk5Pn8lVL2AQ/132','debug: Toast bugfix',1633801492),(4,'korilin','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoexT7qQqmeKf75mBXhMoAkLS0ricsOzPVNcYzqdhpmsnIoWtBvBibhl6bKtzBKc07kFk5Pn8lVL2AQ/132','Toast 效果测试',1633802188),(5,'korilin','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoexT7qQqmeKf75mBXhMoAkLS0ricsOzPVNcYzqdhpmsnIoWtBvBibhl6bKtzBKc07kFk5Pn8lVL2AQ/132','Toast Emoji (≧∇≦)ﾉ',1633802304),(6,'korilin','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoexT7qQqmeKf75mBXhMoAkLS0ricsOzPVNcYzqdhpmsnIoWtBvBibhl6bKtzBKc07kFk5Pn8lVL2AQ/132','线上服务部署完成，手机真机评论测试',1633805420),(7,'korilin','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoexT7qQqmeKf75mBXhMoAkLS0ricsOzPVNcYzqdhpmsnIoWtBvBibhl6bKtzBKc07kFk5Pn8lVL2AQ/132','本小程序技术栈：\n小程序采用 Taro 3.3.9 + Vue 3.0.0 + NutUI v3.1.8 开发\n小程序后端使用 Kotlin + Spring Boot + MySQL 开发\n项目相关静态资源放置于个人服务器，使用 Nginx 代理访问\n目前后端 20211010 版本已采用 Nginx + Tomcat 部署到服务器',1633805751),(8,'哄哄','https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5vHianG4EvvjErwSDviclVpwYXlw2TdJmd6klj7OzlOAzovcaicnMYILmF7MG3J5geqoHCaJCWvE6hA/132','这项目我王多鱼投了',1633941961),(9,'Fake','https://thirdwx.qlogo.cn/mmopen/vi_32/iaPp7ClZOGcqPjQnvYvJIOTaibWgoONw1raSqmCejJ5jop4CpMu6tf1l4DJwHCMR5xJS5tBXrSBQ2iczhedDpn9iaw/132','有没有这种可能，korilin的小程序根本没听课，全都是自学的。',1633942901),(10,'6Yi。','https://thirdwx.qlogo.cn/mmopen/vi_32/X9BAVjG43pAg6wVQIJWLjgiasEfxY9tZS5H1SrJb6TE7t8Z5icSruRZtsGvwEbH69U5RYKeficdqYxE3vYaqUxwnA/132','洁哥不要啊',1633942968),(11,'Mzr','https://thirdwx.qlogo.cn/mmopen/vi_32/745IjER2pCAoK6iaeMAbicWNEqWx5CV2bBiaE9zICXwkIeGd4kpuV3qicyn5NNbGibxSWkyQfKMQibmdGFCR92yYq8bg/132','1',1634019383),(12,'korilin','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erAxc3Cj7Pia3IShcSt3EUwYS9y0QuzlnIMrhxogQy0a6YsibAoayXxmFib5HzTmRKPMafXL3rbUEb0Q/132','@Fake 我不是，我没有，你别瞎说',1634019479),(13,'korilin','https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoexT7qQqmeKf75mBXhMoAkLS0ricsOzPVNcYzqdhpmsnIoWtBvBibhl6bKtzBKc07kFk5Pn8lVL2AQ/132','评论演示',1634376386);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_list`
--

DROP TABLE IF EXISTS `info_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_list` (
  `sort` int NOT NULL AUTO_INCREMENT,
  `key` varchar(20) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='信息列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_list`
--

LOCK TABLES `info_list` WRITE;
/*!40000 ALTER TABLE `info_list` DISABLE KEYS */;
INSERT INTO `info_list` VALUES (1,'姓名','林洁彬 / Kori Lin'),(2,'学号','201835020822'),(3,'班级','18级软工8班'),(4,'微信公众号','Tech Kori '),(5,'Personal Blog','https://korilin.com'),(6,'GitHub Link','https://github.com/korilin'),(7,'Email','korilin.dev@gmail.com '),(8,'社区建设','深圳 Kotlin User Group 组织者');
/*!40000 ALTER TABLE `info_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_record`
--

DROP TABLE IF EXISTS `photo_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_record` (
  `url` varchar(100) NOT NULL,
  `title` varchar(40) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='图片记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_record`
--

LOCK TABLES `photo_record` WRITE;
/*!40000 ALTER TABLE `photo_record` DISABLE KEYS */;
INSERT INTO `photo_record` VALUES ('https://korilin.com/share/01.jpg','我写代码的样子真帅','为了技术部花费了太多心思，从前端到后端，从规范到跑路'),('https://korilin.com/share/02.jpg','2020 年 Google 嘉年华 Kotlin Day','这是我第一次结识了 Kotlin，为我之后参与 KUG 社区做了非常重要的铺垫'),('https://korilin.com/share/03.jpg','2020 年 Google 嘉年华部门合照','和崽子们一起参与了东莞 2020 Google Fest，可惜没能人均一件活动礼品衬衫'),('https://korilin.com/share/04.jpg','圆圆师姐毕业','~ 毕业快乐 ~，希望今年拍毕业证不会被丢下水'),('https://korilin.com/share/05.jpg','部门考核期合照','2020 年技术部新一届城院考核期时的线下合照'),('https://korilin.com/share/06.jpg','黑网吧∑( 口 ||','2019 年技术部考核期集体学习照片，我忘记布置了什么任务给他们了，他们在食堂肝到了半夜');
/*!40000 ALTER TABLE `photo_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seminars`
--

DROP TABLE IF EXISTS `seminars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seminars` (
  `sort` int NOT NULL AUTO_INCREMENT,
  `titel` text,
  `description` text,
  `imgUrl` text,
  `pageUrl` text,
  `source` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='往期研讨会';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seminars`
--

LOCK TABLES `seminars` WRITE;
/*!40000 ALTER TABLE `seminars` DISABLE KEYS */;
INSERT INTO `seminars` VALUES (1,'[JetBrains 网络研讨会] 快速上手，使用 Kotlin 把支付宝小程序装进自己的 App','本次由 JetBrains 主办的 Kotlin 线上技术沙龙与蚂蚁集团合作，邀请到支付宝高级无线开发工程师温盛章为大家分享如何使用 Kotlin，将 mPaaS 能力装进自己的 App 里。听完这场分享，您不仅能学习到用 Kotlin 开发的 App 如何快速接入 mPaaS，同时，我们将带您了解 mPaaS 小程序如何帮助您实现“代码仅需撰写一次，便可多端投放”，从而深度提升研发效率。','https://i1.hdslb.com/bfs/archive/fc69290eb5b1a5f957609379d620ae741cc57cc5.jpg@320w_200h_1c.webp','https://www.bilibili.com/video/BV1554y127vb','bilibili'),(2,'[JetBrains 网络研讨会] Flutter x Ktor 打造跨平台全端应用','本次由 JetBrains 主办的 Kotlin 线上技术沙龙邀请 flutter.cn 社区的鑫磊与圣佑一起进行分享。在这场分享里，鑫磊将会带着大家用 Flutter 编写一个日记的 App，而圣佑则用 Ktor 实现一个后端 API，让大家可以亲眼看到从前端到后端的整体开发流程。听完这场分享后，您将对全端开发有一个基本的概念，打造跨平台应用更高效！','https://i1.hdslb.com/bfs/archive/4f2c865bc2fad37564698b0e1c024927a7125ad4.jpg@320w_200h_1c.webp','https://www.bilibili.com/video/BV19v411k79v','bilibili'),(3,'[JetBrains 网络研讨会] 以 KMM x Ktor 打造全平台应用','本次分享由携程机票移动端资深工程师禹昂及 JetBrains 技术布道师圣佑两人合力完成一个 RSS Reader 应用，演示如何用 KMM 及 Ktor 两个框架，从 Mobile 到 Backend 打造全平台应用。通过两人的演示，你将对 KMM 及 Ktor 这两种技术有更深入的了解。','https://i2.hdslb.com/bfs/archive/cefb1722206c2200778f237b030e3e2c2a52edd6.jpg@320w_200h_1c.webp','https://www.bilibili.com/video/BV1Dq4y157q4','bilibili');
/*!40000 ALTER TABLE `seminars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `sort` int NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) NOT NULL,
  PRIMARY KEY (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Java'),(2,'Kotlin'),(3,'Python'),(4,'Android'),(5,'Jetpack'),(6,'Spring Boot'),(7,'Vue 3'),(8,'Vue 2'),(9,'Vue CLI'),(10,'Ktor'),(11,'Flask'),(12,'Taro'),(13,'MySQL'),(14,'Redis'),(15,'Nginx');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-22  2:13:03
