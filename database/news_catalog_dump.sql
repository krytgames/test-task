-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: server1C    Database: news_catalog
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Current Database: `news_catalog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `news_catalog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `news_catalog`;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anonse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorID` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_authorid_index` (`authorID`),
  FULLTEXT KEY `articles_title_fulltext` (`title`),
  CONSTRAINT `articles_authorid_foreign` FOREIGN KEY (`authorID`) REFERENCES `authors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'2025-10-11 05:33:34','2025-10-11 05:33:34','Test1','anonse1','woefiweoighweiojrwoeighwioejfioew',1),(2,'2025-10-11 06:48:14','2025-10-11 06:48:14','Test12','anonse1','woefiweoighweiojrwoeighwioejfioew',1),(3,'2025-10-11 14:13:56','2025-10-11 14:13:56','Test12','anonse1','woefiweoighweiojrwoeighwioejfioew',3),(4,'2025-10-11 14:24:56','2025-10-11 14:24:56','Test12','anonse1','woefiweoighweiojrwoeighwioejfioew',3);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_categories`
--

DROP TABLE IF EXISTS `articles_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles_categories` (
  `articleID` bigint unsigned NOT NULL,
  `categoryID` bigint unsigned NOT NULL,
  KEY `articles_categories_articleid_index` (`articleID`),
  KEY `articles_categories_categoryid_index` (`categoryID`),
  CONSTRAINT `articles_categories_articleid_foreign` FOREIGN KEY (`articleID`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `articles_categories_categoryid_foreign` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_categories`
--

LOCK TABLES `articles_categories` WRITE;
/*!40000 ALTER TABLE `articles_categories` DISABLE KEYS */;
INSERT INTO `articles_categories` VALUES (1,1),(2,2),(3,9),(3,8),(4,9),(4,8),(4,11);
/*!40000 ALTER TABLE `articles_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatarPath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authors_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Зубенко Михаил Петрович','mafioznik2@mail.ru','images/68e9ec0ba26f3.png'),(2,'Зубенко Михаил Петрович','mafioznik3@mail.ru','images/68ea5fb195a48.png'),(3,'Зубенко Михаил Петрович','mafioznik4@mail.ru','images/68ea65aaa0e60.png'),(4,'Зубенко Михаил Петрович','mafioznik5@mail.ru',NULL);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parentID` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parentid_index` (`parentID`),
  CONSTRAINT `categories_parentid_foreign` FOREIGN KEY (`parentID`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Машины2',NULL),(2,'Машины2.1',1),(3,'Машины2.1.1',2),(4,'Машины2.1.1.1',3),(5,'Машины2.1.1.1.1',4),(6,'Машины2.1.1.1.1.1',5),(7,'Машины2.1.1.1.1.1.1',6),(8,'Машины2.1.1.1.1.1.1.1',7),(9,'Машины2.1.1.1.1.1.1.1.1',8),(10,'Машины2.1.1.1.1.1.1.1.1.1',9),(11,'Машины3',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (40,'0001_01_01_000000_create_users_table',1),(41,'0001_01_01_000001_create_cache_table',1),(42,'0001_01_01_000002_create_jobs_table',1),(43,'2025_10_10_091648_create_tokens_table',1),(44,'2025_10_10_102720_create_authors_table',1),(45,'2025_10_10_132436_create_categories_table',1),(46,'2025_10_10_135338_create_articles_table',1),(47,'2025_10_10_140835_create_articles_categories_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0593xHlYOY6jqute0VPCksRTeBbQrDpZOl8ykAYg',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoidVlQdFVPTkthcERsSkpXNUJCc3U5Nm1pR2MxWmVKckZKejJ6dWVMSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0yJmluY2x1ZGVTdWJDYXRlZ29yaWVzPVkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760192715),('0URNAHIeq20D6LdFxg8kxluce0KB2EyakxrXJBYb',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZmd1ZGNHZ25La2dCOXE5MU1RWktkb0dDTHFCbzZzb2owQWJycG41OCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760190594),('1QwFSFOZEv0AHiMHT7CRnm4Kts5mrRCKUHVsdB9Q',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzZBTG9KN1pTN1JiTHhXaHI0RHVHUVJUT3lLbTNXbU5YUE9sTkZkZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0yJmluY2x1ZGVTdWJDYXRlZ29yaWVzPU4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760192802),('2kd3Qyw8hyP20mEu7Q3xYpDwKnylaMZUbO00QAqm',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiRW9qNnlIeU94c2NhU2o2cVJwY2I4eUJ5Ulo0VnJIVnJQMkxHWnFPdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760188940),('2nh8o6ne01siOMYr3gXB4VvzP8g0Kl439ZMn4e6O',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzR1SVNEbVRObWhCb1ZTTWZucnh3cmE2N2V5NVpYZWpZOEdudE1veCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760163165),('33bC9TbshdeZuCi3PvvHisEKbwsoOsDsfedMT9s7',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQldMQVZpQW14Qk10NlZ4U2FBOTdMMTc2VnVNR1UwWW5GYlRka2tYNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdD9wYWdlPTIuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760191733),('3dKUuc2LeimtpO2Eul55QMFQnZ4j8pYnlyd8UsjH',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVVQYXNOU0psY0dTMkFGVzljTExSOFY3aENLWlgxWWxEa05FWDN6VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5QXV0aG9yIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191823),('3oWwiUbKRGPnA3LQQMsgEW22gHKcElMAedcxAWH4',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiRTJCdHZoWUE3a1ZPS0dodkJRZHlkTE5VbGI1QmVaMm01aXhjQ0pENCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760190386),('4oHCavpnyoJ9MG785eQjaeCizzRFgLgiWD2US3do',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0lYMnVhODhab0lHOWp3U2ZoRW1GRkNaSm54Y0lFM0VtaXhFaW1UeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5QXV0aG9yP2F1dGhvcklEPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760191440),('4VINMwPUNrfYqo7xsUBdx7gWqQeFWyKnKQgbPj1y',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoibmNzcFFwajFTNzR1MWFiNXlldjJLc1RKVHhieG1neERtRk03NHZRaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760192006),('59yHYQMpHuiazy5JNyplcHEAbbqMykYf0LawCfXE',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoidnpQN0VhbXlwZGJFZzVGbUN5ZWdVOEtBZmRRWldsUm0xaEJreFlLMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191966),('5m5HEV9p4SRp1TVmhlCqfQ1PpnxqsGBwKmbSo1hk',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk1ibXVEM0lEUTM0SGptVXlQaVIwblFXT2VGOFNsYTlWSFRwNnFZQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0yJmluY2x1ZGVTdWJDYXRlZ29yaWVzPVkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760192110),('5mSX0JXkieYXcaUipN0g6TL08rv57So96AhKwrn4',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiczMxOU1ZaFNraEpLdW5vMmVXQ3hPRmdGbThKSnlBMHhCQXU5NnEzcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760163346),('5U5Oglt0IWYk6muoVSU2d20ChBadrdgGLpoUWLX4',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUW9Nc0REdkxXNXVxbURBVzVtaHFacHpwSkIzRW1SRmlWa2JHdWY4biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760161447),('9C8PV8tp90LhbFylBX2etDI5RyCb6Qq7nKi34ZNk',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoibVJIdDAydVZTc05JTUhxUTZMQUpIS085YlhMNHBwQnprN051ZlRGdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760194335),('9cxtn5R0wGi611jrtTFPxZyLWMZFL9OYLuA8Axur',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQk5xNGlTR3cyY1hnNWcwOW1sclNNY2VRZVBQSE82MHdkQTZHaDJseSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191922),('9ZUqLna6BrQra1uW12QtAucsOpCsZEc62t2b8O9u',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoibzNGaUkwbmFIQzVVaVNnZ05XcVVzdTFLU1Y2MVhVZXhNcEhlYjFKSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760194063),('BLFO95PGlOSU6u5bi59o6lks23p1AI7z71xFYZd6',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzI3NktEam5mVFI0ak9TYzNaTFJteGt4RXZJTXBFeEkyTkFPN3RnMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5QXV0aG9yP2F1dGhvcklEPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760191266),('bouhl2B2GSf2V0wkMCEUlG8SqRRg2Tkj0teKJDKj',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiYXJxVFNha1phRDV2SHFWb1lUTzRvR0o0dFV0ZGdUQ0VteGpsVGVNVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760192666),('Bs9OKTCzds2A7TthNDUHpzXC5xgeuMvQW1QJWR1U',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXdZeWJnTEV5Sk1sRXRxdHFrYVBtVTZ2UGRHdm5oYkVQZlF1VlZ3RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760162886),('BYXi5Ew06Yrx3gJvyLffTeVgj1F2DYkYS7vCrfXu',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiekRFU2ZDY3JnUlZDQ2pjVzNsTE9jVHBtbWhWRjdpcm94U3NoQjRTciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5SURzP0lEcyU1QjAlNUQ9MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760194891),('C4B2k2kyicduTDJzYI5tMFcbOiAGnnjnnEZRMJvv',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSW52Y1Q5cDVNWVREZ0p2Nk9GSjcyS0RGaFdrSnpLYmxsYTg5Z2h1TyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191946),('cAzeJ8ifjNAfQiglUzn7Dx7dUv42Emrn0mpbaR6G',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTRIZjRnNWRVS1hzU1VVZ3ZpdzZMOUZVa1ZuTFR0aEZmQ3pweXFnZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760161755),('CmSFKxUH4Ox0mInns2XNbyT5gay5j8CvdVX9QvUp',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGR3dHRNbTF3bHhYREhRVTBzZzFUTUUybXlSRDdBZ1Rob2U4ZEIyQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760161235),('CtcPLDcJ86BfkMn997eJto7MtSab5PwG7FhXXhj2',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWNMRzBOSkhKU3hYeU1pM1RmMjEzbTc0WXVDclh4RUVLN3JLTkJ0NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760191718),('d3fCr3WpyuQhfrTmKBVHuea6lQU1c0LRLXjOPJcb',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoieFFNZUlSYm1OdHhGSW1XcGNueUx4dVFKQmpLd1g2dnEzbnpJQlpCaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760192013),('dAAF0PF6Bd5aq5Am3avm5mBl8tkD9603dcJRjtxt',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiT3RqbHV3NWYxRFFaQ2NGS0d2UXljY3g4UmxqemVxRHdYRGtlaExkUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191985),('DNYxPC8bNTAiGLmbkeZYtqASjWDr5Wf99u8r4sjD',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoia29neUJWekhZUEp4T2ZEUks2b1BxTDFWVUhUaEFXY3FkUDVSa1U5YyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191926),('DPEjEVrJdAhmFx1i1fq7VQuauUv8ecQZzG41GJw1',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiT2o1QUU2RkQwWGo0b2xOV0hyTnpCQTFWcDBZbWo1UVRtek1oQ2ZsYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191944),('e0ZcdSbdm65L0KQGxhSqBSUKMokgU95e1PvGoMUH',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoidWNjTVpybXlyTzdBM2RQTmVqU01mVGprN3cwWWJJR2JoV25BY2ZnUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191990),('e8il22rvyNHeKbsko8zr4KJ7C0WA18kX76j4m2Mm',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMFJXZnE2OGRicVZIRFVtS0RlS0MxM1pVd2pnTTlsdXpkS3BlTzZRdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760160692),('exHVuFvq56h4c9HHCAF1oQ2YXNYcfvkRXfrnmYqh',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoid2psQWUwaXljQmV3TjBUbVZrbVhjUHlwYlBxR1pWWFd2NThsUHkxZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760189441),('F7XpuVac7wRAN7G54K1NE9Z76QBwhQBSTMspkxmz',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzRpVnBlWmxQSncxT2U5bTczRW9iVktHNUcxUjl2dHpyNWx4SkRYRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760160823),('fm8SG0SmrnmdxsR0WskO3WVbAqnxsgDzr2eetb3J',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUR3ZjJVOTR5bjk3alZHN08xaXpIRHFCbnFmVUlVbXI1ZjB2QXBBdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760161888),('Fn3dGluB1Z8M7rpqA4bhpEtI665XytBAnTM3slPw',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkpJc21yVFRDUVRmRW9yQ2xZQXZ3V0dJUnlYU0NZdGV4RjVReWVTYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760163258),('Fn9JNeA6DdNVZhdY5gAMH2eelpb7VS4hIv6nACfU',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoienh0Q09BdzZnVHhZM01CY1RwWnpKQm5PbFkzNThaT3BoTXNkanpiSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191918),('fthmcYfH6BV4FQVizgutWCw4elhIQfKxpKeHMgS8',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU1yZkowWDc3QUI5aXBLYzlpOTRtSmxnakpsVlZkbEZHVEViaDl6NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0yJmluY2x1ZGVTdWJDYXRlZ29yaWVzPVkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760192211),('FZzh6S64fnV23beLPwm59wDXGihx9EcqKEPCWjbG',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoibG4wbXppZU9DellFeG5hREdXT2hGV2lLbDJmbkhYNmplRWtvclJlTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760160814),('gwUrsUJNeiDmWgm622jGAagyk1QrYzGcWLjboDb2',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0d1V2Z4dGo3M2FHQnZqMEtuMWhnejhNMHZUR3BOYjVtWWdjSGlnMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdD9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760191739),('H4z37LBB1VRQmIF0qqynXoaOwuxr95w4HUMtg5gR',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoibjJqWVZlTzNnVzE5NmlpbDgzU2kwQ2h4VENrbUhDZzkxWDBIZzlqRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5QXV0aG9yP2F1dGhvcklEPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760191088),('hd9hBUSo2q9hZJIYBNgci9Pa2C5tWtZeiwosXKpl',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzdpdUJMWDZTTWRQc1hzaURlUE5yMEE4Y21pMEhpMnNtalMzNHhxRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760161865),('Hr0KX55YQQIUPtCsfpgrvQDhvbJrq5ej7f7niz5f',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZTBZSlpqcjF6djVCY1BnWlljaEJJWGh0alJNN2VqcXg1ckxHOWJvVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760189041),('hYR5iEFjkKxuQCC8EsolmFwqSGLtSESY7p9uYY82',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiY1hGR21ldGhRdURGS2tWS0sycGNGdEZlTTJZOXZXRTNKblJDZFc3SiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191980),('i7B1JhWIMfx7cAv39j5gixomslNQbTXMvyN5ALKD',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoidmN6dDJxYmlPc1NxOGh3cERpUUhVNnRET3dWUWxxMWpSUjhldE9lViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760165272),('iC3reneXyLS3Ql9nQSpTRlLFpAOyyZ9OQMLaOuJ7',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0h1aFNzbDFGdzBhVlRjRENaTTgyQ0RlbE5oazRISTlFSkNUcWRBTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXN0MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760160846),('ifciB9iEBZE9nXDa2y2njeMpSilsnJdvKm7PAhT7',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkU5T1pkOFZGVGxVTU0yTTNZSHU0SXljSEVkeG9KTXFKOUhIbXpTQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD05JmluY2x1ZGVTdWJDYXRlZ29yaWVzPVkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760192050),('iSJJkDNI3KNGhHQ9DcAhW6t6ZxUQiuy4xnFDxPUy',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFlQdUNKR2tuc05IVXVqUllJZ2ltTjRmc2dhTkQxQm1TY28xR2pINyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760163388),('jZGMfA2eESUUjRTKBUEZkavVqfoIUFQsD7RUnlm2',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoia0s2MjdlaG4zSXNZTUhEUTlLS3YwYjFpdGQ4OUZFejlGQ2k4ZGdvVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760165852),('KeDSYFhhScni80E2jknyQPCAv6GUFFeBxQUxjKfY',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2xnVWM5NHgyUjNyNDlrUjFFbncwOUJydnhTdHRtUzhSTm93QWJjMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760163069),('lxAPWbZltejNB1EJjFN3gm8paRlGEkR6o2dXkmPP',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWk0R2RtZmdoV3hDUXVXb045OWRGMjhxemt0Z3NmU1M1eE9MQXJuSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0xJmluY2x1ZGVTdWJDYXRlZ29yaWVzPVkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760165337),('M4CNiibP14yDSUc6AhW7OamEFm7SZNibqmsqtwNI',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWTMwUEgxakhvOUppbFFTeG5mTVZFMnRLWmpTYW5FdVhxdUU1UlFZSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191973),('M9fd5lcRV1dcz6xsIaLn6yE47qQOBZIapq97el7c',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEhjSU0xMWhoNWVCNXBlY1UxYkNBYmEyRTJNU2JlVVJ2TGZZRXp6QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760165246),('mnCl4rH4q5r88iTv6iF4cosPUzD0XNMeHsLhpEeR',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaU04NXkxVXRYMFd5RVp2SW0yakpuMkRqN2pCY01MMExhTFI0a1phRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0xJmluY2x1ZGVTdWJDYXRlZ29yaWVzPVkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760165491),('mPpb7uOXz3KoV3TS8ggzRczRMJD5EnTyGZSMN9gm',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU01rTFBIQmg2QTY4eTNlNzFKajBoOUdlSTRTOHNoYzhEZEtLSmNabSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/SURzJTVCMCU1RD0xMCZleGFjdD1OJnRpdGxlPVRlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760194706),('MsurnxNsS2Py0iDlyD4R3HV2FITQ0mYrWGJGQ5Zo',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0lzaG1KeVF3R2pCUHVuSDJ2YVFXMDBSNUI2dEhWaEdTMXlrYlhQdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5QXV0aG9yP2F1dGhvcklEPTEuNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760191833),('mYp0s0D9lMwIEEpzMO0IqE4wXB2W50r0ZOgPTzUo',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoidno3NzZQZE9vSUgyQlU3aXdRdE5HSzI2ZEtFMnhTSVBMbmJ4RHdCSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760161775),('NrfrlktTCfld8xGr030xLYIJKDpoqZaYHGmWSrQ8',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWW9WbXhSeVBvTnl3S2VEUVQ0TWFHYUNDZ2VTU1ZXOGlUajRQZWlDQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191895),('OBixwe74PWbBh7XPZGZqF1Kk6brJ3m9A1zjOgv5i',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFFOTzRTRUtpTlNUendKeHNqcFRxcExlU2RuVXRWbnZpM1hJdUhUYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0yJmluY2x1ZGVTdWJDYXRlZ29yaWVzPVkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760192601),('OeV95awPsVMBNsyJpn73aIiV2lJ7QebQyyY9NjMo',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUJTOTdyOXdLR0ZWaGZxS0VXaWp1VnB2NWRIZ1JaS2lPaWNhTDV4bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760163330),('onc0D2BSoDLvfplU8qwXyw46DLwCUvhIKa1eAsOm',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0FWbndkSkEwcHVyT09PSmxvY0EycWw1T3RUaE1qTkRYRFA2Tml4MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5QXV0aG9yP2F1dGhvcklEPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760166665),('oQq7JlxHy5yVPIIMsX0mVcgBoIItOJ31Ss7sFUTj',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMHRFRXN3ZlBuV0Fmb3MwcTBpVEJhbFF4d3p2QUU0bVRmYlV4emcydyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760190582),('oRVZ4XDf5rvpDPg6386efpySjwy1ew2sAO2MzQhj',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoid21CRkRQOFYzbzVPUW5TVzdMR0c3Mmk2dGVucWdLa0pQYldUcnRZZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191943),('OsqBG9LNW2BDYBP8MrMhRKyaEHFE0Ugr5NuBzawk',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSTJqZWFJSFo1bE01QXY4WU92cWdHRTNEdTBySTJhRHlJcjVoazdGSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760160781),('otDXB9AGNQp11PX3uRfJ6lUOvjwFBnR8lHNQdbs1',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoicTRNMnhGTmtZaXF2VG9wU0toTUdXSUJhcXkxbEJFNDRWQlZPVVRrWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760161217),('pK7CdyU3B1PdFvYcXRWLwdBKNYb6EkqkrYPqqQCW',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoibkxHQ1pBUUZLbEpqVnVqYlpxaEY1V3FxY29BaUo5Z0QxM3JSamdlQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191886),('PtEVaDMsJgjNEZrbWrxQPFPKdmHjhrxYyCY4AIMt',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3M4Y2swR01pVGZqcjBNMVNwUEJTOWF2Rmgyd1lDTnlWbXFvbDVsNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5QXV0aG9yP2F1dGhvcklEPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760160836),('Pyh1qCNFYQtvec88pAqvLvn4i8qXHNOLzYxqHqyk',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZmxDOGFPS2NLRm5qREEza0M2NTdHams2cHhuNnc4V2ZickRPTlJzSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760192696),('Qjl0iZmGbYIjK6nR1Z7UvhdHGDaA1i5Cwmacve0x',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3htdzFUYWIyVWY2UTJwamtPTjQwUWlBb1Z4V2Z5c09QaTlkNlNiTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760160885),('QPmeFcJg4ZEMg61qxSDPiEkrk4rWWYKiEdDATRU9',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoieDNXUVFLbmU1SkVCRDBiM0p1dlVQdUtTMGZFT3V3Z0swQlhONEt3byI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760192037),('qrV57SbQSr5SAs7IDTgZtMhFiWCyLZUjAbuFwUfB',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSzNOeGxOOVdFWWZ2Uk54RmpLbmJBQjFudWtlWkFaNHM5eW5YQ29MMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191914),('qYtzl6AGjvYOqnX1v9cUACt6fPCKKR22KaZuvw6L',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoib2hoNVgwOHZEUmo4MldqS1VFcUk4aDRPTlJCSUExSnp1ejdsMWVzRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760192676),('R9h0PvKgW1iykvOHYVC1HbQVG3qarnt4dguFuOzv',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoieU9aNmhjQ3BmNUt1RkZTdUR2ZGRIcFBEcHhBNXE5QWxCYWtDbTVOWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5SURzP0lEcyU1QjAlNUQ9NyZJRHMlNUIxJTVEPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760190877),('rbxEfAivJ4yv1LPqFsGmobQkbPSClKDLs4hnzBIM',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWWZIMUE0eFNsWUdqRnJGUHlwc3NhOGZBbmFjb2k5QmVoeXNGNzJzcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760189662),('redy3cguuqonsVCHPh3BuNW2HThgd4ZeOYWpIiEQ',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoia0VtcncydHpHNHNlbHFpYUNPVUhJdGNwN0xxRWFzZU1LRVNKUlBsYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0yJmluY2x1ZGVTdWJDYXRlZ29yaWVzPU4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760192731),('rsWfkgOaFpnoTOpCD7QoK1SeSdIuJH5rcTPMdedz',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoid0RwZjZLV25tT3pBRWNRRTFSWk9XY1pla0JqTm8wZHl1T0d4UWpKUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0xJmluY2x1ZGVTdWJDYXRlZ29yaWVzPVkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760165320),('rTb3zmqWDkiKTE4MuI4vYbnFQtc3pZrJ3zr0aF8M',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjBiVDBDTW1aZk9QWGZNNDBtNFR3dEhKWXR6Qzh2Y1cydXJYZnhBSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760161874),('SqEH4Kr6M5wfouzOYNxzklJ5rbvUsarN2EUMsvFQ',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmVQbVo0Z0hQdko5cVBDVlFXV1ZnUTZHa2dJRzRIdHp1cjdQbVdiNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5QXV0aG9yP2F1dGhvcklEPTIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760160831),('SuEhGzxmlDYLEkGmVYDTguXDxzf2tRQqZgREbseH',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNE13c3hDNHlVQTBlOEFiUHBzaHBqVkhXbjRGUVROQ1JmeW1pdTRwUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5SURzP0lEcyU1QjAlNUQ9MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760190885),('SUl5iYrQmP29I2GtJbQZlJp3PZbpbp89K1gdajYo',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUkRwV0t2UEZoZU5YdzFhaFI4c1FvR0NMbTBqYXVtQUVrcnFEN3Q2VyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760165294),('tgqITbybmqMZYEW0dKqHVBOQRkQxdX2nMf06700J',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjNoRXE3U2cyOTZkTWJHTlZvSzU1SEFDeUFzOGVlRFNnUldjWnJpZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760190392),('udqcNNNlupT1uybOfS8ZOpG213itZrM5DVNTAvTh',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiTjZWM0FZUzBBQlFhR2J3Y2Fjd0ZNMkdWTXJSYTVIQWZJQW1Bb2tyZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191940),('ufXeSl9U4nqCcdGzMUqtq03YjoXSE1nHeOI7tSUo',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUm5yUlpYbTVuNDk2VWlOM2JocEtvaUl4RWtSdWV4eDhqOWJCRWZmTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760189126),('uj7e8H04q3QJmOqCWoTYclpqX50dlmnJrTQy6Q9I',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoieGlpaTNTNHlFWU04M0xHSmU0ejE2WnhIT1RtZnNrT0JQNWZRdEhzUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760163189),('UPGtQ2aw2Lqr2haj5MsWVWrkY6pFJF83nOauifp1',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0VhTG1WczBJNTFUVnp1QmdJVVphUGg3RjJUMllBaHFDZ2FhZGZ6YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760165873),('v5ENj9B421f11JEHjaiv70icXCvYQLCNTnL2kgjb',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoicHYzbzhFaW9LUUVCOW5OQ2Q3VmpneVNJeVo1Y1FHNThYWkFsM1ZISCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760194000),('vcoxtXVSLECHily8SOkMJFsQE7m0xK6HKIIS1Aen',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiVFF4RTBQZGkwQ00xcWd4UWRUMzRsUXRBa3RMUlZQcndIWEhudjhrciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760192001),('vMgTk6O2cASGHWjHA7OykZaaWKGFOe1ljLkK5s3c',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTI4NzRMeFVTbGx4UkxYbWk2enhhVVp1b0ppY1VmQ041Y0tLdDBoYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZXQxIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760160853),('VOpJoc2iE3mCT2lgMj2uIMkSnbQBF9zqlt2yMQyj',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUGF1QkZFWTBmak9VenZYMGZuRDBCd2NiS2NITnY0MGhZNXpFZDJMciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760189856),('vzyY2hMrljgWBJF6TpdzJpMmSy5hZdxiIIbdl7bu',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXBLd2x1RllQQ3Q2NHZsMWllWTF3M1lRTlR2U0JMNmxCNGJjbXBPbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5QXV0aG9yP2F1dGhvcklEPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760191843),('wLV6AJy4EmDuB2pRjAefOHKevj6lI6ANMFdPWnut',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoia2dDa2oyZFhtclZEYTJUM1ZyRVNxVW1nckF5UXY2aDRJQVlLRGNSZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191995),('Wn2XmAfHqs7QoEshlCXm2B6tmlyglZrxWnETX0ur',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoidVB5OW53Qm9QVzRGckxjdFdKcDZNWUY4RHNYQ3lZcll2QXd4MXhtQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191942),('WoB4G1hzkLq3dSyRid1uY339naJUoWlH0CLq0SWV',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEt5ZlFJajFCOWJLQzAzMWpySXpIOTY0c1cwb1JJd0RJN0pwbHd5MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760165254),('XCW8WPt6cULDzT8xHJeyjviS6yelLjtYygb09T6H',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEhCc2o5emk1NVBQQmZFQnI2clVOMzk2T2oydDFGM05oNjlsYVBjaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760165782),('xfMT9WzuGHwRN3v04X1VCxxTup2BFuscHzzOp7U0',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZFNnS0RlSGRqNzZNeHgzcVhNWklmRmRkTUg1SU5UTjNJS2haSk9XZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760191945),('XnHjiYGtdOOPloUFefjksRotNYENzKeuiAVSbBZz',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHVPTHR2b3A3ZUNOMUMzTzM3bU85OTZrNkd2YWx3SThDY2U3c3VDVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hdXRob3JzTGlzdD9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760194339),('xWNoz2Vzx55F6KdaRY5seuep3AGGQsknUyScp9sK',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoiWE9SdUF1V296b2xLTHJ0REY3cDlPZ052dmx1Rmh3Q3Z5enRzSUtNMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760192683),('YnIEN1wyFO5Chk8cGZr2FBqd6NLhExPGQkf47zFU',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoidEVnaFdEdUoyaGJLdnR1N044anZDN3hKZ1FpTVVsbDNLazZ5TWI2WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5Q2F0ZWdvcnk/Y2F0ZWdvcnlJRD0yJmluY2x1ZGVTdWJDYXRlZ29yaWVzPVkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1760192545),('YTybo87eTVgdhcxSvKZ3RVAkhsE2JgopiKrEaKQW',NULL,'127.0.0.1','HTTPie','YToyOntzOjY6Il90b2tlbiI7czo0MDoia05UQ2YzTmpNcGhVek5Da1ZzeXZNNjNqUlp0eGw2cHVjV01yT1AyciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1760160792),('yylD824qU1lVFbvO2Zdhkj7zjGRz2f1G13trgSPm',NULL,'127.0.0.1','HTTPie','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVUwMzZuc3pjQUFoWG9CZVpaRzROQnRSMEdtZXNDOGY4Sk5zYUNxVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92MS9hcnRpY2xlc0J5VGl0bGU/ZXhhY3Q9TiZ0aXRsZT1UZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1760161232);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tokens_value_index` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'a015ef47-8031-4a33-bcfe-8fc5a20f2592'),(2,'a016a988-ef90-47b8-88b6-56c15227c6ac'),(3,'a016a98b-3214-4e8a-972a-f4d492ff6aff'),(4,'a016a98d-2b20-4582-9608-74894f87de04'),(5,'a016a98e-9d18-4849-90d5-d3c37c36b067'),(6,'a016a990-47e9-42c2-9050-2fb934889c84'),(7,'a016a991-c360-40c5-8927-9c80c0ea9b51');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2025-10-11 18:02:13
