USE omp_35;
-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: omp_35
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_settings` (
  `announcement_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`announcement_setting_id`),
  UNIQUE KEY `announcement_settings_unique` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcements, including localized properties like names and contents.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_type_settings` (
  `announcement_type_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`announcement_type_setting_id`),
  UNIQUE KEY `announcement_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcement types, including localized properties like their names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_context_id` (`context_id`),
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcement types allow for announcements to optionally be categorized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_type_id` (`type_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_affiliation_settings`
--

DROP TABLE IF EXISTS `author_affiliation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_affiliation_settings` (
  `author_affiliation_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_affiliation_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`author_affiliation_setting_id`),
  UNIQUE KEY `author_affiliation_settings_unique` (`author_affiliation_id`,`locale`,`setting_name`),
  CONSTRAINT `author_affiliation_settings_author_affiliation_id_foreign` FOREIGN KEY (`author_affiliation_id`) REFERENCES `author_affiliations` (`author_affiliation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about author affiliations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_affiliation_settings`
--

LOCK TABLES `author_affiliation_settings` WRITE;
/*!40000 ALTER TABLE `author_affiliation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_affiliation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_affiliations`
--

DROP TABLE IF EXISTS `author_affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_affiliations` (
  `author_affiliation_id` bigint NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `ror` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_affiliation_id`),
  KEY `author_affiliations_ror` (`ror`),
  KEY `author_affiliations_author_id_foreign` (`author_id`),
  CONSTRAINT `author_affiliations_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Author affiliations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_affiliations`
--

LOCK TABLES `author_affiliations` WRITE;
/*!40000 ALTER TABLE `author_affiliations` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_settings` (
  `author_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`author_setting_id`),
  UNIQUE KEY `author_settings_unique` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`),
  CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint NOT NULL DEFAULT '1',
  `publication_id` bigint NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `user_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_user_group_id` (`user_group_id`),
  KEY `authors_publication_id_foreign` (`publication_id`),
  CONSTRAINT `authors_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The authors of a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `seq` bigint DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`),
  KEY `category_context_parent_id` (`context_id`,`parent_id`),
  KEY `category_parent_id` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_settings` (
  `category_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`category_setting_id`),
  UNIQUE KEY `category_settings_unique` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about categories, including localized properties such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citation_settings` (
  `citation_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `citation_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`citation_setting_id`),
  UNIQUE KEY `citation_settings_unique` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Additional data about citations, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citations` (
  `citation_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `raw_citation` text NOT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`),
  CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A citation made by an associated publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `assoc_id` varchar(16) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`),
  KEY `completed_payments_context_id` (`context_id`),
  KEY `completed_payments_user_id` (`user_id`),
  CONSTRAINT `completed_payments_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `completed_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of completed (fulfilled) payments, with information about the type of payment and the entity it relates to.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`),
  CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `controlled_vocab_entry_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint NOT NULL DEFAULT '0',
  `assoc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_oai_set_objects_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_oai_set_objects`
--

LOCK TABLES `data_object_tombstone_oai_set_objects` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`tombstone_setting_id`),
  UNIQUE KEY `data_object_tombstone_settings_unique` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about data object tombstones, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_settings`
--

LOCK TABLES `data_object_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doi_settings`
--

DROP TABLE IF EXISTS `doi_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doi_settings` (
  `doi_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `doi_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`doi_setting_id`),
  UNIQUE KEY `doi_settings_unique` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about DOIs, including the registration agency.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doi_settings`
--

LOCK TABLES `doi_settings` WRITE;
/*!40000 ALTER TABLE `doi_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `doi_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dois`
--

DROP TABLE IF EXISTS `dois`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dois` (
  `doi_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `doi` varchar(255) NOT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`doi_id`),
  KEY `dois_context_id` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Stores all DOIs used in the system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dois`
--

LOCK TABLES `dois` WRITE;
/*!40000 ALTER TABLE `dois` DISABLE KEYS */;
/*!40000 ALTER TABLE `dois` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint DEFAULT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint DEFAULT NULL,
  `editor_id` bigint NOT NULL,
  `decision` smallint NOT NULL COMMENT 'A numeric constant indicating the decision that was taken. Possible values are listed in the Decision class.',
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`),
  KEY `edit_decisions_review_round_id` (`review_round_id`),
  CONSTRAINT `edit_decisions_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `sender_id` bigint DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_sender_id` (`sender_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `email_log_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log_users` (
  `email_log_user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_log_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`email_log_user_id`),
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`),
  KEY `email_log_users_email_log_id` (`email_log_id`),
  KEY `email_log_users_user_id` (`user_id`),
  CONSTRAINT `email_log_users_email_log_id_foreign` FOREIGN KEY (`email_log_id`) REFERENCES `email_log` (`log_id`) ON DELETE CASCADE,
  CONSTRAINT `email_log_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A record of users associated with an email log entry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `email_id` bigint NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint NOT NULL,
  `alternate_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`),
  KEY `email_templates_context_id` (`context_id`),
  KEY `email_templates_alternate_to` (`alternate_to`),
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Custom email templates created by each context, and overrides of the default templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default_data` (
  `email_templates_default_data_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(28) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`email_templates_default_data_id`),
  UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb3 COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES (1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(2,'PASSWORD_RESET_CONFIRM','es','Confirmación de restablecimiento de contraseña','Confirmación para restablecer la contraseña','Se recibió una solicitud para restablecer su contraseña en la página web {$siteTitle}.<br />\n<br />\nSi no realizó esta solicitud, ignore este correo electrónico y su contraseña no se cambiará. Si desea restablecer su contraseña, haga clic en la dirección URL que aparece debajo.<br />\n<br />\nRestablecer contraseña: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(3,'PASSWORD_RESET_CONFIRM','pt_BR','Confirmar redefinição de Senha','Confirmação de redefinição de senha','Recebemos uma solicitação para redefinir sua senha no site {$siteTitle}.<br />\n<br />\nCaso não tenha feito a solicitação, ignore esta mensagem e sua senha não será alterada. Caso deseje redefinir sua senha, clique no endereço a seguir.<br />\n<br />\nRedefinir senha: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(4,'USER_REGISTER','en','User Created','Press Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this press through its website. At any point, you can ask to be removed from the list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(5,'USER_REGISTER','es','Usuario/a creado','Registro en la publicación','{$recipientName}<br />\n<br />\nSe registró como usuario/a con {$contextName}. En este correo electrónico hemos incluido el nombre de usuario/a y contraseña que necesitará para trabajar con esta publicación a través de su página web. En cualquier momento puede contactarse conmigo para pedir que se le elimine de la lista de usuarios/as.<br />\n<br />\nNombre de usuario/a: {$recipientUsername}<br />\nContraseña: {$password}<br />\n<br />\nGracias,<br />\n{$signature}'),(6,'USER_REGISTER','pt_BR','Usuário Criado','Cadastro na editora','{$recipientName},<br />\n<br />\nSeu cadastro foi realizado com sucesso na editora {$contextName}. Nesta mensagem estão incluídos seu login e senha, necessário para acesso ao sistema e executar as atividades editoriais relacionadas. Exclua seu cadastro desta lista a qualquer momento, respondendo a esta mensagem ou enviando solicitação ao endereço de resposta.<br />\n<br />\nLogin: {$recipientUsername}<br />\nSenha: {$password}<br />\n<br />\nAtenciosamente,<br />\n{$signature}'),(7,'USER_VALIDATE_CONTEXT','en','Validate Email (Press Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$contextSignature}'),(8,'USER_VALIDATE_CONTEXT','es','Validar correo electrónico (registro en la editorial)','Valide su cuenta','{$recipientName}<br />\n<br />\nHa creado una cuenta en {$contextName}, pero es necesario que valide su cuenta de correo electrónico antes de poder utilizarla. Para ello, simplemente haga clic en el enlace siguiente:<br />\n<br />\n{$activateUrl}<br />\n<br />\nGracias,<br />\n{$contextSignature}'),(9,'USER_VALIDATE_CONTEXT','pt_BR','Validar e-mail (registro de editora)','Valide a sua conta','{$recipientName} <br />\n<br />\nVocê criou uma conta com {$contextName}, mas antes de começar a usá-la, você precisa validar sua conta de e-mail. Para fazer isso, basta acessar o link abaixo: <br />\n<br />\n{$activateUrl} <br />\n<br />\nObrigado, <br />\n{$contextSignature}'),(10,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),(11,'USER_VALIDATE_SITE','es','Validar correo electrónico (Sitio)','Valide su cuenta','{$recipientName}<br />\n<br />\nHa creado una cuenta en {$siteTitle}, pero es necesario que valide su cuenta de correo electrónico antes de poder utilizarla. Para ello, simplemente haga clic en el enlace siguiente:<br />\n<br />\n{$activateUrl}<br />\n<br />\nGracias,<br />\n{$siteSignature}'),(12,'USER_VALIDATE_SITE','pt_BR','Validar e-mail (site)','Valide a sua conta','{$recipientName} <br />\n<br />\nVocê criou uma conta com {$siteTitle}, mas antes de começar a usá-la, você precisa validar sua conta de e-mail. Para fazer isso, basta acessar o link abaixo: <br />\n<br />\n{$activateUrl} <br />\n<br />\nObrigado, <br />\n{$siteSignature}'),(13,'REVIEWER_REGISTER','en','Reviewer Register','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the press through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(14,'REVIEWER_REGISTER','es','Registro de revisor/a','Registro como revisor/a con {$contextName}','Dada su experiencia, nos hemos tomado la libertad de registrar su nombre en la base de datos de revisores/as para {$contextName}. Esto no implica ningún tipo de compromiso por su parte, simplemente permite que nos pongamos en contacto con usted si tenemos un envío que quizás pueda revisar. Si se le invita a realizar una revisión, tendrá la oportunidad de ver el título y el resumen de dicho trabajo y en todo momento podrá aceptar o rechazar la invitación. Asimismo, puede pedir que se elimine su nombre de la lista de revisores/as.<br />\n<br />\nLe proporcionamos un nombre de usuario/a y una contraseña que se utilizan para trabajar con la publicación a través de su página web. Si lo desea puede, por ejemplo, actualizar su perfil y sus preferencias de revisión.<br />\n<br />\nNombre de usuario/a: {$recipientUsername}<br />\nContraseña: {$password}<br />\n<br />\nGracias,<br />\n{$signature}'),(15,'REVIEWER_REGISTER','pt_BR','Cadastro de Avaliador','Cadastro como Avaliador da editora {$contextName}','Por sua vasta experiência e conhecimento, tomamos a liberdade de cadastrá-lo como avaliador na base de dados da editora {$contextName}. Isto não implica, de forma alguma, em qualquer compromisso de sua parte, apenas nos permite contatá-lo para encaminhar possíveis avaliações. Ao ser convidado para realizar uma avaliação, terá a oportunidade de ler o título e resumo do trabalho, bem como indicar se aceita ou não o convite. Solicite a qualquer tempo a remoção do seu nome de nossa base de revisores.<br />\n<br />\nA seguir, informamos seu login e sua senha, usados em todas as atividades editoriais na editora. Use-os para atualizar seu perfil, por exemplo, incluindo a área de interesse para avaliação.<br />\n<br />\nLogin: {$recipientUsername}<br />\nSenha: {$password}<br />\n<br />\nAtenciosamente,<br />\n{$signature}'),(16,'SUBMISSION_ACK','en','Submission Confirmation','Thank you for your submission to {$contextName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$contextName}. We have received your submission, \"{$submissionTitle}\", and a member of our editorial team will see it soon. You will be sent an email when an initial decision is made, and we may contact you for further information.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$contextName} as a venue for your work.</p>{$contextSignature}'),(17,'SUBMISSION_ACK','es','Confirmación de envío','Gracias por tu envío a {$contextName}','<p>Estimado/a {$recipientName},</p><p>Gracias por su envío a {$contextName}. Hemos recibido su envío, \"{$submissionTitle}\", y un miembro de nuestro equipo editorial lo revisará pronto. Recibirá un correo electrónico cuando se tome una decisión inicial, y es posible que nos pongamos en contacto con usted para solicitarle más información.</p><p>Puede ver su envío y seguir su progreso a través del proceso editorial en la siguiente ubicación:</p><p>URL de envío: {$authorSubmissionUrl}</p><p>Si ha cerrado sesión, puede volver a iniciar sesión con el nombre de usuario {$recipientUsername}.</p><p>Si tiene alguna pregunta, póngase en contacto conmigo desde su <a href=\"{$authorSubmissionUrl}\">panel de envío</a>.</p><p>Gracias por considerar {$contextName} como plataforma para su trabajo.</p>{$contextSignature}'),(18,'SUBMISSION_ACK','pt_BR','Confirmação da Submissão','Obrigado pela sua submissão para {$contextName}','<p>Prezado(a) {$recipientName},</p><p>Obrigado pela sua submissão para {$contextName}. Recebemos sua submissão, \"{$submissionTitle}\", e um membro de nossa equipe editorial a verá em breve. Você receberá um e-mail quando uma decisão inicial for tomada e poderemos entrar em contato com você para obter mais informações.</p><p>Você pode visualizar sua submissão e acompanhar seu progresso por meio do processo editorial no seguinte local:</p><p>URL de submissão: {$authorSubmissionUrl}</p><p>Se você tiver sido desconectado, poderá fazer login novamente com o nome de usuário {$recipientUsername}.</p><p>Se tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel de submissão</a>.</p><p>Obrigado por considerar {$contextName} como um local para o seu trabalho.</p>{$contextSignature}'),(19,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission confirmation','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a submission to {$contextName}. The submitter, {$submitterName}, provided the following details:</p><p>\"{$submissionTitle}\"<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this submission, please contact me.</p><p>Thank you for considering {$contextName} as a venue for your work.</p><p>Kind regards,</p>{$contextSignature}'),(20,'SUBMISSION_ACK_NOT_USER','es','Confirmación del envío (otros autores/as)','Acuse de recibo del envío','<p>Estimado/a {$recipientName},</p> <p>Usted ha sido nombrado/a como coautor/a en un envío a {$contextName}. La persona que realizó el envío, {$submitterName}, proporcionó los siguientes datos:</p> <p>\"{$submissionTitle}\"<br />{$authorsWithAffiliation}</p> <p>Si alguno de estos datos es incorrecto, o si no desea ser mencionado/a como parte de este envío, por favor contácteme.</p> <p>Gracias por considerar a {$contextName} como un espacio para compartir su trabajo.</p> <p>Saludos cordiales,</p>{$contextSignature}'),(21,'SUBMISSION_ACK_NOT_USER','pt_BR','Confirmação de Submissão (Outros Autores)','Confirmação de submissão','<p>Prezado(a) {$recipientName},</p><p>Você foi designado coautor em uma submissão para {$contextName}. O remetente, {$submitterName}, forneceu os seguintes detalhes:</p><p>\"{$submissionTitle}\"<br />{$authorsWithAffiliation}</p><p>Se algum desses detalhes estiver incorreto ou você não deseja ser designado nesta submissão, entre em contato conosco.</p><p>Agradecemos por considerar {$contextName} para publicar o seu trabalho.</p><br /><p>Atenciosamente,</p>{$contextSignature}'),(22,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as an editor on a submission to {$contextName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$contextName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$contextSignature}'),(23,'EDITOR_ASSIGN','es','Editor/a asignado','Tarea editorial','<p>Estimado/a {$recipientName},</p><p>Se le ha asignado el envío siguiente para supervisarlo durante el proceso editorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumen</b></p>{$submissionAbstract}<p>Si considera que el envío es relevante para {$contextName}, remítalo a la fase de revisión seleccionando \"Enviar a revisión interna\" y, a continuación, asigne revisores/as haciendo clic en \"Añadir revisor/a\".</p><p>Si el envío no es adecuado para esta publicación, rechácelo.</p><p>Gracias por adelantado.</p><p>Saludos cordiales,</p>{$contextSignature}'),(24,'EDITOR_ASSIGN','pt_BR','Editor Atribuído','Você foi designado como editor em uma submissão para {$contextName}','{$recipientName},<br />\n<br />\nA submissão &quot;{$submissionTitle}&quot; a editora {$contextName} está sob sua responsabilidade para acompanhamento durante o processo editorial, como editor.<br />\n<br />\nPágina da submissão: {$submissionUrl}<br />\nLogin: {$recipientUsername}<br />\n<br />\nAtenciosamente,'),(25,'REVIEW_CANCEL','en','Reviewer Unassign','Request for Review Cancelled','{$recipientName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this review process in the future.<br />\n<br />\nIf you have any questions, please contact me.'),(26,'REVIEW_CANCEL','es','Desasignar revisor/a','Solicitud de revisión cancelada','{$recipientName}:<br />\n<br />\nHemos decidido cancelar nuestra solicitud de que usted revise el envío &quot;{$submissionTitle}&quot; para {$contextName}. Pedimos disculpas por cualquier inconveniente que esta decisión pueda causar y esperamos poder contar con usted para participar en este proceso de revisión en el futuro.<br />\n<br />\nSi tiene alguna duda, puede ponerse en contacto conmigo.'),(27,'REVIEW_CANCEL','pt_BR','Avaliador não atribuído','Solicitação de avaliação cancelada','{$recipientName},<br />\n<br />\nDecidimos neste momento cancelar nossa solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; à editora {$contextName}. Lamentamos qualquer inconveniente que isto possa causar e esperamos que possamos solicitar novamente sua ajuda no futuro.<br />\n<br />\nEm caso de dúvidas, entre em contato.'),(28,'REVIEW_REINSTATE','en','Reviewer Reinstate','Can you still review something for {$contextName}?','<p>Dear {$recipientName},</p><p>We recently cancelled our request for you to review a submission, {$submissionTitle}, for {$contextName}. We\'ve reversed that decision and we hope that you are still able to conduct the review.</p><p>If you are able to assist with this submission\'s review, you can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> to view the submission, upload review files, and submit your review request.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(29,'REVIEW_REINSTATE','es','Restaurar revisor/a','Aún está disponible para revisar textos para {$contextName}?','<p>Estimado/a {$recipientName},</p><p>Recientemente cancelamos nuestra solicitud para que revisara el envío, {$submissionTitle}, para {$contextName}. Sin embargo, hemos revertido dicha decisión y tenemos la esperanza de que aún pueda llevar a cabo la revisión.</p><p>Si está disponible para ayudarnos con la revisión de este envío puede <a href=\"{$reviewAssignmentUrl}\">iniciar sesión en la publicación</a> para ver el envío, cargar archivos de revisión y enviar su revisión.</p><p>Si tiene cualquier pregunta póngase en contacto con nosotros.</p><p>Saludos cordiales,</p>{$signature}'),(30,'REVIEW_REINSTATE','pt_BR','Avaliador reintegrado','Ainda pode avaliar algo para {$contextName}?','{$recipientName}:<br />\n<br />\nGostaríamos de restabelecer nossa solicitação para você avaliar a submissão, \"{$submissionTitle}\" para {$contextName}. Esperamos que você possa ajudar no processo de avaliação. <br />\n<br />\nSe você tiver alguma dúvida, entre em contato comigo.'),(31,'REVIEW_RESEND_REQUEST','en','Resend Review Request to Reviewer','Requesting your review again for {$contextName}','<p>Dear {$recipientName},</p><p>Recently, you declined our request to review a submission, \"{$submissionTitle}\", for {$contextName}. I\'m writing to see if you are able to conduct the review after all.</p><p>We would be grateful if you\'re able to perform this review, but we understand if that is not possible at this time. Either way, please <a href=\"{$reviewAssignmentUrl}\">accept or decline the request</a> by {$responseDueDate}, so that we can find an alternate reviewer.</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p>{$signature}'),(32,'REVIEW_RESEND_REQUEST','es','Reenviar la solicitud de revisión al revisor/a','Solicitando de nuevo su revisión para {$contextName}','<p>Estimado/a {$recipientName},</p> <p>Recientemente, rechazó nuestra solicitud para revisar el envío titulado \"{$submissionTitle}\" para {$contextName}. Le escribo para saber si estaría disponible para realizar la revisión.</p> <p>Le agradeceríamos mucho si pudiera realizar esta revisión, pero entendemos si no es posible en este momento. En cualquier caso, por favor <a href=\"{$reviewAssignmentUrl}\"> acepte o rechace la solicitud</a> antes del {$responseDueDate}, para que podamos buscar un revisor alternativo.</p> <p>Si tiene alguna pregunta, no dude en contactarme.</p> <p>Saludos cordiales,</p>{$signature}'),(33,'REVIEW_RESEND_REQUEST','pt_BR','Reenviar solicitação de avaliação ao avaliador','Solicitando sua avaliação novamente para {$contextName}','<p>Prezado(a) {$recipientName},</p><p>Recentemente, você recusou nossa solicitação de avaliação de uma submissão, \"{$submissionTitle}\", para {$contextName}. Estou escrevendo para saber se você consegue realizar a avaliação.</p><p>Ficaríamos gratos se você pudesse realizar essa avaliação, mas entenderemos se isso não for possível no momento. De qualquer forma, <a href=\"{$reviewAssignmentUrl}\">aceite ou recuse a solicitação</a> até {$responseDueDate}, para podermos encontrar um avaliador alternativo.</p><p>Se você tiver alguma dúvida, entre em contato comigo.</p><p>Atenciosamente,</p>{$signature}'),(34,'REVIEW_REQUEST','en','Review Request','Manuscript Review Request','<p>Dear {$recipientName},</p><p>I believe that you would serve as an excellent reviewer for a submission  to {$contextName}. The submission\'s title and abstract are below, and I hope that you will consider undertaking this important task for us.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can view the submission, upload review files, and submit your review by logging into the press and following the steps at the link below.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>You may contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(35,'REVIEW_REQUEST','es','Solicitud de revisión','Solicitud de revisión de manuscrito','<p>Estimado/a {$recipientName},</p><p>Consideramos que sería un revisor/a excelente para este envío a {$contextName}. Encontrará el título y el resumen del envío más abajo. Esperamos que considere llevar a cabo esta tarea tan importante para nosotros.</p><p>Si está disponible para revisar el envío, la fecha límite para completar la revisión sería el {$reviewDueDate}. Puede consultar el envío, cargar los archivos de revisión y enviar su revisión iniciando sesión en la publicación y siguiendo los pasos desde el enlace que hay más abajo.</p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Resumen</b></p>{$submissionAbstract}<p>Por favor, <a href=\"{$reviewAssignmentUrl}\">acepte o rechace</a> la revisión antes del <b>{$responseDueDate}</b>.</p><p>Si tiene cualquier pregunta sobre el envío o el proceso de revisión no dude en contactarnos.</p><p>Gracias por tener en cuenta esta petición, apreciamos mucho su ayuda.</p><p>Saludos cordiales,</p>{$signature}'),(36,'REVIEW_REQUEST','pt_BR','Solicitação de Avaliação','Solicitação de Avaliação','<p>Prezado(a) {$recipientName},</p>\n<p>Acredito que você seria um excelente avaliador para uma submissão ao {$contextName}. O título e o resumo da submissão estão abaixo, e espero que você considere assumir essa importante tarefa para nós.</p>\n<p>Se você puder avaliar esta submissão, sua avaliação deve ser entregue até {$reviewDueDate}. Você pode visualizar a submissão, fazer upload de arquivos de avaliação e enviar seu parecer ao fazer login na editora e seguir as etapas no link abaixo.</p>\n<p>Login: {$recipientUsername}</p>\n<p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p>\n<p><b>Resumo</b></p>\n{$submissionAbstract}\n<p>Por favor, <a href=\"{$reviewAssignmentUrl}\">aceite ou recuse</a> a avaliação até <b>{$responseDueDate}</b>.</p>\n<p>Você pode entrar em contato comigo com qualquer dúvida sobre a submissão ou o processo de avaliação.</p>\n<p>Obrigado por considerar este pedido. Sua ajuda é muito apreciada.</p>\n<p>Atenciosamente,</p>\n{$signature}'),(37,'REVIEW_REQUEST_SUBSEQUENT','en','Review Request Subsequent','Request to review a revised submission','<p>Dear {$recipientName},</p><p>Thank you for your review of <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. The authors have considered the reviewers\' feedback and have now submitted a revised version of their work. I\'m writing to ask if you would conduct a second round of peer review for this submission.</p><p>If you are able to review this submission, your review is due by {$reviewDueDate}. You can <a href=\"{$reviewAssignmentUrl}\">follow the review steps</a> to view the submission, upload review files, and submit your review comments.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please <a href=\"{$reviewAssignmentUrl}\">accept or decline</a> the review by <b>{$responseDueDate}</b>.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Thank you for considering this request. Your help is much appreciated.</p><p>Kind regards,</p>{$signature}'),(38,'REVIEW_REQUEST_SUBSEQUENT','es','Solicitud de revisión posterior','Solicitud para revisar un envío ya revisado','<p>Estimado/a {$recipientName},</p><p>Gracias por la revisión de <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. Los autores/as han tenido en cuenta los comentarios de los revisores/as y han enviado una versión revisada de su obra. Le escribo para pedirle si podría llevar a cabo una segunda ronda de revisión por pares de este envío.</p><p>Si está disponible para revisar el envío, la fecha límite para completar la revisión sería el {$reviewDueDate}. Puede <a href=\"{$reviewAssignmentUrl}\">seguir los pasos de revisión</a> para consultar el envío, cargar los archivos de revisión y enviar sus comentarios de revisión.<p><p><a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a></p><Resumen</b></p>{$submissionAbstract}<p>Por favor, <a href=\"{$reviewAssignmentUrl}\">acepte o rechace</a> la revisión antes del <b>{$responseDueDate}</b>.</p><p>Si tiene cualquier pregunta sobre el envío o el proceso de revisión no dude en contactarnos.</p><p>Gracias por tener en cuenta esta petición, apreciamos mucho su ayuda.</p><p>Saludos cordiales,</p>{$signature}'),(39,'REVIEW_REQUEST_SUBSEQUENT','pt_BR','Solicitação de Avaliação Subsequente','Solicitação de avaliação de uma submissão revisada','<p>Prezado(a) {$recipientName},</p><p>Obrigado por sua avaliação de <a href=\"{$reviewAssignmentUrl}\">{$submissionTitle}</a>. Os autores consideraram o feedback dos avaliadores e agora submeteram uma versão revisada de seu trabalho. Estou escrevendo para perguntar se você faria uma segunda rodada de avaliação por pares para esta submissão. {$contextName}.</p><p>Se você puder avaliar esta submissão, sua avaliação será válida até {$reviewDueDate}. Você pode <a href=\"{$reviewAssignmentUrl}\">seguir as etapas de avaliação</a> para visualizar a submissão, baixe os arquivos de revisão e enviar seus comentários de avaliação.<p><p><a href=\"{$reviewAssignmentUrl }\">{$submissionTitle}</a></p><p>Resumo</p>{$submissionAbstract}<p>Aceite ou recuse a avaliação até {$responseDueDate}.</p><p>Por favor sinta-se à vontade para entrar em contato comigo em caso de dúvidas sobre a submissão ou o processo de avaliação.</p><p>Obrigado por considerar esta solicitação. Sua ajuda é muito apreciada.</p><p>Atenciosamente,</p>{$signature}'),(40,'REVIEW_RESPONSE_OVERDUE_AUTO','en','Review Response Overdue (Automated)','Manuscript Review Request','Dear {$recipientName},<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\n{$messageToReviewer}<br />\n<br />\nPlease log into the press web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$reviewAssignmentUrl}<br />\n<br />\nUsername: {$recipientUsername}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n<br />\nSincerely,<br />\n{$contextSignature}<br />\n'),(41,'REVIEW_RESPONSE_OVERDUE_AUTO','es','Respuesta de revisión vencida (automática)','Solicitud de revisión del manuscrito','Estimado/a {$recipientName},<br />\nEsto es un breve recordatorio de nuestra solicitud de revisión del envío, &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos recibir su respuesta el {$responseDueDate}, así que este correo electrónico se ha generado y enviado automáticamente al excederse dicha fecha.\n<br />\n{$messageToReviewer}<br />\n<br />\nInicie la sesión en el sitio web de la publicación para indicar si realizará la revisión o no, así como para acceder al envío y registrar su revisión y recomendación..<br />\n<br />\nLa revisión está prevista para el día {$reviewDueDate}.<br />\n<br />\nURL del envío: {$reviewAssignmentUrl}<br />\n<br />\nNombre de usuario/a: {$recipientUsername}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n<br />\nSinceramente,<br />\n{$contextSignature}<br />\n'),(42,'REVIEW_RESPONSE_OVERDUE_AUTO','pt_BR','Lembrete de resposta atrasada (automatizada)','Pedido de Avaliação de Manuscrito','Caro(a) {$recipientName},<br />\nApenas relembrando gentilmente do nosso pedido para avaliação da submissão &quot;{$submissionTitle},&quot; para {$contextName}. Nos esperamos ter sua resposta em {$responseDueDate}, sendo que esse e-mail foi gerado e enviado automaticamente devido ao tempo.\n<br />\n{$messageToReviewer}<br />\n<br />\nPor favor, entre no site da editora para indicar se aceita a avaliação, bem como a submissão e os registros de avaliação e recomendação.<br />\n<br />\nA data limite da avaliação é  até: {$reviewDueDate}.<br />\n<br />\nEndereço da submissão: <a href=\"{$reviewAssignmentUrl}\">{$reviewAssignmentUrl}</a><br />\n<br />\nUsuário: {$recipientUsername}<br />\n<br />\nObrigado por considerar o pedido.<br />\n<br />\n<br />\nAtenciosamente,<br />\n{$contextSignature}<br />\n'),(43,'REVIEW_CONFIRM','en','Review Confirm','Review accepted: {$reviewerName} accepted review assignment for #{$submissionId} {$authorsShort} — \"{$submissionTitle}\"','<p>Dear {$recipientName},</p><p>{$reviewerName} has accepted the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — \"{$submissionTitle}\"</a><br /><b>Type:</b> {$reviewMethod}</p><p><b>Review Due:</b> {$reviewDueDate}</p><p>Login to <a href=\"{$submissionUrl}\">view all reviewer assignments</a> for this submission.</p><br><br>—<br>This is an automated message from <a href=\"{$contextUrl}\">{$contextName}</a>.'),(44,'REVIEW_CONFIRM','es','Confirmación de la revisión','Revisión aceptada: {$reviewerName} aceptó la asignación de revisión de #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Estimado/a {$recipientName},</p> <p>{$reviewerName} ha aceptado la siguiente revisión:</p> <p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — \"{$submissionTitle}\"</a><br /> <b>Tipo:</b> {$reviewMethod}</p> <p><b>Fecha límite para la revisión:</b> {$reviewDueDate}</p> <p>Inicie sesión para <a href=\"{$submissionUrl}\">ver todas las asignaciones de revisión</a> de este envío.</p><br><br>—<br><p>Este es un mensaje automático enviado desde <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),(45,'REVIEW_CONFIRM','pt_BR','Confirmar avaliação','Avaliação aceita: {$reviewerName} aceitou a tarefa de avaliação para #{$submissionId} {$authorsShort} — \"{$submissionTitle}\"','<p>Prezado(a) {$recipientName},</p><p>{$reviewerName} aceitou realizar a seguinte avaliação:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — \"{$submissionTitle}\"</a><br /><b>Tipo:</b> {$reviewMethod}</p><p><b>Prazo previsto:</b> {$reviewDueDate}</p><p>Faça login para <a href=\"{$submissionUrl}\">ver todas as tarefas do avaliador</a> para esta submissão.</p><br><br>—<br>Esta é uma mensagem automática de <a href=\"{$contextUrl}\">{$contextName}</a>.'),(46,'REVIEW_DECLINE','en','Review Decline','Unable to Review','Editor(s):<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$senderName}'),(47,'REVIEW_DECLINE','es','Rechazo de la revisión','No disponible para revisar','{$recipientName}:<br />\n<br />\nMe temo que en este momento no puedo revisar el envío &quot;{$submissionTitle}&quot; para {$contextName}. Gracias por pensar en mí, pueden contar conmigo en futuras ocasiones.<br />\n<br />\n{$senderName}'),(48,'REVIEW_DECLINE','pt_BR','Recusar revisão','Indisponível para avaliação','Editores,<br />\n<br />\nLamento informar que não estou disponível neste momento para avaliar a submissão &quot;{$submissionTitle}&quot;, enviada à editora {$contextName}. Agradeço por considerar meu perfil, e sinta-se à vontade para entrar em contato novamente em oportunidade futura.<br />\n<br />\n{$senderName}'),(49,'REVIEW_ACK','en','Review Acknowledgement','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, \"{$submissionTitle}\", for {$contextName}. We appreciate your time and expertise in contributing to the quality of the work that we publish.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$contextName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(50,'REVIEW_ACK','es','Agradecimiento por la revisión','Gracias por su revisión','<p>Estimado/a {$recipientName},</p>\n<p>Gracias por completar la revisión del envío, {$submissionTitle}, para {$contextName}. Le agradecemos su tiempo y su pericia, que contribuyen a la calidad de las obras que publicamos.</p>\n<p>Ha sido un placer trabajar con usted como revisor/a para {$contextName}, y esperamos tener la oportunidad de seguir haciéndolo en el futuro.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>'),(51,'REVIEW_ACK','pt_BR','Agradecimento da avaliação','Obrigado pela avaliação','<p>Prezado(a) {$recipientName}:</p>\n<p>Obrigado por completar a avaliação da submissão \"{$submissionTitle}\" para {$contextName}. Agradecemos pelo tempo e conhecimento contribuídos para manter a qualidade dos trabalhos que publicamos.</p>\n<p>Tem sido um prazer trabalhar com você como avaliador para {$contextName}, e esperamos ter uma oportunidade de trabalhar com você novamente.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>'),(52,'REVIEW_REMIND','en','Review Reminder','A reminder to please complete your review','<p>Dear {$recipientName},</p><p>Just a gentle reminder of our request for your review of the submission, \"{$submissionTitle},\" for {$contextName}. We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>You can <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$signature}'),(53,'REVIEW_REMIND','es','Recordatorio de la revisión','Recordatorio para completar la revisión','<p>Estimado/a {$recipientName},</p><p>Esto es un breve recordatorio sobre nuestra solicitud de revisión del envío \"{$submissionTitle}\" para {$contextName}. Esperábamos recibir la revisión el {$reviewDueDate}, así que le agradeceríamos que nos la enviara tan pronto como la tenga preparada.</p><p>Puede <a href=\"{$reviewAssignmentUrl}\">iniciar sesión en la publicación</a> y seguir los pasos de revisión para consultar el envío, cargar los archivos de revisión y enviar sus comentarios de revisión.</p><p>Si necesita ampliar la fecha límite póngase en contacto con nosotros. Esperamos recibir noticias suyas bien pronto.</p><p>Gracias por adelantado y saludos cordiales,</p>{$signature}'),(54,'REVIEW_REMIND','pt_BR','Lembrete de avaliação','Um lembrete para concluir sua avaliação','<p>Prezado(a) {$recipientName},</p><p>Este é apenas um lembrete gentil sobre nossa solicitação de seu parecer para a submissão \"{$submissionTitle}\" em {$contextName}. Estávamos aguardando esse parecer até {$reviewDueDate} e ficaremos satisfeitos em recebê-lo assim que lhe for possível concluí-lo.</p><p>Você pode <a href=\"{$reviewAssignmentUrl}\">acessar a editora</a> e seguir as etapas da avaliação para visualizar a submissão, enviar arquivos de avaliação e submeter seus comentários.</p><p>Se precisar de uma prorrogação do prazo, entre em contato comigo. Fico no aguardo de seu retorno.</p><p>Agradeço antecipadamente e envio cordiais saudações,</p>{$signature}'),(55,'REVIEW_REMIND_AUTO','en','Review Reminder (Automated)','A reminder to please complete your review','<p>Dear {$recipientName}:</p><p>This email is an automated reminder from {$contextName} in regards to our request for your review of the submission, \"{$submissionTitle}.\"</p><p>We were expecting to have this review by {$reviewDueDate} and we would be pleased to receive it as soon as you are able to prepare it.</p><p>Please <a href=\"{$reviewAssignmentUrl}\">login to the press</a> and follow the review steps to view the submission, upload review files, and submit your review comments.</p><p>If you need an extension of the deadline, please contact me. I look forward to hearing from you.</p><p>Thank you in advance and kind regards,</p>{$contextSignature}'),(56,'REVIEW_REMIND_AUTO','es','Recordatorio de revisión (automático)','Recordatorio para completar la revisión','<p>Estimado/a {$recipientName},</p><p>Este correo electrónico es un recordatorio automático de {$contextName} acerca de nuestra solicitud de revisión del envío \"{$submissionTitle}\"</p><p>. Esperábamos recibir la revisión el {$reviewDueDate}, así que le agradeceríamos que nos la enviara tan pronto como la tenga preparada.</p><p>Por favor, <a href=\"{$reviewAssignmentUrl}\">inicie sesión en la publicación</a> y siga los pasos de revisión para consultar el envío, cargar los archivos de revisión y enviar sus comentarios de revisión.</p><p>Si necesita ampliar la fecha límite póngase en contacto con nosotros. Esperamos recibir noticias suyas bien pronto.</p><p>Gracias por adelantado y saludos cordiales,</p>{$signature}'),(57,'REVIEW_REMIND_AUTO','pt_BR','Lembrete de avaliação (automatizado)','Um lembrete para concluir sua avaliação','<p>Prezado(a) {$recipientName},</p><p>Este é apenas um lembrete sobre o nosso pedido para avaliar a submissão, \"{$submissionTitle}.\" </p><p> Esperávamos receber esta avaliação até {$reviewDueDate} e ficaríamos muito satisfeitos em recebê-la assim que possível.</p><p>Por favor, <a href=\"{$reviewAssignmentUrl}\">acesse o sistema da Editora</a> e siga as etapas para visualizar a submissão, enviar os arquivos de revisão e registrar seus comentários de revisão.</p><p>Se você precisar de uma prorrogação do prazo, por favor, entre em contato comigo. Fico no aguardo do seu retorno.</p><p>Agradeço desde já e envio cordiais saudações,</p>\n{$signature}'),(58,'REVIEW_COMPLETE','en','Review Completed','Review complete: {$reviewerName} recommends {$reviewRecommendation} for #{$submissionId} {$authorsShort} — \"{$submissionTitle}\"','<p>Dear {$recipientName},</p><p>{$reviewerName} completed the following review:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — \"{$submissionTitle}\"</a><br /><b>Recommendation:</b> {$reviewRecommendation}<br /><b>Type:</b> {$reviewMethod}</p><p>Login to <a href=\"{$submissionUrl}\">view all files and comments</a> provided by this reviewer.</p>'),(59,'REVIEW_COMPLETE','es','Revisión finalizada','Revisión completada: {$reviewerName} recomienda {$reviewRecommendation} para #{$submissionId} {$authorsShort} — {$submissionTitle}','<p>Estimado/a {$recipientName},</p> <p>{$reviewerName} ha completado la siguiente revisión:</p> <p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — \"{$submissionTitle}\"</a><br /> <b>Recomendación:</b> {$reviewRecommendation}<br /> <b>Tipo:</b> {$reviewMethod}</p> <p>Inicie sesión para <a href=\"{$submissionUrl}\">ver todos los archivos y comentarios</a> proporcionados por este revisor.</p>'),(60,'REVIEW_COMPLETE','pt_BR','Avaliação Concluída','Avaliação concluída: {$reviewerName} recomenda {$reviewRecommendation} para #{$submissionId} {$authorsShort} — \"{$submissionTitle}\"','<p>Prezado(a) {$recipientName},</p><p>{$reviewerName} concluiu a seguinte avaliação:</p><p><a href=\"{$submissionUrl}\">#{$submissionId} {$authorsShort} — \"{$submissionTitle}\"</a><br /><b>Recomendação:</b> {$reviewRecommendation}<br /><b>Tipo:</b> {$reviewMethod}</p><p>Faça login para <a href=\"{$submissionUrl}\">ver todos os arquivos e comentários</a> fornecidos por este avaliador.</p>'),(61,'REVIEW_EDIT','en','Review Edited','Your review assignment has been changed for {$contextName}','<p>Dear {$recipientName},</p><p>An editor has made changes to your review assignment for {$contextName}. Please review the details below and let us know if you have any questions.</p><p><a href=\"{$reviewAssignmentUrl}\">\"{$submissionTitle}\"</a><br /><b>Type:</b> {$reviewMethod}<br /><b>Accept or Decline By:</b> {$responseDueDate}<br /><b>Submit Review By:</b> {$reviewDueDate}</p><p>You can login to <a href=\"{$reviewAssignmentUrl}\">complete this review</a> at any time.</p>'),(62,'REVIEW_EDIT','es','Revisión editada','Se ha modificado su asignación de revisión para {$contextName}','<p>Estimado/a {$recipientName},</p> <p>Un editor ha realizado cambios en su asignación de revisión para {$contextName}. Por favor, revise los detalles a continuación y no dude en contactarnos si tiene alguna pregunta.</p> <p><a href=\"{$reviewAssignmentUrl}\">\"{$submissionTitle}\"</a><br /> <b>Tipo:</b> {$reviewMethod}<br /> <b>Acepte o rechace antes de:</b> {$responseDueDate}<br /> <b>Envíe la revisión antes de:</b> {$reviewDueDate}</p> <p>Puede iniciar sesión en <a href=\"{$reviewAssignmentUrl}\">este enlace</a> para completar la revisión en cualquier momento.</p>'),(63,'REVIEW_EDIT','pt_BR','Avaliação Editada','Sua tarefa de avaliação foi alterada para {$contextName}','<p>Prezado(a) {$recipientName},</p><p>Um editor fez alterações em sua tarefa de avaliação para {$contextName}. Favor revisar os detalhes abaixo e informe-nos se tiver alguma dúvida.</p><p><a href=\"{$reviewAssignmentUrl}\">\"{$submissionTitle}\"</a><br /><b>Tipo: </b> {$reviewMethod}<br /><b>Aceitar ou recusar até:</b> {$responseDueDate}<br /><b>Enviar avaliação até:</b> {$reviewDueDate}</p ><p>Você pode fazer login para <a href=\"{$reviewAssignmentUrl}\">concluir esta avaliação</a> a qualquer momento.</p>'),(64,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has been accepted to {$contextName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that we have decided to accept your submission without further revision. After careful review, we found your submission, {$submissionTitle}, to meet or exceed our expectations. We are excited to publish your piece in {$contextName} and we thank you for choosing our press as a venue for your work.</p><p>Your submission will soon be published on the press site for {$contextName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on reaching this stage.</p><p>Your submission will now undergo copy editing and formatting to prepare it for publication.</p><p>You will shortly receive further instructions.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(65,'EDITOR_DECISION_ACCEPT','es','Envío aceptado','Se ha aceptado su envío para {$contextName}','<p>Estimado/a {$recipientName},</p><p>Nos complace informarle de que hemos decidido aceptar su envío sin más revisiones. Tras una cuidadosa revisión, hemos comprobado que su envío, {$submissionTitle}, cumple o supera nuestras expectativas. Estamos emocionados por publicar su trabajo en {$contextName} y le agradecemos que haya elegido nuestra publicación para publicar su obra.</p><p>Su envío se publicará próximamente en el sitio web de {$contextName} y le invitamos a que lo incluya en su listado de publicaciones. Reconocemos el duro trabajo que conlleva cada envío exitoso y queremos felicitarle por haber llegado a esta fase.</p><p>Su envío se someterá ahora a un proceso de corrección y formateo para prepararlo para su publicación.</p><p>En breve recibirá más instrucciones.</p><p>Si tiene cualquier pregunta no dude en contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de envíos</a>.</p><p>Saludos cordiales,</p>{$signature}'),(66,'EDITOR_DECISION_ACCEPT','pt_BR','Submissão Aceita','Sua submissão foi aceita para {$contextName}','<p>Prezado {$recipientName},</p><p>Tenho o prazer de informar que decidimos <strong>aceitar sua submissão sem revisão adicional</strong>. Após uma análise cuidadosa, descobrimos que sua submissão, {$submissionTitle}, atendeu ou superou nossas expectativas. Estamos felizes em publicar sua peça em {$contextName} e agradecemos por escolher nossa editora como local para seu trabalho..</p><p>Sua submissão será publicada em breve no site da editora {$contextName} e você está convidado a incluí-lo em sua lista de publicações. Reconhecemos o trabalho árduo de cada submissão bem-sucedida e queremos parabenizá-lo por chegar a esse estágio.</p><p>Sua submissão agora passará por edição e formatação para prepará-lo para publicação.</p><p >Em breve você receberá mais instruções.</p><p>Se você tiver alguma dúvida, entre em contato comigo em seu <a href=\"{$authorSubmissionUrl}\">painel de submissão</a>.</p><p >Atenciosamente,</p>{$signature}'),(67,'EDITOR_DECISION_SEND_TO_INTERNAL','en','Sent to Internal Review','Your submission has been sent for internal review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, {$submissionTitle}, and has decided to send it for internal review. You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission for internal review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(68,'EDITOR_DECISION_SEND_TO_INTERNAL','es','Enviar a revisión interna','Su envío se ha remitido a revisión interna','<p>Estimado/a {$recipientName},</p><p>Nos complace informarle de que un editor/a ha revisado su envío, {$submissionTitle}, y ha decidido remitirlo a una revisión interna. Le enviaremos los comentarios de los revisores/as y la información sobre los próximos pasos.</p><p>Tenga en cuenta que el hecho de remitir el envío a revisión interna no garantiza que este será publicado. Antes de aceptar el envío para su publicación consideraremos las recomendaciones de los revisores/as. Es posible que se le pida que haga revisiones y responda a los comentarios de los revisores/as antes de tomar una decisión definitiva.</p><p>Si tiene cualquier pregunta no dude en contactarnos a través de su panel de envíos.</p><p>{$signature}</p>'),(69,'EDITOR_DECISION_SEND_TO_INTERNAL','pt_BR','Enviado para Avaliação Interna','Sua submissão foi enviada para avaliação interna','<p>Prezado {$recipientName},</p><p>Tenho o prazer de informar que um editor revisou seu envio, {$submissionTitle}, e decidiu enviá-lo para avaliação interna. Você receberá nossos comentários dos avaliadores e informações sobre as próximas etapas.</p><p>Observe que enviar a submissão para avaliação interna não garante que ela será publicado. Consideraremos as recomendações dos avaliadores antes de decidir aceitar a submissão para publicação. Você pode ser solicitado a fazer revisões e responder aos comentários dos avaliadores antes que uma decisão final seja tomada.</p><p>Se você tiver alguma dúvida, entre em contato comigo no painel de submissão.</p><p>{$signature}</p>'),(70,'EDITOR_DECISION_SEND_TO_EXTERNAL','en','Sent to Review','Your submission has been sent for review','<p>Dear {$recipientName},</p><p>I am pleased to inform you that an editor has reviewed your submission, \"{$submissionTitle}\", and has decided to send it for peer review. An editor will identify qualified reviewers who will provide feedback on your submission.</p><p>{$reviewTypeDescription} You will hear from us with feedback from the reviewers and information about the next steps.</p><p>Please note that sending the submission to peer review does not guarantee that it will be published. We will consider the reviewers\' recommendations before deciding to accept the submission for publication. You may be asked to make revisions and respond to the reviewers\' comments before a final decision is made.</p><p>If you have any questions, please contact me from your submission dashboard.</p><p>{$signature}</p>'),(71,'EDITOR_DECISION_SEND_TO_EXTERNAL','es','Enviar a revisión','Su envío se ha enviado a revisión','<p>Estimado/a {$recipientName},</p><p>Me complace anunciarle que un editor/a ha revisado su envío, {$submissionTitle}, y ha decidido remitirlo a evaluación por pares. El editor/a identificará a revisores/as cualificados que aportarán comentarios sobre su envío.</p><p>{$reviewTypeDescription} Le enviaremos dichos comentarios y la información acerca de los próximos pasos.</p><p>Tenga en cuenta que el hecho de enviar su artículo a evaluación por pares no garantiza que se acabe publicando. Consideraremos las recomendaciones de los revisores/as antes de decidir si aceptamos el envío para publicarse. Podríamos solicitarle que haga revisiones y responda a los comentarios de los revisores/as antes de tomar la decisión final.</p><p>Si tiene cualquier duda puede contactar con nosotros desde su panel de control del envío.</p><p>{$signature}</p>'),(72,'EDITOR_DECISION_SEND_TO_EXTERNAL','pt_BR','Enviado para avaliação','Sua submissão foi enviada para avaliação','<p>Prezado(a) {$recipientName},</p><p>Tenho o prazer de informar que um editor avaliou sua submissão \"{$submissionTitle}\" e decidiu enviá-la para avaliação por pares. Um editor identificará avaliadores qualificados que retornarão avaliações sobre sua submissão.</p><p>{$reviewTypeDescription} Você receberá de nós os resultados das avaliações dos revisores e informações sobre as próximas etapas.</p><p>Por favor, observe que enviar a submissão para a avaliação por pares não implica que esta será publicada. Consideraremos as recomendações dos avaliadores antes de decidir aceitar a submissão para publicação. Talvez você seja solicitado a fazer modificações e responder aos comentários dos avaliadores antes que uma decisão final seja tomada.</p><p>Se você tiver alguma dúvida, por favor entre em contato comigo através do painel de submissão.</p><p>{$signature}</p>'),(73,'EDITOR_DECISION_SEND_TO_PRODUCTION','en','Sent to Production','Next steps for publishing your submission','<p>Dear {$recipientName},</p><p>I am writing from {$contextName} to let you know that the editing of your submission, \"{$submissionTitle}\", is complete. Your submission will now advance to the production stage, where the final galleys will be prepared for publication. We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(74,'EDITOR_DECISION_SEND_TO_PRODUCTION','es','Enviar a producción','Próximos pasos para publicar su envío','<p>Estimado/a {$recipientName},</p><p>Le escribo de {$contextName} para informarle de que la edición de su envío, {$submissionTitle}, ha finalizado. Ahora su envío avanzará a la fase de producción, donde prepararemos las galeradas finales para su publicación. Nos pondremos en contacto con usted si necesitamos más ayuda.</p><p>Si tiene cualquier duda contacte con nosotros desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Saludos cordiales,</p>{$signature}'),(75,'EDITOR_DECISION_SEND_TO_PRODUCTION','pt_BR','Enviado para Editoração','Próximos passos para publicar sua submissão','<p>Prezado (a) {$recipientName},</p><p>Estou escrevendo de {$contextName} para informar que a edição de texto da sua submissão \"{$submissionTitle}\" foi concluída. Sua submissão avançará agora para a fase de editoração, onde as provas finais serão preparadas para publicação. Entraremos em contato com você se precisarmos de mais assistência.</p><p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p ><p>Atenciosamente,</p>{$signature}'),(76,'EDITOR_DECISION_REVISIONS','en','Revisions Requested','Your submission has been reviewed and we encourage you to submit revisions','<p>Dear {$recipientName},</p><p>Your submission \"{$submissionTitle}\" has been reviewed and we would like to encourage you to submit revisions that address the reviewers\' comments. An editor will review these revisions and if they address the concerns adequately, your submission may be accepted for publication.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point in the reviewers\' comments and identify what changes you have made. If you find any of the reviewer\'s comments to be unjustified or inappropriate, please explain your perspective.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments at your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(77,'EDITOR_DECISION_REVISIONS','es','Revisiones solicitadas','Su envío se ha revisado y le animamos a que tramite sus revisiones','<p>Estimado/a {$recipientName},</p><p>Su envío {$submissionTitle} ha sido revisado y nos gustaría animarlo a que nos remita las revisiones que respondan a los comentarios de los revisores/as. Un editor/a examinará dichas revisiones y, si resuelven adecuadamente los problemas, su envío podrá ser aceptado para publicarse.</p><p>Los comentarios de los revisores/as se incluyen al final de este correo electrónico. Responda a cada uno de los punto de los comentarios de los revisores/as e identifique los cambios que haya hecho. Si considera que alguno de los comentarios de los revisores/as no está justificado o es inapropiado, explíquenos su punto de vista.</p><p>Cuando haya completado las revisiones puede cargar los documentos revisados, junto con la respuesta a los comentarios de los revisores/as, en su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>. Si ha cerrado la sesión puede volver a iniciarla con su nombre de usuario/a {$recipientUsername}.</p><p>Si tiene cualquier pregunta no dude en contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Quedamos a la espera de recibir su envío revisado.</p><p>Saludos cordiales,</p>{$signature}<hr><p>Se recibieron los siguientes comentarios de los revisores/as.</p>{$allReviewerComments}'),(78,'EDITOR_DECISION_REVISIONS','pt_BR','Revisões Solicitadas','Sua submissão foi avaliada e nós o(a) convidamos a submeter modificações','<p>Prezado(a) {$recipientName},</p><p>Sua submissão \"{$submissionTitle}\" foi avaliada e gostaríamos de encorajá-lo(a) a submeter modificações que abordem os comentários dos avaliadores. Um editor analisará essas modificações e, se elas abordarem as questões de forma adequada, sua submissão poderá ser aceita para publicação.</p><p>Os comentários dos avaliadores estão incluídos no final deste e-mail. Responda a cada ponto dos comentários dos avaliadores e identifique quais alterações você fez. Se você considerar que algum dos comentários do avaliador é injustificado ou inapropriado, explique seu ponto de vista.</p><p>Ao concluir suas modificações, você pode carregar os documentos modificados junto com sua resposta aos comentários dos avaliadores no < um href=\"{$authorSubmissionUrl}\">painel de submissão</a>. Se você tiver sido desconectado, poderá fazer login novamente com o nome de usuário {$recipientUsername}.</p><p>Se tiver alguma dúvida, favor me contatar pelo <a href=\"{$authorSubmissionUrl}\">painel de submissão </a>.</p><p>Aguardamos sua submissão modificada.</p><p>Atenciosamente,</p>{$signature}<hr><p>Os seguintes comentários foram recebidos dos avaliadores.</p>{$allReviewerComments}'),(79,'EDITOR_DECISION_RESUBMIT','en','Resubmit for Review','Your submission has been reviewed - please revise and resubmit','<p>Dear {$recipientName},</p><p>After reviewing your submission, \"{$submissionTitle}\", the reviewers have recommended that your submission cannot be accepted for publication in its current form. However, we would like to encourage you to submit a revised version that addresses the reviewers\' comments. Your revisions will be reviewed by an editor and may be sent out for another round of peer review.</p><p>Please note that resubmitting your work does not guarantee that it will be accepted.</p><p>The reviewers\' comments are included at the bottom of this email. Please respond to each point and identify what changes you have made. If you find any of the reviewer\'s comments inappropriate, please explain your perspective. If you have questions about the recommendations in your review, please include these in your response.</p><p>When you have completed your revisions, you can upload revised documents along with your response to the reviewers\' comments <a href=\"{$authorSubmissionUrl}\">at your submission dashboard</a>. If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We look forward to receiving your revised submission.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(80,'EDITOR_DECISION_RESUBMIT','es','Reenviar para revisión','Se ha revisado su envío. Por favor, revíselo y vuelva a enviarlo','<p>Estimado/a {$recipientName},</p><p>Tras revisar su envío, {$submissionTitle}, los revisores/as han recomendado que no puede ser aceptado para publicarse en su estado actual. No obstante, nos gustaría animarle a que nos envíe una versión revisada que tenga en cuenta los comentarios de los revisores/as. Los cambios serán revisados por el editor/a y el artículo podría ser enviado a una nueva ronda de evaluación por pares.</p><p>Tenga en cuenta que el hecho de volver a enviar su artículo no garantiza que sea aceptado.</p><p>Los comentarios de los revisores/as se incluyen al final de este correo electrónico. Por favor, responda a cada punto e identifique los cambios que haga. Si considera inapropiado algún comentario de los revisores/as, explíquenos su punto de vista. Si tiene dudas acerca de las recomendaciones en su revisión, inclúyalas en su respuesta.</p><p>Cuando haya completado las revisiones puede cargar los documentos revisados, junto con la respuesta a los comentarios de los revisores/as, en su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>. Si ha cerrado la sesión puede volver a iniciarla con su nombre de usuario/a {$recipientUsername}.</p><p>Si tiene cualquier pregunta no dude en contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Quedamos a la espera de recibir su envío revisado.</p><p>Saludos cordiales,</p>{$signature}<hr><p>Se recibieron los siguientes comentarios de los revisores/as.</p>{$allReviewerComments}'),(81,'EDITOR_DECISION_RESUBMIT','pt_BR','Ressubmeter para avaliação','Sua submissão foi avaliada - favor modificar e resubmeter','<p>Prezado(a) {$recipientName},</p><p>Depois de avaliar sua submissão \"{$submissionTitle}\" os avaliadores recomendaram que sua submissão não pode ser aceita para publicação em sua forma atual. Contudo, gostaríamos de encorajá-lo(a) a ressubmeter uma versão modificada que aborde os comentários dos avaliadores. Suas modificações serão consideradas por um editor e poderão ser enviadas para outra rodada de avaliação por pares.</p><p>Observe que ressubmeter seu trabalho não garante que ele será aceito.</p><p>Os comentários dos avaliadores estão incluídos na parte inferior deste e-mail. Por favor, responda a cada ponto e identifique quais mudanças você fez. Se você considerar algum dos comentários do avaliador inapropriado, explique o seu ponto de vista. Se você tiver dúvidas sobre as recomendações em sua avaliação, inclua-as em sua resposta.</p><p>Ao concluir suas modificações, você poderá carregar os documentos modificados junto com sua resposta aos comentários dos avaliadores <a href= \"{$authorSubmissionUrl}\">no painel de submissão</a>. Se você tiver sido desconectado, poderá fazer login novamente com o nome de usuário {$recipientUsername}.</p><p>Se tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel de avaliação </a>.</p><p>Aguardamos por sua submissão modificada.</p><p>Atenciosamente,</p>{$signature}<hr><p>Os seguintes comentários foram recebidos dos avaliadores.</p>{$allReviewerComments}'),(82,'EDITOR_DECISION_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>While we appreciate receiving your submission, we are unable to accept \"{$submissionTitle}\" for publication on the basis of the comments from reviewers.</p><p>The reviewers\' comments are included at the bottom of this email.</p><p>Thank you for submitting to {$contextName}. Although it is disappointing to have a submission declined, I hope you find the reviewers\' comments to be constructive and helpful.</p><p>You are now free to submit the work elsewhere if you choose to do so.</p><p>Kind regards,</p>{$signature}<hr><p>The following comments were received from reviewers.</p>{$allReviewerComments}'),(83,'EDITOR_DECISION_DECLINE','es','Envío rechazado','Se ha rechazado su envío','<p>Estimado/a{$recipientName},</p><p>Aunque valoramos mucho la recepción de su envío, de acuerdo con los comentarios de los revisores/as no podemos aceptar {$submissionTitle} para publicarse.</p><p>Dichos comentarios se incluyen al final de este correo electrónico.</p><p>Gracias por su envío a {$contextName}. A pesar de que es decepcionante que se rechace el envío, esperamos que los comentarios de los revisores/as le resulten constructivos y útiles.</p><p>Ahora es libre de presentar el trabajo en otro sitio si así lo desea.</p><p>Saludos cordiales,</p>{$signature}<hr><p>Se recibieron los siguientes comentarios de los revisores.</p>{$allReviewerComments}'),(84,'EDITOR_DECISION_DECLINE','pt_BR','Submissão Recusada','Sua submissão foi recusada','<p>Prezado(a) {$recipientName},</p><p>Embora apreciemos ter recebido sua submissão, não podemos aceitar \"{$submissionTitle}\" para publicação com base nos comentários dos avaliadores.</p><p>Os comentários dos avaliadores estão incluídos ao final deste e-mail.</p><p>Obrigado por sua submissão para {$contextName}. Embora seja decepcionante ter uma submissão recusada, esperamos que considere os comentários dos avaliadores construtivos e úteis.</p><p>Agora você está livre para submeter o trabalho a outras revistas, se assim o desejar.</p><p>Com os cumprimentos, </p>{$signature}<hr><p>Foram recebidos os seguintes comentários dos avaliadores.</p>{$allReviewerComments}'),(85,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined (Pre-Review)','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, \"{$submissionTitle}\", the editor has found that it does not meet our requirements for publication in {$contextName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),(86,'EDITOR_DECISION_INITIAL_DECLINE','es','Envío rechazado (antes de revisión)','Su envío ha sido rechazado','<p>Estimado/a {$recipientName},</p><p>Lamento informarlo de que, tras la revisión de su artículo, {$submissionTitle}, el editor/a ha considerado que no cumple los requisitos de publicación en {$contextName}.</p><p>Le deseo mucha suerte si decide enviarlo a otro sitio.</p><p>Saludos cordiales,</p>{$signature}'),(87,'EDITOR_DECISION_INITIAL_DECLINE','pt_BR','Submissão Recusada (Pré-Avaliação)','Sua submissão foi recusada','<p>Prezado(a) {$recipientName},</p><p>Lamento informar que, após analisar sua submissão, \"{$submissionTitle}\", o editor verificou que ela não atende aos nossos requisitos para publicação em {$contextName}.</p><p>Desejo sucesso se você considerar enviar seu trabalho para outro lugar.</p><p>Atenciosamente,</p>{$signature}'),(88,'EDITOR_RECOMMENDATION','en','Recommendation Made','Editor Recommendation','<p>Dear {$recipientName},</p><p>After considering the reviewers\' feedback, I would like to make the following recommendation regarding the submission \"{$submissionTitle}\".</p><p>My recommendation is: {$recommendation}.</p><p>Please visit the submission\'s <a href=\"{$submissionUrl}\">editorial workflow</a> to act on this recommendation.</p><p>Please feel free to contact me with any questions.</p><p>Kind regards,</p><p>{$senderName}</p>'),(89,'EDITOR_RECOMMENDATION','es','Recomendación hecha','Recomendación del editor/a','<p>Estimado/a{$recipientName},</p><p>Tras considerar los comentarios de los revisores/as, me gustaría emitir la siguiente recomendación en relación con su envío {$submissionTitle}.</p><p>Mi recomendación es: {$recommendation}.</p><p>Visite el <a href=\"{$submissionUrl}\">flujo editorial</a> del envío para actuar sobre esta recomendación.</p><p>Si tiene alguna pregunta, no dude en ponerse en contacto conmigo.</p><p>Saludos cordiales,</p><p>{$senderName}</p>'),(90,'EDITOR_RECOMMENDATION','pt_BR','Recomendação feita','Recomendação do Editor','<p>Prezado(a) {$recipientName}, </p> <p> Após considerar os comentários dos avaliadores, gostaria de fazer a seguinte recomendação em relação à submissão \"{$submissionTitle}\". </p> <p> Minha recomendação é: {$recommendation}. </p> <p> Favor visitar o <a href=\"{$submissionUrl}\">fluxo de trabalho editorial </a> para agir de acordo com esta recomendação. </p> <p> Sinta-se à vontade para entrar em contato comigo em caso de dúvidas. </p> <p> Atenciosamente, </p> <p> {$senderName} </p>'),(91,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$contextName} regarding \"{$submissionTitle}\".</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),(92,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','es','Notificar a los otros autores/as','Actualización acerca de su envío','<p>El siguiente correo electrónico fue enviado a {$submittingAuthorName} desde {$contextName} en relación con {$submissionTitle}.</p>\n<p>El motivo por el que recibe una copia de esta notificación es porque está identificado como autor/a de este envío. Las instrucciones que figuran en el siguiente mensaje se dirigen al autor/a principal del envío, {$submittingAuthorName}, por lo que no se requiere ninguna acción suya en este momento.</p>\n\n{$messageToSubmittingAuthor}'),(93,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','pt_BR','Notificar outros autores','Uma atualização sobre sua submissão','<p>O seguinte e-mail foi enviado para {$submittingAuthorName} de {$contextName} sobre \"{$submissionTitle}\".</p>\n<p>Você está recebendo uma cópia desta notificação porque foi identificado como autor da submissão. Todas as instruções na mensagem abaixo são destinadas ao autor responsável pela submissão, {$submittingAuthorName}, e nenhuma ação é necessária de sua parte neste momento.</p>\n\n{$messageToSubmittingAuthor}'),(94,'EDITOR_DECISION_NOTIFY_REVIEWERS','en','Notify Reviewers of Decision','Thank you for your review','<p>Dear {$recipientName},</p>\n<p>Thank you for completing your review of the submission, \"{$submissionTitle}\", for {$contextName}. We appreciate your time and expertise in contributing to the quality of the work that we publish. We have shared your comments with the authors, along with our other reviewers\' comments and the editor\'s decision.</p>\n<p>Based on the feedback we received, we have notified the authors of the following:</p>\n<p>{$decisionDescription}</p>\n<p>Your recommendation was considered alongside the recommendations of other reviewers before coming to a decision. Occasionally the editor\'s decision may differ from the recommendation made by one or more reviewers. The editor considers many factors, and does not take these decisions lightly. We are grateful for our reviewers\' expertise and suggestions.</p>\n<p>It has been a pleasure to work with you as a reviewer for {$contextName}, and we hope to have the opportunity to work with you again in the future.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>'),(95,'EDITOR_DECISION_NOTIFY_REVIEWERS','es','Notificar a los revisores/as de la decisión','Gracias por su revisión','<p>Estimado/a {$recipientName},</p>\n<p>Gracias por completar la revisión del envío, {$submissionTitle}, para {$contextName}. Le agradecemos su tiempo y su pericia, que contribuyen a la calidad de las obras que publicamos. Hemos compartido sus comentarios con los autores/as, junto con los comentarios de los otros revisores/as y la decisión editorial.</p>\n<p>A partir de los comentarios recibidos, hemos notificado a los autores/as lo siguiente:</p>\n<p>{$decisionDescription}</p>\n<p>Su recomendación, junto con la de otros revisores/as, se ha considerado antes de llegar a una decisión final. A veces, la decisión del editor/a puede diferir de la recomendación hecha por uno o más revisores/as. El editor/a tiene en cuenta muchos factores y no se toma estas decisiones a la ligera. Estamos muy agradecidos por la pericia y las sugerencias de nuestros revisores/as.</p>\n<p>Ha sido un placer trabajar con usted como revisor/a para {$contextName}, y esperamos tener la oportunidad de seguir haciéndolo en el futuro.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>'),(96,'EDITOR_DECISION_NOTIFY_REVIEWERS','pt_BR','Notifique os avaliadores da decisão','Obrigado pela sua avaliação','<p>Prezado(a) {$recipientName},</p>\n<p>Obrigado por concluir a avaliação da submissão \"{$submissionTitle},\"para {$contextName}. Agradecemos seu tempo e experiência em contribuir para a qualidade do trabalho que publicamos. Compartilhamos seus comentários com os autores, juntamente com os comentários de outros avaliadores e a decisão do editor.</p>\n<p>Com base nos comentários que recebemos, notificamos os autores do seguinte:</p>\n<p>{$decisionDescription}</p>\n<p>Sua recomendação foi considerada juntamente com as recomendações de outros avaliadores antes de tomarmos uma decisão. Ocasionalmente, a decisão do editor pode diferir da recomendação feita por um ou mais avaliadores. O editor considera muitos fatores e não toma essas decisões levianamente. Agradecemos a experiência e as sugestões de nossos avaliadores.</p>\n<p>Foi um prazer trabalhar com você como avaliador de {$contextName} e esperamos ter a oportunidade de trabalhar com você novamente no futuro.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>'),(97,'EDITOR_DECISION_NEW_ROUND','en','New Review Round Initiated','Your submission has been sent for another round of review','<p>Dear {$recipientName},</p>\n<p>Your revised submission, \"{$submissionTitle}\", has been sent for a new round of peer review. \nYou will hear from us with feedback from the reviewers and information about the next steps.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(98,'EDITOR_DECISION_NEW_ROUND','es','Se inició una ronda de revisión nueva','Su envío se ha tramitado a otra ronda de revisión','<p>Estimado/a {$recipientName},</p>\n<p>Su manuscrito revisado, {$submissionTitle}, se ha enviado a una ronda de evaluación por pares nueva.\nLe comunicaremos los comentarios de los revisores/as y la información sobre los próximos pasos.</p>\n<p>Si tiene cualquier pregunta puede contactar con nosotros desde el <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>\n'),(99,'EDITOR_DECISION_NEW_ROUND','pt_BR','Nova rodada de avaliação iniciada','Sua submissão foi enviada para outra rodada de avaliação','<p>Prezado(a) {$recipientName},</p>\n<p>Sua submissão modificada ,\"{$submissionTitle}\", foi enviada para uma nova rodada de avaliação por pares.\nVocê receberá notícias nossas com comentários dos avaliadores e informações sobre as próximas etapas.</p>\n<p>Se você tiver alguma dúvida, favor me contatar pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>\n'),(100,'EDITOR_DECISION_REVERT_DECLINE','en','Reinstate Declined Submission','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, \"{$submissionTitle}\", has been reversed. \nAn editor will complete the round of review and you will be notified when a \ndecision is made.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(101,'EDITOR_DECISION_REVERT_DECLINE','es','Restaurar envío rechazado','Hemos revertido la decisión de rechazar su envío','<p>Estimado/a {$recipientName},</p>\n<p>La decisión de rechazar su envío, {$submissionTitle}, se ha revertido.\nUn editor/a completará la ronda de revisión y, cuando se haya tomado una decisión, \nse le notificará.</p>\n<p>A veces se registra accidentalmente en nuestro sistema la decisión de rechazar un envío\ny esta acción debe ser revertida. Le pedimos disculpas por la confusión que esto le haya podido causar.</p>\n<p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p>\n<p>Si tiene cualquier pregunta puede contactarnos desde el <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>\n'),(102,'EDITOR_DECISION_REVERT_DECLINE','pt_BR','Reintegrar submissão recusada','Revertemos a decisão de rejeitar sua submissão','<p>Prezado(a) {$recipientName},</p>\n<p>A decisão de rejeitar sua submissão \"{$submissionTitle}\" foi revertida.\nUm editor concluirá a rodada de avaliação e você será notificado quando uma \ndecisão for tomada.</p>\n<p>Ocasionalmente, uma decisão de rejeitar uma submissão pode ser registrada acidentalmente \nem nosso sistema e deve ser revertida. Peço desculpas por qualquer confusão que isso possa ter causado.</p>\n<p>Entraremos em contato com você se precisarmos de mais assistência.</p>\n<p>Se você tiver alguma dúvida, favor entrar em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>\n'),(103,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, \"{$submissionTitle}\", has been reversed. \nAn editor will look further at your submission before deciding whether to decline \nthe submission or send it for review.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(104,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','es','Restaurar el envío rechazado sin revisión','Hemos revertido la decisión de rechazar su envío','<p>Estimado/a {$recipientName},</p>\n<p>La decisión de rechazar su envío, {$submissionTitle}, se ha revertido. \nUn editor/a estudiará su propuesta antes de decidir si la rechaza \no la envía a revisión.</p>\n<p>A veces se registra accidentalmente en nuestro sistema la decisión de rechazar un envío\ny esta acción debe ser revertida. Le pedimos disculpas por la confusión que esto le haya podido causar.</p>\n<p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p>\n<p>Si tiene cualquier pregunta puede contactarnos desde el <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>\n'),(105,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','pt_BR','Reintegrar submissão recusada sem Avaliação','Revertemos a decisão de rejeitar sua submissão','<p>Prezado(a) {$recipientName},</p>\n<p>A decisão de rejeitar sua submissão, \"{$submissionTitle}\", foi revertida.\nUm editor analisará mais detalhadamente a sua submissão antes de decidir se deve rejeitar \na submissão ou enviar para avaliação.</p>\n<p>Ocasionalmente, uma decisão de rejeitar uma submissão poderá ser registrada acidentalmente em \nnosso sistema e deve ser revertida. Peço desculpas por qualquer confusão que isso possa ter causado.</p>\n<p>Entraremos em contato com você se precisarmos de mais assistência.</p>\n<p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>\n'),(106,'EDITOR_DECISION_SKIP_REVIEW','en','Submission Accepted (Without Review)','Your submission has been sent for copyediting','<p>Dear {$recipientName},</p>\n<p>I am pleased to inform you that we have decided to accept your submission without peer review. We found your submission, {$submissionTitle}, to meet our expectations, and we do not require that work of this type undergo peer review. We are excited to publish your piece in {$contextName} and we thank you for choosing our press as a venue for your work.</p>\n<p>Your submission will soon be published on the press site for {$contextName} and you are welcome to include it in your list of publications. We recognize the hard work that goes into every successful submission and we want to congratulate you on your efforts.</p>\n<p>Your submission will now undergo copy editing and formatting to prepare it for publication. </p>\n<p>You will shortly receive further instructions.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(107,'EDITOR_DECISION_SKIP_REVIEW','es','Envío aceptado (sin revisión)','Su envío se ha remitido a edición','<p>Estimado/a {$recipientName},</p>\n<p>Nos complace informarle de que hemos decidido aceptar su envío sin revisión por pares. Consideramos que su envío, {$submissionTitle}, cumple nuestras expectativas, y no exigimos que trabajos de este tipo se sometan a revisión por pares. Estamos emocionados por publicar su trabajo en {$contextName} y le agradecemos que haya elegido nuestra publicación para publicar su obra.</p>\n<p>Su envío se publicará próximamente en el sitio web de {$contextName} y le invitamos a que lo incluya en su listado de publicaciones. Reconocemos el duro trabajo que conlleva cada envío exitoso y queremos felicitarle por su esfuerzo.</p>\n<p>Su envío se someterá ahora a un proceso de corrección y formateo para prepararlo para su publicación. </p>\n<p>En breve recibirá más instrucciones.</p>\n<p>Si tiene cualquier pregunta no dude en contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de envíos</a>.</p>\n<p>Saludos cordiales,</p>\n<p>{$signature}</p>\n'),(108,'EDITOR_DECISION_SKIP_REVIEW','pt_BR','Avaliação ignorada','Sua submissão foi enviada para edição de texto','<p>Prezado {$recipientName},</p>\n<p>Tenho o prazer de informá-lo que decidimos aceitar sua submissão sem passar pela avaliação por pares. Achamos que sua submissão, {$submissionTitle}, atendeu às nossas expectativas e não exigimos que trabalhos desse tipo passem por avaliação por pares. Estamos entusiasmados em publicar seu artigo em {$contextName} e agradecemos por escolher nossa editora como local para seu trabalho.</p>\n<p>Sua submissão será publicada em breve no site da editora para {$contextName} e você pode incluí-la em sua lista de publicações. Reconhecemos o trabalho árduo de cada submissão bem-sucedida e queremos parabenizá-lo por seus esforços.</p>\n<p>Sua submissão agora passará por edição e formatação para prepará-lo para publicação. </p>\n<p>Você receberá mais instruções em breve.</p>\n<p>Se você tiver alguma dúvida, entre em contato comigo em seu <a href=\"{$authorSubmissionUrl}\">painel de submissão</a>.</p>\n<p>Atenciosamente,</p>\n<p>{$signature}</p>\n'),(109,'EDITOR_DECISION_BACK_FROM_PRODUCTION','en','Submission Sent Back to Copyediting','Your submission has been sent back to copyediting','<p>Dear {$recipientName},</p><p>Your submission, \"{$submissionTitle}\", has been sent back to the copyediting stage, where it will undergo further copyediting and formatting to prepare it for publication.</p><p>Occasionally, a submission is sent to the production stage before it is ready for the final galleys to be prepared for publication. Your submission is still forthcoming. I apologize for any confusion.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>We will contact you if we need any further assistance.</p><p>Kind regards,</p><p>{$signature}</p>'),(110,'EDITOR_DECISION_BACK_FROM_PRODUCTION','es','Se ha retornado el envío a Edición','Su envío se ha devuelto a edición','<p>Estimado/a {$recipientName},</p><p>Su envío, {$submissionTitle}, se ha devuelto a la fase de edición, donde se someterá a una nueva corrección y formateo para prepararlo para su publicación.</p><p>A veces, un envío pasa a la fase de producción antes de estar listo para preparar las galeradas finales que se utilizarán para su publicación. Su envío aún está en preparación. Lamentamos cualquier confusión que le hayamos causado.</p><p>Si tiene cualquier duda puede contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p><p>Saludos cordiales,</p><p>{$signature}</p>'),(111,'EDITOR_DECISION_BACK_FROM_PRODUCTION','pt_BR','Submissão enviada de volta para Edição de Texto','Sua submissão foi enviada de volta para edição de texto','<p>Prezado(a) {$recipientName},</p><p>Sua submissão \"{$submissionTitle}\" foi enviada de volta para o estágio de edição de texto, onde passará por nova edição e formatação para prepará-la para publicação.</p ><p>Ocasionalmente, uma submissão é enviada para a fase de produção antes de estar pronta para as provas finais serem preparadas para publicação. Seu envio continua disponível. Peço desculpas por qualquer confusão.</p><p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel de envio</a>.</p><p>Nós entraremos em contato com você se precisarmos de mais ajuda.</p><p>Atenciosamente,</p><p>{$signature}</p>'),(112,'EDITOR_DECISION_BACK_FROM_COPYEDITING','en','Submission Sent Back from Copyediting','Your submission has been sent back to review','<p>Dear {$recipientName},</p><p>Your submission, \"{$submissionTitle}\", has been sent back to the review stage. It will undergo further review before it can be accepted for publication.</p><p>Occasionally, a decision to accept a submission will be recorded accidentally in our system and we must send it back to review. I apologize for any confusion this has caused. We will work to complete any further review quickly so that you have a final decision as soon as possible.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(113,'EDITOR_DECISION_BACK_FROM_COPYEDITING','es','Envío retornado desde Edición','Su envío se ha devuelto a revisión','<p>Estimado/a {$recipientName},</p><p>Su envío, {$submissionTitle}, se ha devuelto a la fase de revisión, donde se someterá a una nueva revisión antes de ser aceptado para su publicación.</p><p>A veces, la decisión de aceptar un envío puede registrarse accidentalmente en el sistema y por ello debemos enviarlo de nuevo a revisión. Lamentamos cualquier confusión que le hayamos causado. Nos encargaremos de completar rápidamente cualquier otra revisión para darle la decisión final lo antes posible.</p><p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p><p>Si tiene cualquier duda puede contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Saludos cordiales,</p><p>{$signature}</p>'),(114,'EDITOR_DECISION_BACK_FROM_COPYEDITING','pt_BR','Submissão enviada de volta para edição de texto','Sua submissão foi enviada de volta para avaliação','<p>Prezado (a) {$recipientName},</p><p>Sua submissão \"{$submissionTitle}\" foi enviada de volta para a fase de avaliação. Ela será submetida a uma avaliação adicional antes de ser aceita para publicação.</p><p>Ocasionalmente, uma decisão de aceitar uma submissão será registrada acidentalmente em nosso sistema e devemos enviá-lo de volta para avaliação. Peço desculpas por qualquer confusão que isso tenha causado. Trabalharemos para concluir qualquer avaliação adicional rapidamente, para que você ter uma decisão final o mais rápido possível.</p><p>Entraremos em contato com você se precisarmos de ajuda.</p><p>Se você tiver alguma dúvida, entre em contato comigo pelo <a href=\"{$authorSubmissionUrl}\">painel da submissão</a>.</p><p>Atenciosamente,</p><p>{$signature}</p>'),(115,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','en','Review Round Cancelled','A review round for your submission has been cancelled','<p>Dear {$recipientName},</p><p>We recently opened a new review round for your submission, \"{$submissionTitle}\". We are closing this review round now.</p><p>Occasionally, a decision to open a round of review will be recorded accidentally in our system and we must cancel this review round. I apologize for any confusion this may have caused.</p><p>We will contact you if we need any further assistance.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p><p>{$signature}</p>'),(116,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','es','Ronda de revisión cancelada','Se ha cancelado una ronda de revisión de su envío','<p>Estimado/a {$recipientName},</p><p>Hace poco iniciamos una ronda de revisión nueva para su envío, {$submissionTitle}. Ahora la vamos a cerrar.</p><p>A veces, la decisión de iniciar una ronda de revisión nueva puede registrarse accidentalmente en el sistema y por ello debemos cancelarla. Lamentamos cualquier confusión que le hayamos causado.</p><p>Nos pondremos en contacto con usted si necesitamos más ayuda.</p><p>Si tiene cualquier duda puede contactarnos desde su <a href=\"{$authorSubmissionUrl}\">panel de control del envío</a>.</p><p>Saludos cordiales,</p><p>{$signature}</p>'),(117,'EDITOR_DECISION_CANCEL_REVIEW_ROUND','pt_BR','Rodada de Avaliação Cancelada','Uma rodada de avaliação da sua submissão foi cancelada','<p>Prezado (a) {$recipientName},</p><p>Recentemente, abrimos uma nova rodada de avaliação para sua submissão, \"{$submissionTitle}\". Estamos encerrando esta rodada de avaliação agora.</p><p>Ocasionalmente, uma decisão de abrir uma rodada de avaliação será registrada acidentalmente em nosso sistema e devemos cancelar esta rodada de avaliação. Peço desculpas por qualquer confusão que isso possa ter causado.</p><p>Entraremos em contato com você se precisarmos de mais assistência.</p><p>Se você tiver alguma dúvida, entre em contato comigo pelo seu <a href= \"{$authorSubmissionUrl}\">painel de submissão</a>.</p><p>Atenciosamente,</p><p>{$signature}</p>'),(118,'REVISED_VERSION_NOTIFY','en','Revised Version Notification','Revised Version Uploaded','<p>Dear {$recipientName},</p><p>The author has uploaded revisions for the submission, <b>{$authorsShort} — {$submissionTitle}</b>. <p>As an assigned editor, we ask that you login and <a href=\"{$submissionUrl}\">view the revisions</a> and make a decision to accept, decline or send the submission for further review.</p><br><br>—<br>This is an automated message from <a href=\"{$contextUrl}\">{$contextName}</a>.'),(119,'REVISED_VERSION_NOTIFY','es','Notificación de versión revisada','Versión revisada cargada','<p>Estimado/a {$recipientName},</p><p>El autor/a ha cargado revisiones para el envío, <b>{$authorsShort} — {$submissionTitle}</b>. <p>Como editor/a responsable, le pedimos que inicie la sesión, <a href=\"{$submissionUrl}\">compruebe las revisiones</a> y tome la decisión de aceptar, rechazar o remitir el envío a más revisiones.</p><br><br>—<br>Este es un mensaje automático desde <a href=\"{$contextUrl}\">{$contextName}</a>.'),(120,'REVISED_VERSION_NOTIFY','pt_BR','Notificação da Versão Revisada','Versão Revisada Enviada','<p>Prezado(a) {$recipientName},</p><p>O autor enviou revisões para a submissão, <b>{$authorsShort} — {$submissionTitle}</b>. <p>Como editor designado, pedimos que você faça login e <a href=\"{$submissionUrl}\">visualize as revisões</a> e tome a decisão de aceitar, recusar ou enviar a submissão para avaliação posterior.</ p><br><br>—<br>Esta é uma mensagem automática de <a href=\"{$contextUrl}\">{$contextName}</a>.'),(121,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Editorial activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour press health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the press to view more detailed <a href=\"{$editorialStatsLink}\">editorial trends</a> and <a href=\"{$publicationStatsLink}\">published book stats</a>. A full copy of this month\'s editorial trends is attached.<br />\n<br />\nSincerely,<br />\n{$contextSignature}'),(122,'STATISTICS_REPORT_NOTIFICATION','es','Notificación de informe de estadísticas','Actividad editorial del {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nEl informe editorial de {$month}, {$year} ya está disponible. Las estadísticas fundamentales del mes son las siguientes.<br />\n<ul>\n	<li>Nuevas contribuciones este mes: {$newSubmissions}</li>\n	<li>Contribuciones rechazadas este mes: {$declinedSubmissions}</li>\n	<li>Contribuciones aceptadas este mes: {$acceptedSubmissions}</li>\n	<li>Contribuciones totales al sistema: {$totalSubmissions}</li>\n</ul>\nInicie sesión para obtener más detalles de sus <a href=\"{$editorialStatsLink}\">tendencias editoriales</a> y <a href=\"{$publicationStatsLink}\">estadísticas de libros publicados</a>. Se adjunta una copia completa de este informe correspondiente a este mes.<br />\n<br />\nSinceramente,<br />\n{$contextSignature}'),(123,'STATISTICS_REPORT_NOTIFICATION','pt_BR','Notificação do Relatório de Estatísticas','Atividade editorial de {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nO relatório da sua editora de {$month}, {$year} já se encontra disponível. As estatísticas chave deste mês encontram-se disponíveis abaixo.<br />\n<ul>\n	<li>Novas submissões este mês: {$newSubmissions}</li>\n	<li>Submissões rejeitadas este mês: {$declinedSubmissions}</li>\n	<li>Submissões aceitas este mês: {$acceptedSubmissions}</li>\n	<li>Total de submissões ao sistema: {$totalSubmissions}</li>\n</ul>\nEntre com a sua conta na editora para ver informações mais detalhadas <a href=\"{$editorialStatsLink}\">tendências editoriais</a> e <a href=\"{$publicationStatsLink}\">estatísticas de livros publicados</a>. Encontra-se anexada uma cópia das tendências editoriais deste mês.<br />\n<br />\nAtentamente,<br />\n{$contextSignature}'),(124,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),(125,'ANNOUNCEMENT','es','Nuevo aviso','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisite nuestra página web para leer el <a href=\"{$announcementUrl}\">aviso completo</a>.'),(126,'ANNOUNCEMENT','pt_BR','Novo Comunicado','{$announcementTitle}','<b> {$announcementTitle}</b> <br />\n<br />\n{$announcementSummary} <br />\n<br />\nVisite nosso site para ler o <a href=\"{$announcementUrl}\">comunicado completo</a>.'),(127,'DISCUSSION_NOTIFICATION_SUBMISSION','en','Discussion (Submission)','A message regarding {$contextName}','Please enter your message.'),(128,'DISCUSSION_NOTIFICATION_SUBMISSION','es','Discusión (envío)','Mensaje sobre {$contextName}','Introduzca su mensaje.'),(129,'DISCUSSION_NOTIFICATION_SUBMISSION','pt_BR','Discussão da Submissão','Uma mensagem sobre {$contextName}','Insira a sua mensagem por gentileza.'),(130,'DISCUSSION_NOTIFICATION_REVIEW','en','Discussion (Review)','A message regarding {$contextName}','Please enter your message.'),(131,'DISCUSSION_NOTIFICATION_REVIEW','es','Discusión (revisión)','Mensaje sobre {$contextName}','Introduzca su mensaje.'),(132,'DISCUSSION_NOTIFICATION_REVIEW','pt_BR','Discussão da Avaliação','Uma mensagem sobre {$contextName}','Insira a sua mensagem por gentileza.'),(133,'DISCUSSION_NOTIFICATION_COPYEDITING','en','Discussion (Copyediting)','A message regarding {$contextName}','Please enter your message.'),(134,'DISCUSSION_NOTIFICATION_COPYEDITING','es','Discusión (edición)','Mensaje sobre {$contextName}','Introduzca su mensaje.'),(135,'DISCUSSION_NOTIFICATION_COPYEDITING','pt_BR','Discussão da Edição de Texto','Uma mensagem sobre {$contextName}','Insira a sua mensagem por gentileza.'),(136,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$contextName}','Please enter your message.'),(137,'DISCUSSION_NOTIFICATION_PRODUCTION','es','Discusión (producción)','Mensaje sobre {$contextName}','Introduzca su mensaje.'),(138,'DISCUSSION_NOTIFICATION_PRODUCTION','pt_BR','Discussão da Editoração','Uma mensagem sobre {$contextName}','Insira a sua mensagem por gentileza.'),(139,'COPYEDIT_REQUEST','en','Request Copyedit','Submission {$submissionId} is ready to be copyedited for {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready to be copyedited:</p><p><a href\"{$submissionUrl}\">{$submissionId} — \"{$submissionTitle}\"</a><br />{$contextName}</p><p>Please follow these steps to complete this task:</p><ol><li>Click on the Submission URL below.</li><li>Open any files available under Draft Files and edit the files. Use the Copyediting Discussions area if you need to contact the editor(s) or author(s).</li><li>Save the copyedited file(s) and upload them to the Copyedited panel.</li><li>Use the Copyediting Discussions to notify the editor(s) that all files have been prepared, and that the Production process may begin.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to {$contextName}.</p><p>Kind regards,</p>{$signature}'),(140,'COPYEDIT_REQUEST','es','Solicitar corrección','El envío {$submissionId} está listo para ser corregido para {$contextAcronym}','<p>Estimado/a{$recipientName},</p><p>Hay un envío nuevo listo para ser corregido:</p><p><a href\"{$submissionUrl}\">{$submissionId} — {$submissionTitle}</a><br />{$contextName}</p><p>Siga estos pasos para completar la tarea:</p><ol><li>Haga clic en la URL del envío que encontrará más abajo.</li><li>Abra todos los archivos disponibles en \"Borradores finales\" y haga la corrección. Utilice las \"Discusiones de corrección\" si necesita contactar con editores/as o autores/as.</li><li>Guarde los archivos corregidos y cárguelos en el panel \"Corregido\".</li><li>Utilice las \"Discusiones de corrección\" para notificar a los editores/as que los documentos están preparados y que el proceso de producción podría empezar.</li></ol><p>Si no puede llevar a cabo esta tarea en este momento, o si tiene cualquier duda, contacte conmigo por favor. Gracias por su contribución a {$contextName}.</p><p>Saludos cordiales,</p>{$signature}'),(141,'COPYEDIT_REQUEST','pt_BR','Solicitar Edição de Texto','A submissão {$submissionId} está pronta para uma tarefa edição ao Editor de Texto para {$contextAcronym}','<p>Prezado(a) {$recipientName},</p><p>Uma nova submissão está pronta para ser editado:</p><p><a href\"{$submissionUrl}\">{$submissionId} — \"{$submissionTitle}\"</a><br />{$contextName}</p><p>Siga estas etapas para concluir esta tarefa:</p><ol><li>Clique na URL da submissão abaixo.</li><li>Abra todos os arquivos disponíveis em \'Arquivos para edição de texto\' e edite-os. Use a área \'Discussão da edição de texto\' se precisar entrar em contato com o(s) editor(es) ou autor(es).</li><li>Salve os arquivos editados e carregue-os no painel \'Texto editado\'.</li><li>Use as \'Discussão da edição de texto\' para notificar o(s) editor(es) de que todos os arquivos foram preparados e que o processo de Editoração pode começar.</li></ol><p>Se você não puder realizar este trabalho neste momento ou tiver alguma dúvida, entre em contato comigo. Obrigado por sua contribuição para {$contextName}.</p><p>Atenciosamente,</p>{$signature}'),(142,'EDITOR_ASSIGN_SUBMISSION','en','Assign Editor','You have been assigned as an editor on a submission to {$contextName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the editorial process.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>If you find the submission to be relevant for {$contextName}, please forward the submission to the review stage by selecting \"Send to Internal Review\" and then assign reviewers by clicking \"Add Reviewer\".</p><p>If the submission is not appropriate for this press, please decline the submission.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$contextSignature}'),(143,'EDITOR_ASSIGN_SUBMISSION','es','Asignar editor/a','Tarea editorial','<p>Estimado/a {$recipientName},</p><p>Se le ha asignado el envío siguiente para supervisarlo durante el proceso editorial.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumen</b></p>{$submissionAbstract}<p>Si considera que el envío es relevante para {$contextName}, remítalo a la fase de revisión seleccionando \"Enviar a revisión interna\" y, a continuación, asigne revisores/as haciendo clic en \"Añadir revisor/a\".</p><p>Si el envío no es adecuado para esta publicación, rechácelo.</p><p>Gracias por adelantado.</p><p>Saludos cordiales,</p>{$contextSignature}'),(144,'EDITOR_ASSIGN_SUBMISSION','pt_BR','Designar Editor','Você foi designado como editor em uma submissão para {$contextName}','{$recipientName},<br />\n<br />\nA submissão &quot;{$submissionTitle}&quot; a editora {$contextName} está sob sua responsabilidade para acompanhamento durante o processo editorial, como editor.<br />\n<br />\nPágina da submissão: {$submissionUrl}<br />\nLogin: {$recipientUsername}<br />\n<br />\nAtenciosamente,'),(145,'EDITOR_ASSIGN_REVIEW','en','Assign Editor','You have been assigned as an editor on a submission to {$contextName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the review stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a> and assign qualified reviewers. You can assign a reviewer by clicking \"Add Reviewer\".</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),(146,'EDITOR_ASSIGN_REVIEW','es','Asignar editor/a','Tarea editorial','<p>Estimado/a {$recipientName},</p><p>Se le ha asignado el envío siguiente para supervisarlo durante la fase de revisión.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumen</b></p>{$submissionAbstract}<p>Inicie la sesión para <a href=\"{$submissionUrl}\">ver el envío</a> y para asignar revisores/as cualificados. Puede asignar un revisor/a haciendo clic en \"Asignar revisor/a\".</p><p>Gracias por adelantado.</p><p>Saludos cordiales,</p>{$signature}'),(147,'EDITOR_ASSIGN_REVIEW','pt_BR','Designar Editor','Você foi designado como editor em uma submissão para {$contextName}','<p>Prezado(a) {$recipientName},</p><p>A submissão a seguir foi atribuída a você para passar pelo estágio de avaliação.</p><p><a href=\"{$submissionUrl}\">{ $submissionTitle}</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Faça login em <a href=\"{ $submissionUrl}\">visualize a submissão</a> e atribua avaliadores qualificados. Você pode atribuir um avaliador clicando em \"Adicionar Avaliador\".</p><p>Agradecemos antecipadamente.</p><p>Atenciosamente,</p>{$signature}'),(148,'EDITOR_ASSIGN_PRODUCTION','en','Assign Editor','You have been assigned as an editor on a submission to {$contextName}','<p>Dear {$recipientName},</p><p>The following submission has been assigned to you to see through the production stage.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the submission</a>. Once production-ready files are available, upload them under the <strong>Publication > Publication Formats</strong> section.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$signature}'),(149,'EDITOR_ASSIGN_PRODUCTION','es','Asignar editor/a','Tarea editorial','<p>Estimado/a {$recipientName},</p><p>Se le ha asignado el siguiente envío para que lo supervise durante la fase de producción.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumen</b></p>{$submissionAbstract}<p>Inicie la sesión para <a href=\"{$submissionUrl}\">ver el envío</a>. Cuando los archivos listos para la producción estén disponibles, cárguelos en la sección <strong>Publicación > Formatos de publicación</strong>.</p><p>Gracias por adelantado.</p><p>Saludos cordiales,</p>{$signature}'),(150,'EDITOR_ASSIGN_PRODUCTION','pt_BR','Designar Editor','Você foi designado como editor em uma submissão para {$contextName}','<p>Prezado {$recipientName},</p><p>A submissão a seguir foi atribuída a você para acompanhar o estágio de editoração.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Faça login em <a href=\"{ $submissionUrl}\">visualize a submissão</a>. Assim que os arquivos prontos para editoração estiverem disponíveis, carregue-os na seção <strong>Publicação > Formatos de publicação</strong>.</p><p>Agradecemos antecipadamente.</p><p>Atenciosamente,</p >{$signature}'),(151,'LAYOUT_REQUEST','en','Ready for Production','Submission {$submissionId} is ready for production at {$contextAcronym}','<p>Dear {$recipientName},</p><p>A new submission is ready for layout editing:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$contextName}</p><ol><li>Click on the Submission URL above.</li><li>Download the Production Ready files and use them to create the galleys according to the press\'s standards.</li><li>Upload the galleys to the Publication Formats section of the submission.</li><li>Use the Production Discussions to notify the editor that the galleys are ready.</li></ol><p>If you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.</p><p>Kind regards,</p>{$signature}'),(152,'LAYOUT_REQUEST','es','Listo para producción','El envío {$submissionId} está listo para la producción en {$contextAcronym}','<p>Estimado/a {$recipientName},</p><p>Un envío nuevo está listo para su maquetación:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$contextName}</p><ol><li>Haga clic en la URL del envío que aparece encima.</li><li>Descargue los archivos listos para la producción y utilícelos para crear las galeradas según los estándares de estilo de la publicación.</li><li>Cargue las galeradas en la sección de \"Formatos de publicación\" del envío.</li><li>Inicie una discusión de producción para notificar al editor/a que la galerada está lista.</li></ol><p>Si en este momento no puede llevar a cabo esta tarea o tiene alguna pregunta no dude en contactar con nosotros. Gracias por su contribución a esta publicación.</p><p>Saludos cordiales,</p>{$signature}'),(153,'LAYOUT_REQUEST','pt_BR','Pronto para Editoração','A submissão {$submissionId} está pronta para editoração em {$contextAcronym}','<p>Prezado(a) {$recipientName},</p><p>Uma nova submissão está pronta para a edição de layout:</p><p><a href=\"{$submissionUrl}\">{$submissionId} {$submissionTitle}</a><br />{$contextName}</p><ol><li>Clique na URL da submissão acima.</li><li>Baixe os arquivos prontos para produção e use-os para criar as provas, de acordo com os padrões da editora.</li><li>Envie as provas na seção Formatos de Publicação da submissão.</li><li>Use as Discussões da Editoração para notificar o editor de que as provas estão prontas.</li></ol><p>Se você não puder realizar esse trabalho neste momento ou tiver alguma dúvida, entre em contato comigo. Agradecemos sua contribuição para esta editora.</p><p>Atenciosamente,</p>{$signature}'),(154,'LAYOUT_COMPLETE','en','Galleys Complete','Galleys Complete','<p>Dear {$recipientName},<p><p>Galleys have now been prepared for the following submission and are ready for final review.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$contextName}</p><p>If you have any questions, please contact me.</p><p>Kind regards,</p><p>{$senderName}</p>'),(155,'LAYOUT_COMPLETE','es','Galeradas completadas','Galeradas completadas','<p>Estimado/a {$recipientName},<p><p>Ya se han preparado las galeradas del envío siguiente y están listas para su revisión final.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$contextName}</p><p>Si tiene cualquier pregunta póngase en contacte con nosotros.</p><p>Saludos cordiales,</p><p>{$senderName}</p>'),(156,'LAYOUT_COMPLETE','pt_BR','Composições Completas','Composições Concluídas','<p>Prezado(a) {$recipientName},</p><p>As provas já foram preparadas para a seguinte submissão e estão prontas para leitura de provas.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$contextName}</p><p>Se você tiver alguma dúvida, entre em contato comigo.</p><p>Atenciosamente,</p><p>{$senderName}</p>'),(157,'INDEX_REQUEST','en','Index Requested','Request Index','{$recipientName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs indexes created by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the press and use the Page Proofs file to create the galleys according to press standards.<br />\n3. Send the COMPLETE email to the editor.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$recipientUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this press.<br />\n<br />\n{$signature}'),(158,'INDEX_REQUEST','es','Índice requerido','Solicitud de índice','{$indexerName}:<br />\n<br />\nEs necesario crear índices al envío &quot;{$submissionTitle}&quot; a {$contextName} siguiendo los siguientes pasos.<br />\n1. Haga clic en la URL del envío que aparece debajo.<br />\n2. Inicie sesión en la publicación y use el fichero Galeradas de la página para crear galeradas según los estándares de publicación.<br />\n3. Envíe el correo electrónico COMPLETO al editor/a.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nURL del envío: {$submissionUrl}<br />\nNombre de usuario/a: {$indexerUsername}<br />\n<br />\nSi no puede realizar esta tarea en este momento o tiene alguna duda, póngase en contacto conmigo. Gracias por su contribución a la publicación.<br />\n<br />\n{$signature}'),(159,'INDEX_REQUEST','pt_BR','Índice Solicitado','Solicitação de índice','{$recipientName},<br />\n<br />\nA submissão &quot;{$submissionTitle}&quot;, enviada à editora {$contextName}, precisa da produção de índices conforme os seguintes passos:<br />\n1. Acesse a página da submissão abaixo.<br />\n2. Acesse o sistema e use o arquivo de provas de página para criar composições conforme o padrão.<br />\n3. Envie a mensagem CONCLUÍDA ao editor.<br />\n<br />\nPágina da editora {$contextName}: {$contextUrl}<br />\nPágina da submissão: {$submissionUrl}<br />\nLogin: {$recipientUsername}<br />\n<br />\nCaso não tenha disponibilidade para assumir esta tarefa no momento, ou em caso de dúvidas, entre em contato. Agradecemos sua contribuição aos trabalhos da editora.<br />\n<br />\n{$signature}'),(160,'INDEX_COMPLETE','en','Index Completed','Index Galleys Complete','{$recipientName}:<br />\n<br />\nIndexes have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$senderName}'),(161,'INDEX_COMPLETE','es','Índice completado','Galeradas de índice completadas','{$recipientName}:<br />\n<br />\nLos índices para el manuscrito &quot;{$submissionTitle}&quot; para {$contextName} están preparados y listos para la corrección de pruebas.<br />\n<br />\nSi tiene alguna duda, puede ponerse en contacto conmigo.<br />\n<br />\n{$signatureFullName}'),(162,'INDEX_COMPLETE','pt_BR','Índice Concluído','Composição de índices concluída','{$recipientName},<br />\n<br />\nA composição dos índices solicitados para o manuscrito &quot;{$submissionTitle}&quot;, enviado à editora {$contextName}, está concluída e pronta para leitura de provas.<br />\n<br />\nEm caso de dúvidas, entre em contato.<br />\n<br />\n{$signatureFullName}'),(163,'VERSION_CREATED','en','Version Created','A new version was created for \"{$submissionTitle}\"','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, \"{$submissionTitle}\", was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a></p><hr><p>This is an automatic email sent from <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),(164,'VERSION_CREATED','es','Versión creada','Se ha creado una versión nueva de {$submissionTitle}','<p>Estimado/a {$recipientName},</p> <p>Este es un mensaje automático para informarle que se ha creado una nueva versión de su envío, \"{$submissionTitle}\". Puede ver esta versión desde su panel de envíos en el siguiente enlace:</p> <p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a></p> <hr> <p>Este es un correo electrónico automático enviado desde <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),(165,'VERSION_CREATED','pt_BR','Versão Criada','Uma nova versão foi criada para \"{$submissionTitle}\"','<p>Prezado(a) {$recipientName}, </p><p>Esta é uma mensagem automática para informar que uma nova versão da sua submissão \"{$submissionTitle}\" foi criada. Você pode visualizar esta versão no painel da submissão no seguinte link:</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a></p><hr><p> Este é um e-mail automático enviado de <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),(166,'EDITORIAL_REMINDER','en','Editorial Reminder','Outstanding editorial tasks for {$contextName}','<p>Dear {$recipientName},</p><p>You are currently assigned to {$numberOfSubmissions} submissions in <a href=\"{$contextUrl}\">{$contextName}</a>. The following submissions are <b>waiting for your response</b>.</p>{$outstandingTasks}<p>View all of your assignments in your <a href=\"{$submissionsUrl}\">submission dashboard</a>.</p><p>If you have any questions about your assignments, please contact {$contactName} at {$contactEmail}.</p>'),(167,'EDITORIAL_REMINDER','es','Recordatorio editorial','Tareas editoriales pendientes de {$contextName}','<p>Estimado/a {$recipientName},</p><p>Actualmente tiene asignado(s) {$numberOfSubmissions} envío(s) en <a href=\"{$contextUrl}\">{$contextName}</a>. Los envíos siguientes están <b>esperando su respuesta</b>.</p>{$outstandingTasks}<p>Puede ver todas sus tareas en su <a href=\"{$submissionsUrl}\">panel de control del envío</a>.</p><p>Si tiene cualquier duda acerca de sus asignaciones contacte con {$contactName} en {$contactEmail}.</p>'),(168,'EDITORIAL_REMINDER','pt_BR','Lembrete Editorial','Tarefas editoriais excepcionais para {$contextName}','<p>Prezado(a) {$recipientName},</p><p>Você está atualmente designado(a) para {$numberOfSubmissions} submissões em <a href=\"{$contextUrl}\">{$contextName}</a>. As seguintes submissões estão <b>aguardando sua resposta</b>.</p>{$outstandingTasks}<p>Veja todas as suas tarefas em seu <a href=\"{$submissionsUrl}\">painel de submissões</a >.</p><p>Se você tiver alguma dúvida sobre suas tarefas, entre em contato com {$contactName} em {$contactEmail}.</p>'),(169,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$contextName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — \"{$submissionTitle}\"</a></p><hr><p>This is an automated email from <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),(170,'SUBMISSION_SAVED_FOR_LATER','es','Se guardó el envío para más adelante','Continuar su envío a {$contextName}','<p>Estimado/a {$recipientName},</p> <p>Los detalles de su envío han sido guardados en nuestro sistema, pero aún no ha sido enviado para su consideración. Puede regresar y completar su envío en cualquier momento siguiendo el enlace a continuación.</p> <p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — \"{$submissionTitle}\"</a></p> <hr> <p>Este es un correo electrónico automático enviado desde <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),(171,'SUBMISSION_SAVED_FOR_LATER','pt_BR','Submissão salva para mais tarde','Retome sua submissão para {$contextName}','<p>Prezado(a) {$recipientName},</p><p>Os detalhes da sua submissão foram salvos em nosso sistema, mas ainda não foram submetidos para consideração. Você pode retornar para concluir sua submissão a qualquer momento seguindo o link abaixo.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — \"{$submissionTitle}\"</a></p ><hr><p>Este é um e-mail automático de <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),(172,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: \"{$submissionTitle}\"','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),(173,'SUBMISSION_NEEDS_EDITOR','es','El envío necesita un editor/a','Un envío nuevo necesita que le asignen un editor/a: {$submissionTitle}','<p>Estimado/a {$recipientName},</p> <p>Se ha enviado el siguiente envío y no hay un editor asignado.</p> <p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a><br />{$authors}</p> <p><b>Resumen</b></p>{$submissionAbstract}<p>Por favor, asigne un editor responsable del envío haciendo clic en el título arriba y a continuación en la sección de Participantes.</p> <hr> <p>Este es un correo electrónico automático enviado desde <a href=\"{$contextUrl}\">{$contextName}</a>.</p>'),(174,'SUBMISSION_NEEDS_EDITOR','pt_BR','Editor de Necessidades de Submissão','Uma nova submissão precisa que um editor seja designado: \"{$submissionTitle}\"','<p>Prezado(a) {$recipientName},</p><p>A submissão a seguir foi enviada e não há editor designado.</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a><br />{$authors}</p><p><b>Resumo</b></p>{$submissionAbstract}<p>Por favor, designe um editor que será responsável pela submissão clicando no título acima e designando um editor na seção Participantes.</p><hr><p>Este é um e-mail automático de <a href=\"{$contextUrl}\">{$contextName}</a>. </p>'),(175,'CHANGE_EMAIL','en','Change Email Address Invitation','Confirm account contact email change request','<p>Dear {$recipientName},</p><p>You are receiving this email because someone has requested a change of your email to {$newEmail}.</p><p>If you have made this request please <a href=\"{$acceptInvitationUrl}\">confirm</a> the email change.</p><p>You can always <a href=\"{$declineInvitationUrl}\">reject</a> this email change.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Kind regards,</p>{$siteContactName}'),(176,'CHANGE_EMAIL','es','Cambiar la dirección de correo electrónico de invitación','Confirmar solicitud de cambio de correo electrónico de contacto de la cuenta','<p>Estimado/a {$recipientName},</p> <p>Ha recibido este correo electrónico porque alguien ha solicitado cambiar su dirección de correo electrónico a {$newEmail}.</p> <p>Si usted realizó esta solicitud, por favor <a href=\"{$acceptInvitationUrl}\">confirme</a> el cambio de correo electrónico.</p> <p>En cualquier momento puede <a href=\"{$declineInvitationUrl}\">rechazar</a> este cambio de correo electrónico.</p> <p>No dude en contactarme si tiene alguna pregunta sobre el envío o el proceso de revisión.</p> <p>Saludos cordiales,</p>{$siteContactName}'),(177,'CHANGE_EMAIL','pt_BR','Convite para alterar endereço de e-mail','Confirmar solicitação de alteração de e-mail de contato da conta','<p>Prezado/a {$recipientName},</p><p>Você está recebendo este e-mail porque alguém solicitou uma alteração do seu e-mail para {$newEmail}.</p><p>Se você fez esta solicitação, <a href=\"{$acceptInvitationUrl}\">confirme</a> a alteração do e-mail.</p><p>Você sempre pode <a href=\"{$declineInvitationUrl}\">rejeitar</a> esta alteração de e-mail.</p><p>Sinta-se à vontade para entrar em contato comigo caso tenha alguma dúvida sobre a submissão ou o processo de avaliação.</p><p>Atenciosamente,</p>{$siteContactName}'),(178,'ORCID_COLLECT_AUTHOR_ID','en','orcidCollectAuthorId','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(179,'ORCID_COLLECT_AUTHOR_ID','es','orcidCollectAuthorId','ORCID de envío','Estimado/a {$recipientName},\n<br/>\nSe le ha añadido como coautor/a de un artículo para {$contextName}. <br/>\nPara confirmar su autoría, añada su identificador ORCID a este envío mediante el siguiente enlace.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registrar o conectar su identificador ORCID</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Puede encontrar más información sobre ORCID en {$contextName}</a><br/>\n<br/>\nSi tiene cualquier pregunta no dude en contactarme.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(180,'ORCID_COLLECT_AUTHOR_ID','pt_BR','orcidCollectAuthorId','ORCID da submissão','Prezado(a) {$recipientName},<br>\n<br>\nVocê foi listada(o) como um coautor(a) em uma submissão de manuscrito \"{$submissionTitle}\" para {$contextName}.<br/>\nPara confirmar sua autoria, por favor, adicione sua id ORCID a esta submissão, visitando o link fornecido abaixo.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registre ou conecte seu ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">Mais informações sobre o ORCID em {$contextName}</a><br/>\n<br/>\nSe você tiver quaisquer dúvidas, por favor entre em contato comigo.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(181,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','orcidRequestAuthorAuthorization','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to verify your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),(182,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','es','orcidRequestAuthorAuthorization','Solicitando acceso de registro ORCID','Estimado/a {$recipientName},<br>\n<br>\nUsted ha sido incluido como autor en la presentación del manuscrito \"{$submissionTitle}\" a {$contextName}.\n<br>\n<br>\nPermítanos agregar su identificación ORCID a este envío y también agregar el mismo a su perfil ORCID en la publicación.<br>\nVisite el enlace al sitio web oficial de ORCID, inicie sesión con su perfil y autorice el acceso siguiendo las instrucciones.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registre o conecte su ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">Más acerca de ORCID en{$contextName}</a><br/>\n<br>\nSi tiene alguna pregunta, por favor póngase en contacto conmigo.<br>\n<br>\n{$principalContactSignature}<br>\n'),(183,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','pt_BR','orcidRequestAuthorAuthorization','Solicitando acesso ao registro ORCID','Prezado(a) {$recipientName}, <br>\n<br>\nVocê foi listado como autor na submissão do manuscrito \"{$submissionTitle}\" para {$contextName}.\n<br>\n<br>\nPermita-nos adicionar seu ID do ORCID a essa submissão e também adicioná-lo ao seu perfil do ORCID na publicação. <br>\nVisite o link para o site oficial do ORCID, faça o login com seu perfil e autorize o acesso seguindo as instruções. <br>\n<a href=\"{$authorOrcidUrl}\"> <img id =\"orcid-id-logo\" src = \"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width = \'16 \' height = \'16 \' alt = \"Ícone ORCID iD\" style = \"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\" /> Registre ou conecte seu ORCID ID </a> <br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\"> Mais sobre o ORCID em {$contextName} </a> <br/>\n<br>\nSe você tiver alguma dúvida, entre em contato comigo. <br>\n<br>\n{$principalContactSignature} <br>\n'),(184,'USER_ROLE_ASSIGNMENT_INVITATION','en','User Invited to Role Notification','You are invited to new roles','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at {$contextName}</p>        <p>At {$contextName}, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>On accepting the invite, you will be redirected to {$contextName}.</p>        <p>Feel free to contact me with any questions about the process.</p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Accept Invitation</a></td></tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Decline Invitation</a></td></tr>        </table>        <p>Kind regards,</p>        <p>{$contextName}</p>    </div></div>'),(185,'USER_ROLE_ASSIGNMENT_INVITATION','es','Notificación de usuario invitado a rol','Estás invitado a nuevos roles','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitación a un nuevo rol</h2>    </div>    <div class=\'email-content\'>        <p>Estimado/a {$recipientName},</p>        <p>En vista de su experiencia, usted ha sido invitado por {$inviterName} para asumir nuevos roles en {$contextName}</p>        <p>En {$contextName}, valoramos su privacidad. Por ello, hemos tomado medidas para garantizar el pleno cumplimiento del RGPD. Estas medidas incluyen la responsabilidad de introducir sus datos y de elegir quién puede ver qué información. Para obtener más información sobre cómo gestionamos sus datos, consulte nuestra Política de Privacidad.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>Al aceptar la invitación, serás redirigido a {$contextName}.</p>        <p>No dudes en contactarme con cualquier pregunta sobre el proceso.</p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Aceptar invitación</a></td></tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Rechazar invitación</a></td></tr>        </table>        <p>Atentamente,</p>        <p>{$contextName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),(186,'USER_ROLE_ASSIGNMENT_INVITATION','pt_BR','Notificação de Convite de Papel para Usuário','Você está convidado para novos papéis','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Convite para nova função</h2>    </div>    <div class=\'email-content\'>        <p>Prezado(a) {$recipientName},</p>        <p>Tendo em vista sua expertise, você foi convidado(a) por {$inviterName} para assumir novas funções em {$contextName}</p>        <p>Em {$contextName}, valorizamos sua privacidade. Por isso, adotamos medidas para garantir total conformidade com a GDPR. Essas medidas incluem sua responsabilidade de inserir seus próprios dados e escolher quem pode visualizar quais informações. Para mais informações sobre como tratamos seus dados, consulte nossa Política de Privacidade.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>Ao aceitar o convite, você será redirecionado(a) para {$contextName}.</p>        <p>Sinta-se à vontade para entrar em contato comigo caso tenha alguma dúvida sobre o processo.</p>        <table class=\'btn-wrap\' role=\'presentation\' border=\'0\' cellpadding=\'0\' cellspacing=\'10\'>            <tr><td class=\'btn-cell btn-accept\'  bgcolor=\'#28a745\'><a class=\'btn\' href=\'{$acceptUrl}\'>Aceitar convite</a></td></tr>            <tr><td class=\'btn-cell btn-decline\' bgcolor=\'#dc3545\'><a class=\'btn\' href=\'{$declineUrl}\'>Recusar convite</a></td></tr>        </table>        <p>Atenciosamente,</p>        <p>{$contextName}</p>    </div></div>'),(187,'USER_ROLE_END','en','User Role Ended Notification','You have been removed from a role','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Removed from a Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>Thank you very much for your participation in the role of {$roleRemoved} at {$contextName}.</p>        <p>This is a notice to let you know that you have been removed from the following role at {$contextName}: <b>{$roleRemoved}</b>.</p>        <p>Your account with {$contextName} is still active and any other roles you previously held are still active.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p>Kind regards,</p>        <p>{$contextName}</p>    </div></div>'),(188,'USER_ROLE_END','es','Notificación de finalización del rol del usuario','Ha sido removido(a) de un rol','<div class=\'email-container\'>  <div class=\'email-header\'>    <h2>Notificación de eliminación de rol</h2>  </div>  <div class=\'email-content\'>    <p>Estimado/a {$recipientName},</p>    <p>Muchas gracias por su participación en el rol de {$roleRemoved} en {$contextName}.</p>    <p>Le informamos que ha sido removido/a del siguiente rol en {$contextName}: <b>{$roleRemoved}</b>.</p>    <p>Su cuenta en {$contextName} sigue activa y cualquier otro rol que haya tenido previamente también permanece activo.</p>    <p>No dude en contactarme si tiene alguna pregunta sobre este proceso.</p>    <p>Saludos cordiales,</p>    <p>{$contextName}</p>  </div></div><style>{$emailTemplateStyle}</style>'),(189,'USER_ROLE_END','pt_BR','Notificação de término de papel de usuário','Você foi removido de um papel','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Removido de um papel</h2> </div> <div class=\'email-content\'> <p>Prezado/a {$recipientName},</p> <p>Muito obrigado por sua participação no papel de {$roleRemoved} em {$contextName}.</p> <p>Este é um aviso para informá-lo de que você foi removido do seguinte papel em {$contextName}: <b>{$roleRemoved}</b>.</p> <p>Sua conta em {$contextName} ainda está ativa e quaisquer outros papéis que você ocupou anteriormente ainda estão ativas.</p> <p>Sinta-se à vontade para entrar em contato comigo caso tenha alguma dúvida sobre o processo.</p> <p>Atenciosamente,</p> <p>{$contextName}</p> </div></div>'),(190,'USER_ROLE_MASTHEAD_UPDATE','en','User Role Masthead Visibility Update Notification','Your journal masthead visibility has been updated','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Updated role masthead visibility</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>Your journal masthead visibility for the role {$roleNameAndDates} in {$contextName} has been updated.</p>        <p>New setting: {$appearOnMasthead}</p>        <p>If you have questions about this change, please contact the journal manager.</p>        <p>Kind regards,</p>        <p>{$contextName}</p>    </div></div>'),(191,'USER_ROLE_MASTHEAD_UPDATE','es','Notificación de actualización de visibilidad del encabezado del rol de usuario','Se ha actualizado la visibilidad del encabezado de su revista','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Visibilidad actualizada del encabezado del rol</h2>    </div>    <div class=\'email-content\'>        <p>Estimado {$recipientName},</p>        <p>La visibilidad de la cabecera de su revista para el rol {$roleNameAndDates} en {$contextName} se ha actualizado.</p>        <p>Nueva configuración: {$appearOnMasthead}</p>        <p>Si tiene alguna pregunta sobre este cambio, póngase en contacto con el director de la revista.</p>        <p>Atentamente,</p>        <p>{$contextName}</p>    </div></div>'),(192,'USER_ROLE_MASTHEAD_UPDATE','pt_BR','Notificação de atualização da visibilidade da papel de usuário no expediente','Sua visibilidade no expediente da revista foi atualizada','<div class=\'email-container\'> <div class=\'email-header\'> <h2>Visibilidade no expediente do papel atualizada</h2></div><div class=\'email-content\'><p>Prezado(a) {$recipientName},</p> <p>A visibilidade de seu papel no expediente da revista, referente a {$roleNameAndDates}, em {$contextName}, foi atualizada.</p> <p>Nova configuração: {$appearOnMasthead}</p><p>Em caso de dúvidas sobre essa alteração, entre em contato com o gerente da revista.</p> <p>Atenciosamente,</p> <p>{$contextName}</p> </div></div>'),(193,'ORCID_REQUEST_UPDATE_SCOPE','en','orcidRequestUpdateScope','Requesting updated ORCID record access','Dear {$recipientName},<br>\n<br>\nYou are listed as a contributor (author or reviewer) on the manuscript submission \"{$submissionTitle}\" to {$contextName}.\n<br>\n<br>\nYou have previously authorized {$contextName} to list your ORCID id on the site, and we require updateded permissions to add your contribution to your ORCID profile.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to update your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),(194,'ORCID_REQUEST_UPDATE_SCOPE','es','orcidRequestUpdateScope','Solicitando acceso al registro actualizado ORCID','<p>Estimado/a {$recipientName},</p> <p>Usted figura como colaborador (autor o revisor) en el envío del manuscrito \"{$submissionTitle}\" para {$contextName}.</p> <p>Anteriormente, usted autorizó a {$contextName} a mostrar su identificador ORCID en el sitio, y ahora requerimos permisos actualizados para agregar su contribución a su perfil ORCID.</p> <p>Por favor, visite el siguiente enlace al sitio oficial de ORCID, inicie sesión con su cuenta y autorice el acceso siguiendo las instrucciones.</p> <p><a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"> <img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"Icono ORCID iD\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registrar o conectar su ORCID iD </a></p> <p>Haga clic aquí para actualizar su cuenta con ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}</a>.</p> <p><a href=\"{$orcidAboutUrl}\">Más información sobre ORCID en {$contextName}</a></p> <p>Si tiene alguna pregunta, por favor no dude en contactarme.</p> <p>{$principalContactSignature}</p>\n'),(195,'ORCID_REQUEST_UPDATE_SCOPE','pt_BR','orcidRequestUpdateScope','Solicitando acesso atualizado ao registro ORCID','Prezado/a {$recipientName},<br>\n<br>\nVocê está listado como um colaborador (autor ou revisor) na submissão do manuscrito \"{$submissionTitle}\" para {$contextName}.\n<br>\n<br>\nVocê autorizou anteriormente {$contextName} a listar seu identificador ORCID no site, e precisamos permissões renovadas para adicionar sua contribuição ao seu perfil ORCID.<br>\nVisite o link para o site oficial do ORCID, faça login com seu perfil e autorize o acesso seguindo as instruções.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"Ícone ORCID iD\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Registre ou conecte seu ORCID iD</a><br/>\n<br>\n<br>\nClique aqui para atualizar sua conta com ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">Mais sobre ORCID em {$contextName}</a><br/>\n<br>\n<br>\nSe você tiver alguma dúvida, favor me contatar.<br>\n<br>\n{$principalContactSignature}<br>\n');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_settings` (
  `email_template_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`email_template_setting_id`),
  UNIQUE KEY `email_templates_settings_unique` (`email_id`,`locale`,`setting_name`),
  KEY `email_templates_settings_email_id` (`email_id`),
  CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about custom email templates, including localized properties such as the subject and body.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_settings`
--

LOCK TABLES `email_templates_settings` WRITE;
/*!40000 ALTER TABLE `email_templates_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL COMMENT 'NULL if it''s system or automated event',
  `date_logged` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log_settings` (
  `event_log_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`event_log_setting_id`),
  UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`,`locale`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A log of all failed jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `feature_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `seq` bigint NOT NULL,
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `press_features_unique` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `features_submission_id` (`submission_id`),
  CONSTRAINT `features_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Information about which submissions are featured in the press.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_settings` (
  `filter_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`filter_setting_id`),
  UNIQUE KEY `filter_settings_unique` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`),
  CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about filters, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filters` (
  `filter_id` bigint NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint NOT NULL,
  `context_id` bigint DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint NOT NULL DEFAULT '0',
  `parent_filter_id` bigint DEFAULT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`),
  KEY `filters_filter_group_id` (`filter_group_id`),
  KEY `filters_context_id` (`context_id`),
  KEY `filters_parent_filter_id` (`parent_filter_id`),
  CONSTRAINT `filters_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_parent_filter_id_foreign` FOREIGN KEY (`parent_filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_settings` (
  `genre_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genre_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`genre_setting_id`),
  UNIQUE KEY `genre_settings_unique` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`),
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about file genres, including localized properties such as the genre name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `seq` bigint NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '1',
  `category` bigint NOT NULL DEFAULT '1',
  `dependent` smallint NOT NULL DEFAULT '0',
  `supplementary` smallint NOT NULL DEFAULT '0',
  `required` smallint NOT NULL DEFAULT '0' COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlight_settings`
--

DROP TABLE IF EXISTS `highlight_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highlight_settings` (
  `highlight_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `highlight_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`highlight_setting_id`),
  UNIQUE KEY `highlight_settings_unique` (`highlight_id`,`locale`,`setting_name`),
  KEY `highlight_settings_highlight_id` (`highlight_id`),
  CONSTRAINT `highlight_settings_highlight_id_foreign` FOREIGN KEY (`highlight_id`) REFERENCES `highlights` (`highlight_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about highlights, including localized properties like title and description.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlight_settings`
--

LOCK TABLES `highlight_settings` WRITE;
/*!40000 ALTER TABLE `highlight_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `highlight_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlights`
--

DROP TABLE IF EXISTS `highlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highlights` (
  `highlight_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `sequence` bigint NOT NULL,
  `url` varchar(2047) NOT NULL,
  PRIMARY KEY (`highlight_id`),
  KEY `highlights_context_id` (`context_id`),
  CONSTRAINT `highlights_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Highlights are featured items that can be presented to users, for example on the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlights`
--

LOCK TABLES `highlights` WRITE;
/*!40000 ALTER TABLE `highlights` DISABLE KEYS */;
/*!40000 ALTER TABLE `highlights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identification_codes`
--

DROP TABLE IF EXISTS `identification_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identification_codes` (
  `identification_code_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `code` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`identification_code_id`),
  KEY `identification_codes_publication_format_id` (`publication_format_id`),
  KEY `identification_codes_key` (`identification_code_id`,`publication_format_id`,`code`),
  CONSTRAINT `identification_codes_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX identification codes for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identification_codes`
--

LOCK TABLES `identification_codes` WRITE;
/*!40000 ALTER TABLE `identification_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `identification_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_ip`
--

DROP TABLE IF EXISTS `institution_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_ip` (
  `institution_ip_id` bigint NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint NOT NULL,
  `ip_end` bigint DEFAULT NULL,
  PRIMARY KEY (`institution_ip_id`),
  KEY `institution_ip_institution_id` (`institution_id`),
  KEY `institution_ip_start` (`ip_start`),
  KEY `institution_ip_end` (`ip_end`),
  CONSTRAINT `institution_ip_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Records IP address ranges and associates them with institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_ip`
--

LOCK TABLES `institution_ip` WRITE;
/*!40000 ALTER TABLE `institution_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_settings`
--

DROP TABLE IF EXISTS `institution_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_settings` (
  `institution_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`institution_setting_id`),
  UNIQUE KEY `institution_settings_unique` (`institution_id`,`locale`,`setting_name`),
  KEY `institution_settings_institution_id` (`institution_id`),
  CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about institutions, including localized properties like names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_settings`
--

LOCK TABLES `institution_settings` WRITE;
/*!40000 ALTER TABLE `institution_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions` (
  `institution_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `ror` varchar(255) DEFAULT NULL COMMENT 'ROR (Research Organization Registry) ID',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Institutions for statistics and subscriptions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitations` (
  `invitation_id` bigint NOT NULL AUTO_INCREMENT,
  `key_hash` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `inviter_id` bigint DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `status` enum('INITIALIZED','PENDING','ACCEPTED','DECLINED','CANCELLED') NOT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT 'When present, the email address of the invitation recipient; when null, user_id must be set and the email can be fetched from the users table.',
  `context_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `invitations_user_id` (`user_id`),
  KEY `invitations_inviter_id` (`inviter_id`),
  KEY `invitations_context_id` (`context_id`),
  KEY `invitations_status_context_id_user_id_type_index` (`status`,`context_id`,`user_id`,`type`),
  KEY `invitations_expiry_date_index` (`expiry_date`),
  CONSTRAINT `invitations_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_inviter_id_foreign` FOREIGN KEY (`inviter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Invitations are sent to request a person (by email) to allow them to accept or reject an operation or position, such as a board membership or a submission peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Job batches allow jobs to be collected into groups for managed processing.';
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
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='All pending or in-progress jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_file_settings` (
  `library_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`library_file_setting_id`),
  UNIQUE KEY `library_file_settings_unique` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about library files, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_file_settings`
--

LOCK TABLES `library_file_settings` WRITE;
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_files`
--

DROP TABLE IF EXISTS `library_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_files` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint NOT NULL,
  `type` smallint NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint DEFAULT NULL,
  `public_access` smallint DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markets`
--

DROP TABLE IF EXISTS `markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markets` (
  `market_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `countries_included` text,
  `countries_excluded` text,
  `regions_included` text,
  `regions_excluded` text,
  `market_date_role` varchar(40) NOT NULL,
  `market_date_format` varchar(40) NOT NULL,
  `market_date` varchar(255) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `price_type_code` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `tax_rate_code` varchar(255) DEFAULT NULL,
  `tax_type_code` varchar(255) DEFAULT NULL,
  `agent_id` bigint DEFAULT NULL,
  `supplier_id` bigint DEFAULT NULL,
  PRIMARY KEY (`market_id`),
  KEY `markets_publication_format_id` (`publication_format_id`),
  KEY `format_markets_pkey` (`market_id`,`publication_format_id`),
  CONSTRAINT `markets_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX market information for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markets`
--

LOCK TABLES `markets` WRITE;
/*!40000 ALTER TABLE `markets` DISABLE KEYS */;
/*!40000 ALTER TABLE `markets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_context`
--

DROP TABLE IF EXISTS `metrics_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_context` (
  `metrics_context_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_context_id`),
  KEY `metrics_context_load_id` (`load_id`),
  KEY `metrics_context_context_id` (`context_id`),
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views of the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_context`
--

LOCK TABLES `metrics_context` WRITE;
/*!40000 ALTER TABLE `metrics_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_daily`
--

DROP TABLE IF EXISTS `metrics_counter_submission_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_daily` (
  `metrics_counter_submission_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_daily_id`),
  UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  KEY `msd_load_id` (`load_id`),
  KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  KEY `msd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_daily`
--

LOCK TABLES `metrics_counter_submission_daily` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_institution_daily`
--

DROP TABLE IF EXISTS `metrics_counter_submission_institution_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_daily` (
  `metrics_counter_submission_institution_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_daily_id`),
  UNIQUE KEY `msid_uc_load_id_context_id_submission_id_institution_id_date` (`load_id`,`context_id`,`submission_id`,`institution_id`,`date`),
  KEY `msid_load_id` (`load_id`),
  KEY `msid_context_id` (`context_id`),
  KEY `msid_submission_id` (`submission_id`),
  KEY `msid_institution_id` (`institution_id`),
  KEY `msid_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_institution_daily`
--

LOCK TABLES `metrics_counter_submission_institution_daily` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_institution_monthly`
--

DROP TABLE IF EXISTS `metrics_counter_submission_institution_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_monthly` (
  `metrics_counter_submission_institution_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_monthly_id`),
  UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  KEY `msim_context_id` (`context_id`),
  KEY `msim_submission_id` (`submission_id`),
  KEY `msim_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_institution_monthly`
--

LOCK TABLES `metrics_counter_submission_institution_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_monthly`
--

DROP TABLE IF EXISTS `metrics_counter_submission_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_monthly` (
  `metrics_counter_submission_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_book_investigations` int NOT NULL,
  `metric_book_investigations_unique` int NOT NULL,
  `metric_book_requests` int NOT NULL,
  `metric_book_requests_unique` int NOT NULL,
  `metric_chapter_investigations` int NOT NULL,
  `metric_chapter_investigations_unique` int NOT NULL,
  `metric_chapter_requests` int NOT NULL,
  `metric_chapter_requests_unique` int NOT NULL,
  `metric_title_investigations_unique` int NOT NULL,
  `metric_title_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_monthly_id`),
  UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  KEY `msm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_monthly`
--

LOCK TABLES `metrics_counter_submission_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_series`
--

DROP TABLE IF EXISTS `metrics_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_series` (
  `metrics_series_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `series_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_series_id`),
  KEY `metrics_series_load_id` (`load_id`),
  KEY `metrics_series_context_id` (`context_id`),
  KEY `metrics_series_series_id` (`series_id`),
  KEY `metrics_series_context_id_series_id` (`context_id`,`series_id`),
  CONSTRAINT `metrics_series_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_series_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views of published submissions in each series.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_series`
--

LOCK TABLES `metrics_series` WRITE;
/*!40000 ALTER TABLE `metrics_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission`
--

DROP TABLE IF EXISTS `metrics_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission` (
  `metrics_submission_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `file_type` bigint DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_submission_id`),
  KEY `ms_load_id` (`load_id`),
  KEY `metrics_submission_context_id` (`context_id`),
  KEY `metrics_submission_submission_id` (`submission_id`),
  KEY `metrics_submission_chapter_id` (`chapter_id`),
  KEY `metrics_submission_representation_id` (`representation_id`),
  KEY `metrics_submission_submission_file_id` (`submission_file_id`),
  KEY `ms_context_id_submission_id_assoc_type_file_type` (`context_id`,`submission_id`,`assoc_type`,`file_type`),
  CONSTRAINT `metrics_submission_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission`
--

LOCK TABLES `metrics_submission` WRITE;
/*!40000 ALTER TABLE `metrics_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission_geo_daily`
--

DROP TABLE IF EXISTS `metrics_submission_geo_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_daily` (
  `metrics_submission_geo_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_daily_id`),
  UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`(80),`date`),
  KEY `msgd_load_id` (`load_id`),
  KEY `metrics_submission_geo_daily_context_id` (`context_id`),
  KEY `metrics_submission_geo_daily_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission_geo_daily`
--

LOCK TABLES `metrics_submission_geo_daily` WRITE;
/*!40000 ALTER TABLE `metrics_submission_geo_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission_geo_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission_geo_monthly`
--

DROP TABLE IF EXISTS `metrics_submission_geo_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_monthly` (
  `metrics_submission_geo_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `month` int NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_monthly_id`),
  UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`(80),`month`),
  KEY `metrics_submission_geo_monthly_context_id` (`context_id`),
  KEY `metrics_submission_geo_monthly_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission_geo_monthly`
--

LOCK TABLES `metrics_submission_geo_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_submission_geo_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission_geo_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_assignment_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_assignment_setting_id`),
  UNIQUE KEY `navigation_menu_item_assignment_settings_unique` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`),
  CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

LOCK TABLES `navigation_menu_item_assignment_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint NOT NULL,
  `navigation_menu_item_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `seq` bigint DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`),
  KEY `navigation_menu_item_assignments_parent_id` (`parent_id`),
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='Links navigation menu items to navigation menus.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,NULL,0),(2,1,2,NULL,1),(3,1,3,NULL,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_setting_id`),
  UNIQUE KEY `navigation_menu_item_settings_unique` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu items, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,1,'','titleLocaleKey','navigation.register','string'),(2,2,'','titleLocaleKey','navigation.login','string'),(3,3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,4,'','titleLocaleKey','navigation.dashboard','string'),(5,5,'','titleLocaleKey','common.viewProfile','string'),(6,6,'','titleLocaleKey','navigation.admin','string'),(7,7,'','titleLocaleKey','user.logOut','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`),
  KEY `navigation_menu_items_context_id` (`context_id`),
  CONSTRAINT `navigation_menu_items_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menu items are single elements within a navigation menu.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(2,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(3,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(6,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(7,NULL,NULL,'NMI_TYPE_USER_LOGOUT');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`),
  KEY `navigation_menus_context_id` (`context_id`),
  CONSTRAINT `navigation_menus_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES (1,NULL,'user','User Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_releases`
--

DROP TABLE IF EXISTS `new_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_releases` (
  `new_release_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  PRIMARY KEY (`new_release_id`),
  UNIQUE KEY `new_releases_unique` (`assoc_type`,`assoc_id`,`submission_id`),
  KEY `new_releases_submission_id` (`submission_id`),
  CONSTRAINT `new_releases_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Information about which submissions in the press are considered new releases.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_releases`
--

LOCK TABLES `new_releases` WRITE;
/*!40000 ALTER TABLE `new_releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Notes allow users to annotate associated entities, such as submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_settings` (
  `notification_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` bigint NOT NULL,
  `locale` varchar(28) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`notification_setting_id`),
  UNIQUE KEY `notification_settings_unique` (`notification_id`,`locale`,`setting_name`),
  KEY `notification_settings_notification_id` (`notification_id`),
  CONSTRAINT `notification_settings_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about notifications, including localized properties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `user_id` bigint NOT NULL,
  `context_id` bigint DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`),
  KEY `notification_subscription_settings_user_id` (`user_id`),
  KEY `notification_subscription_settings_context` (`context_id`),
  CONSTRAINT `notification_subscription_settings_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Which email notifications a user has chosen to unsubscribe from.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `level` bigint NOT NULL,
  `type` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id` (`context_id`),
  KEY `notifications_user_id` (`user_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id_level` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`),
  CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oai_resumption_tokens` (
  `oai_resumption_token_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `expire` bigint NOT NULL,
  `record_offset` int NOT NULL,
  `params` text,
  PRIMARY KEY (`oai_resumption_token_id`),
  UNIQUE KEY `oai_resumption_tokens_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_settings` (
  `plugin_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint DEFAULT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`plugin_setting_id`),
  UNIQUE KEY `plugin_settings_unique` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_context_id` (`context_id`),
  KEY `plugin_settings_plugin_name` (`plugin_name`),
  CONSTRAINT `plugin_settings_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES (1,'defaultthemeplugin',NULL,'enabled','1','bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `press_settings`
--

DROP TABLE IF EXISTS `press_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `press_settings` (
  `press_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `press_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`press_setting_id`),
  UNIQUE KEY `press_settings_unique` (`press_id`,`locale`,`setting_name`),
  KEY `press_settings_press_id` (`press_id`),
  CONSTRAINT `press_settings_press_id_foreign` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about presses, including localized properties such as policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `press_settings`
--

LOCK TABLES `press_settings` WRITE;
/*!40000 ALTER TABLE `press_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `press_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presses`
--

DROP TABLE IF EXISTS `presses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presses` (
  `press_id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(28) NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`press_id`),
  UNIQUE KEY `press_path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of presses managed by the system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presses`
--

LOCK TABLES `presses` WRITE;
/*!40000 ALTER TABLE `presses` DISABLE KEYS */;
/*!40000 ALTER TABLE `presses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_categories` (
  `publication_category_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`publication_category_id`),
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`),
  KEY `publication_categories_publication_id` (`publication_id`),
  KEY `publication_categories_category_id` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates publications (and thus submissions) with categories.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_categories`
--

LOCK TABLES `publication_categories` WRITE;
/*!40000 ALTER TABLE `publication_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_dates`
--

DROP TABLE IF EXISTS `publication_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_dates` (
  `publication_date_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `role` varchar(40) NOT NULL,
  `date_format` varchar(40) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`publication_date_id`),
  KEY `publication_dates_publication_format_id` (`publication_format_id`),
  KEY `format_publication_dates_pkey` (`publication_date_id`,`publication_format_id`,`role`),
  CONSTRAINT `publication_dates_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX publication dates for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_dates`
--

LOCK TABLES `publication_dates` WRITE;
/*!40000 ALTER TABLE `publication_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_format_settings`
--

DROP TABLE IF EXISTS `publication_format_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_format_settings` (
  `publication_format_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`publication_format_setting_id`),
  UNIQUE KEY `publication_format_settings_unique` (`publication_format_id`,`locale`,`setting_name`),
  KEY `publication_format_id_key` (`publication_format_id`),
  CONSTRAINT `publication_format_settings_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about publication formats, including localized properties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_format_settings`
--

LOCK TABLES `publication_format_settings` WRITE;
/*!40000 ALTER TABLE `publication_format_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_format_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_formats`
--

DROP TABLE IF EXISTS `publication_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_formats` (
  `publication_format_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `physical_format` smallint DEFAULT '1',
  `entry_key` varchar(64) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `file_size` varchar(255) DEFAULT NULL,
  `front_matter` varchar(255) DEFAULT NULL,
  `back_matter` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `height_unit_code` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `width_unit_code` varchar(255) DEFAULT NULL,
  `thickness` varchar(255) DEFAULT NULL,
  `thickness_unit_code` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `weight_unit_code` varchar(255) DEFAULT NULL,
  `product_composition_code` varchar(255) DEFAULT NULL,
  `product_form_detail_code` varchar(255) DEFAULT NULL,
  `country_manufacture_code` varchar(255) DEFAULT NULL,
  `imprint` varchar(255) DEFAULT NULL,
  `product_availability_code` varchar(255) DEFAULT NULL,
  `technical_protection_code` varchar(255) DEFAULT NULL,
  `returnable_indicator_code` varchar(255) DEFAULT NULL,
  `remote_url` varchar(2047) DEFAULT NULL,
  `url_path` varchar(64) DEFAULT NULL,
  `is_approved` smallint NOT NULL DEFAULT '0',
  `is_available` smallint NOT NULL DEFAULT '0',
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`publication_format_id`),
  KEY `publication_formats_publication_id` (`publication_id`),
  KEY `publication_formats_doi_id` (`doi_id`),
  CONSTRAINT `publication_formats_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_formats_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Publication formats are representations of a publication in a particular format, e.g. PDF, hardcover, etc. Each publication format may contain many chapters.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_formats`
--

LOCK TABLES `publication_formats` WRITE;
/*!40000 ALTER TABLE `publication_formats` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_settings` (
  `publication_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`publication_setting_id`),
  UNIQUE KEY `publication_settings_unique` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `publication_id` bigint NOT NULL AUTO_INCREMENT,
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `primary_contact_id` bigint DEFAULT NULL,
  `publication_date_type` varchar(32) DEFAULT 'pub',
  `publication_type` varchar(32) DEFAULT 'publication',
  `seq` double NOT NULL DEFAULT '0',
  `series_id` bigint DEFAULT NULL,
  `series_position` varchar(255) DEFAULT NULL,
  `submission_id` bigint NOT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_primary_contact_id` (`primary_contact_id`),
  KEY `publications_section_id` (`series_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_doi_id` (`doi_id`),
  CONSTRAINT `publications_author_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `query_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_participants` (
  `query_participant_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `query_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`query_participant_id`),
  UNIQUE KEY `query_participants_unique` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The users assigned to a discussion.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of queued (unfilled) payments, i.e. payments that have not yet been completed via an online payment system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representatives`
--

DROP TABLE IF EXISTS `representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `representatives` (
  `representative_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `role` varchar(40) NOT NULL,
  `representative_id_type` varchar(255) DEFAULT NULL,
  `representative_id_value` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `is_supplier` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`representative_id`),
  KEY `representatives_submission_id` (`submission_id`),
  KEY `format_representatives_pkey` (`representative_id`,`submission_id`),
  CONSTRAINT `representatives_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX representatives for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representatives`
--

LOCK TABLES `representatives` WRITE;
/*!40000 ALTER TABLE `representatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignment_settings`
--

DROP TABLE IF EXISTS `review_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignment_settings` (
  `review_assignment_settings_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `review_id` bigint NOT NULL COMMENT 'Foreign key referencing record in review_assignments table',
  `locale` varchar(28) DEFAULT NULL COMMENT 'Locale key.',
  `setting_name` varchar(255) NOT NULL COMMENT 'Name of settings record.',
  `setting_value` mediumtext COMMENT 'Settings value.',
  PRIMARY KEY (`review_assignment_settings_id`),
  UNIQUE KEY `review_assignment_settings_unique` (`review_id`,`locale`,`setting_name`),
  KEY `review_assignment_settings_review_id` (`review_id`),
  CONSTRAINT `review_assignment_settings_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignment_settings`
--

LOCK TABLES `review_assignment_settings` WRITE;
/*!40000 ALTER TABLE `review_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `reviewer_id` bigint NOT NULL,
  `competing_interests` text,
  `recommendation` smallint DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_considered` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint NOT NULL DEFAULT '0',
  `declined` smallint NOT NULL DEFAULT '0',
  `cancelled` smallint NOT NULL DEFAULT '0',
  `date_cancelled` datetime DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint DEFAULT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `review_method` smallint NOT NULL DEFAULT '1',
  `round` smallint NOT NULL DEFAULT '1',
  `step` smallint NOT NULL DEFAULT '1',
  `review_form_id` bigint DEFAULT NULL,
  `considered` smallint DEFAULT NULL,
  `request_resent` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignment_reviewer_round` (`review_round_id`,`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`),
  CONSTRAINT `review_assignments_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`),
  CONSTRAINT `review_assignments_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`),
  CONSTRAINT `review_assignments_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `review_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Data about peer review assignments for all submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_files` (
  `review_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_file_id`),
  UNIQUE KEY `review_files_unique` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of the submission files made available to each assigned reviewer.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_element_setting_id`),
  UNIQUE KEY `review_form_element_settings_unique` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review form elements, including localized content such as question text.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint DEFAULT NULL,
  `required` smallint DEFAULT NULL,
  `included` smallint DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_elements_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form element represents a single question on a review form.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_responses` (
  `review_form_response_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `review_id` bigint NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  PRIMARY KEY (`review_form_response_id`),
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_unique` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_settings` (
  `review_form_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_setting_id`),
  UNIQUE KEY `review_form_settings_unique` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review forms, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `seq` double DEFAULT NULL,
  `is_active` smallint DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_files` (
  `review_round_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_round_file_id`),
  UNIQUE KEY `review_round_files_unique` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_review_round_id` (`review_round_id`),
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint NOT NULL,
  `review_revision` bigint DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`),
  CONSTRAINT `review_rounds_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_suggestion_settings`
--

DROP TABLE IF EXISTS `reviewer_suggestion_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_suggestion_settings` (
  `reviewer_suggestion_id` bigint NOT NULL COMMENT 'The foreign key mapping of this setting to reviewer_suggestions table',
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `reviewer_suggestion_settings_unique` (`reviewer_suggestion_id`,`locale`,`setting_name`),
  KEY `reviewer_suggestion_settings_reviewer_suggestion_id` (`reviewer_suggestion_id`),
  KEY `reviewer_suggestion_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `reviewer_suggestion_settings_reviewer_suggestion_id_foreign` FOREIGN KEY (`reviewer_suggestion_id`) REFERENCES `reviewer_suggestions` (`reviewer_suggestion_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reviewer suggestion settings table to contain multilingual or extra information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_suggestion_settings`
--

LOCK TABLES `reviewer_suggestion_settings` WRITE;
/*!40000 ALTER TABLE `reviewer_suggestion_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewer_suggestion_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_suggestions`
--

DROP TABLE IF EXISTS `reviewer_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_suggestions` (
  `reviewer_suggestion_id` bigint NOT NULL AUTO_INCREMENT,
  `suggesting_user_id` bigint DEFAULT NULL COMMENT 'The user/author who has made the suggestion',
  `submission_id` bigint NOT NULL COMMENT 'Submission at which the suggestion was made',
  `email` varchar(255) NOT NULL COMMENT 'Suggested reviewer email address',
  `orcid_id` varchar(255) DEFAULT NULL COMMENT 'Suggested reviewer optional Orcid Id',
  `approved_at` timestamp NULL DEFAULT NULL COMMENT 'If and when the suggestion approved to add/invite suggested_reviewer',
  `approver_id` bigint DEFAULT NULL COMMENT 'The user who has approved the suggestion',
  `reviewer_id` bigint DEFAULT NULL COMMENT 'The reviewer who has been added/invited through this suggestion',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reviewer_suggestion_id`),
  KEY `reviewer_suggestions_suggesting_user_id` (`suggesting_user_id`),
  KEY `reviewer_suggestions_submission_id` (`submission_id`),
  KEY `reviewer_suggestions_approver_id_foreign` (`approver_id`),
  KEY `reviewer_suggestions_reviewer_id_foreign` (`reviewer_id`),
  CONSTRAINT `reviewer_suggestions_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `reviewer_suggestions_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `reviewer_suggestions_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `reviewer_suggestions_suggesting_user_id_foreign` FOREIGN KEY (`suggesting_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Author suggested reviewers at the submission time';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_suggestions`
--

LOCK TABLES `reviewer_suggestions` WRITE;
/*!40000 ALTER TABLE `reviewer_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewer_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ror_settings`
--

DROP TABLE IF EXISTS `ror_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ror_settings` (
  `ror_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ror_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`ror_setting_id`),
  UNIQUE KEY `ror_settings_unique` (`ror_id`,`locale`,`setting_name`),
  CONSTRAINT `ror_settings_ror_id_foreign` FOREIGN KEY (`ror_id`) REFERENCES `rors` (`ror_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about Ror registry dataset cache';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ror_settings`
--

LOCK TABLES `ror_settings` WRITE;
/*!40000 ALTER TABLE `ror_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ror_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rors`
--

DROP TABLE IF EXISTS `rors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rors` (
  `ror_id` bigint NOT NULL AUTO_INCREMENT,
  `ror` varchar(255) NOT NULL,
  `display_locale` varchar(28) NOT NULL,
  `is_active` smallint NOT NULL DEFAULT '1',
  `search_phrase` mediumtext,
  PRIMARY KEY (`ror_id`),
  UNIQUE KEY `rors_unique` (`ror`),
  KEY `rors_display_locale` (`display_locale`),
  KEY `rors_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Ror registry dataset cache';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rors`
--

LOCK TABLES `rors` WRITE;
/*!40000 ALTER TABLE `rors` DISABLE KEYS */;
/*!40000 ALTER TABLE `rors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_rights`
--

DROP TABLE IF EXISTS `sales_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_rights` (
  `sales_rights_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_format_id` bigint NOT NULL,
  `type` varchar(40) NOT NULL,
  `row_setting` smallint NOT NULL DEFAULT '0',
  `countries_included` text,
  `countries_excluded` text,
  `regions_included` text,
  `regions_excluded` text,
  PRIMARY KEY (`sales_rights_id`),
  KEY `sales_rights_publication_format_id` (`publication_format_id`),
  KEY `format_sales_rights_pkey` (`sales_rights_id`,`publication_format_id`),
  CONSTRAINT `sales_rights_publication_format_id` FOREIGN KEY (`publication_format_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='ONIX sales rights for publication formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_rights`
--

LOCK TABLES `sales_rights` WRITE;
/*!40000 ALTER TABLE `sales_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `series_id` bigint NOT NULL AUTO_INCREMENT,
  `press_id` bigint NOT NULL,
  `review_form_id` bigint DEFAULT NULL,
  `seq` double DEFAULT '0',
  `featured` smallint NOT NULL DEFAULT '0',
  `editor_restricted` smallint NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL,
  `image` text,
  `is_inactive` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `series_path` (`press_id`,`path`),
  KEY `series_press_id` (`press_id`),
  KEY `series_review_form_id` (`review_form_id`),
  CONSTRAINT `series_press_id` FOREIGN KEY (`press_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `series_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of press series, into which submissions can be organized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_categories`
--

DROP TABLE IF EXISTS `series_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_categories` (
  `series_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  UNIQUE KEY `series_categories_id` (`series_id`,`category_id`),
  KEY `series_categories_series_id` (`series_id`),
  KEY `series_categories_category_id` (`category_id`),
  CONSTRAINT `series_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `series_categories_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of relationships between series and category information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_categories`
--

LOCK TABLES `series_categories` WRITE;
/*!40000 ALTER TABLE `series_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series_settings`
--

DROP TABLE IF EXISTS `series_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series_settings` (
  `series_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `series_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`series_setting_id`),
  UNIQUE KEY `series_settings_unique` (`series_id`,`locale`,`setting_name`),
  KEY `series_settings_series_id` (`series_id`),
  CONSTRAINT `series_settings_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about series, including localized properties such as series titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series_settings`
--

LOCK TABLES `series_settings` WRITE;
/*!40000 ALTER TABLE `series_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `series_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `last_activity` int NOT NULL,
  `payload` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Session data for logged-in users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('5mnmJGHqu3bQF2JQJUqz2tjScJQppB78Q1JPbY5n',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971956,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('apwFcUzQdr9lDCPSSZNMuBCUww394K16oJOiAyDK',NULL,'172.18.0.1','curl/8.5.0',1793972491,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV3k4RVY2WjBRV2FVZXJDdHpkNkdaSXhxUWJDRVo5cnJYdnZwMkdobCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('CbSxGkdMBowAxYjYBICY0elsNY9K038jCy0g2eOL',NULL,'172.18.0.1','curl/8.5.0',1793972268,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT0FYUUJxcHVrU3hld1RVQ0VNNks0bGlNWXVSWm5Ebk9GbzUwam11dCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('cL4tkVk9W8ByW9DDgcUMtoVDOhHwa8BO1LdPMmnK',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971955,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('d7iLfA9jid9EQk1ovuSsLhi9uxj7LRO3asWPSVWD',NULL,NULL,'',1793972043,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('DqLI4lCYlCYPZ37zzmNnNNHaOZKGmB0qPmqhRc39',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971928,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('FhDw3IdnKSDVDTQi1WhLAstygagVe2FwbrAp7yjT',NULL,'172.18.0.1','curl/8.5.0',1793972273,'YToyOntzOjY6Il90b2tlbiI7czo0MDoidVlaRkdsUWJvbkdQdEthMnRPTmJSZEY1SGNqSzhXTWNseW9LM0RUMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('FVV5XIahuJ0iXQLK6H6kHISBnJtiedp3uMhRdE0M',NULL,'172.18.0.1','curl/8.5.0',1793972877,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUklIcjJpcFdncVM1YlRLUVY0SXlTZDZaOVJrQjZSYkhqNUp1SWZxciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('fYVUeyjEU5j8Vm172eDUaZCgN9zmJw3nizwS14sW',NULL,'172.18.0.1','curl/8.5.0',1793972868,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNmQwRWVFQ2RBa2pvZ2lLOG9BQ05EdUV4Um5QR2VURjlkQmpUaTF1ZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('gBHoWaRvqhoqwT90E72FSW9P4DCbPKYUFplcUuIg',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971978,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('HP27YxvBaNOhdRzhq3RYJRqQZhdc4hjjjBPcZwSN',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971953,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('hTXoY9Br8hGoxpz8dX7uR3h8sd6FsFkYxr5t0cd2',NULL,'172.18.0.1','curl/8.5.0',1793972231,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY0lnSHRPcTl4ZUp6T0taQXVIVktzYXVLbHh1ZnVLTnFhcHFzTDJ0SiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('J6YHNnWrJCsSxHqZJjKBNajstmcjfYD7p1fs6a4J',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971960,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('kMbHKXWr8hfN9iFPk8C53AifNU5FJtdbhqciFWL8',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971921,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('L81DS9CTMbvuBBMemLQSZbktdP8F9u1lqOdqQIUh',NULL,'172.18.0.1','curl/8.5.0',1793972375,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRDluOXdaS05rZTZxN0dzdGt1WFZPM0dpamM1VGxlcFZBc3ZYa2I1aCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('m0G2yDcp9E4GIUPEpFmNwyATCEp1YThsxMhwIsyS',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793972734,'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVBjdlRBcDN3TmVhYnVsZnRzcWFZdzUwb21uMjVkdUlJNmpEMkQ5YSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlcyI7fQ=='),('MAxWZAmnNDWWxxAOuhW8uQ6GVpyiCFaEIENjLVFc',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971943,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('o6DO74BkTLup9MxuK0uJJ9GspBKOULyI1SQXVaCw',NULL,NULL,'',1793972612,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('OKsl2XQq08xNWbcmDwWk5JLMkQhKikur0mcylI65',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971960,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('oQsdarjdagr9UF9ho0VImK4E23JMYNpjagUG5DJv',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971960,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('PrGGHuyoibuEnCNbfHYJb5MTLX6RSkyf6RmCGOF6',NULL,NULL,'',1793972673,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('pSBqXuZ4Tm6zG3GSkYDd4S4Bc4Ihn36tDeJ7uHa6',NULL,NULL,'',1793972683,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('qeQ9e33s1OEuYak4E1R0S77XZNXp78p7fkxmHXcF',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971961,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('rlEz40U9WCgF3YLvi2nIOsnAgdeHMua8wXD7NGUW',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971956,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('RtVVW70N3lfZIjFURzCKZ10DGoGya8rSP5C7uljb',NULL,'172.18.0.1','curl/8.5.0',1793972287,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQXFHMmRMQ1FVcnF5WXRnOGREYlZzd0JlRVE2MENWbG5SVVNCbks4RSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('Shb5erUxq8Td6KsrMbMLn5DRKRWlPkEFvaqpCaTo',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971961,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('sK4xtxu4styuOrW0u9XHnB0yIo0pjpOT6t5vjNGx',NULL,NULL,'',1793972031,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('TfQ4bSfyOH7k0FiqJIFtwt055q0EQImwIGwfsMuV',NULL,'172.18.0.1','curl/8.5.0',1793972280,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEtpWmtvZG04WlR4bEdBOXo2cjVnVThsY1dmTTlSSjFMcVZrd1hzbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlcyI7fQ=='),('TTmij868edqtl4aPVzny8L1Cug7dEcEMlFbLvUHJ',NULL,NULL,'',1793972026,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('Umum8zLHtQ4BZz9FqvX4XCvRBlXWv4GlCDhZFyXw',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971961,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('uV6WdrO9ZPQ4WgUPw1yec0ZbBcJSBug2mHO0uwtk',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971961,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('W085QaeZibnPSsRJl1dYOWVIcZOzDcp8WqRkh2vS',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971915,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('WBYMZadohPPHmjTqpj1md6UdZ9v7T0jfTUV1W4Yt',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971945,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('xlFuGusfXUd6Jia4SqGPL621dCxN0DWtAfGLZENb',NULL,'172.18.0.1','curl/8.5.0',1793972886,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRVhWVXlDRkowU3ZlQm1sVDVxaFRpV3RXT01yMjFLMzJUYlROSFNpUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('Xs3LN4Kfv42b0OuXwtlPC5hNkDufbmHNIIJftO5l',NULL,'172.18.0.1','curl/8.5.0',1793972224,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEhIcjFoYzJBcjR4MHpJWmt1V1JkU1NxOVc3ZEQ2YWZscXB6OEZqQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlcyI7fQ=='),('Y4mltnv83obeUvyUqUnx8qxA04Ukt3CpDwIzwOhM',NULL,'172.18.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:157.0) Gecko/20100101 Firefox/157.0',1793971955,'YToxOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('z4MiSnR5Bq2msVrEMPvys7KE2queWvRR2W5yHal3',NULL,'172.18.0.1','curl/8.5.0',1793972498,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYW05V3NrZEVRMHo2UklRRWgwUVpMSHBBU0xzU0xtNjRMY01nWXpaYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `site_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `redirect_context_id` bigint DEFAULT NULL COMMENT 'If not null, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(28) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_context_id` (`redirect_context_id`),
  CONSTRAINT `site_redirect_context_id_foreign` FOREIGN KEY (`redirect_context_id`) REFERENCES `presses` (`press_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='A singleton table describing basic information about the site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,NULL,'es',6,'[\"en\",\"es\",\"pt_BR\"]','[\"en\",\"es\",\"pt_BR\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `site_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_value` mediumtext,
  PRIMARY KEY (`site_setting_id`),
  UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='More data about the site, including localized properties such as its name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'contactEmail','es','admin+123@gmail.com'),(2,'contactName','en','Open Monograph Press'),(3,'contactName','es','Open Monograph Press'),(4,'contactName','pt_BR','Open Monograph Press'),(5,'compressStatsLogs','','0'),(6,'enableGeoUsageStats','','disabled'),(7,'enableInstitutionUsageStats','','0'),(8,'keepDailyUsageStats','','0'),(9,'isSiteSushiPlatform','','0'),(10,'isSushiApiPublic','','1'),(11,'disableSharedReviewerStatistics','','0'),(12,'orcidClientId','',''),(13,'orcidClientSecret','',''),(14,'orcidEnabled','','0'),(15,'themePluginPath','','default'),(16,'uniqueSiteId','','290BEB32-F01D-44E3-AF57-06CA3F58B05F');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint NOT NULL DEFAULT '0',
  `can_change_metadata` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subeditor_submission_group` (
  `subeditor_submission_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  PRIMARY KEY (`subeditor_submission_group_id`),
  UNIQUE KEY `section_editors_unique` (`context_id`,`assoc_id`,`assoc_type`,`user_id`,`user_group_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Subeditor assignments to e.g. sections and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_authors`
--

DROP TABLE IF EXISTS `submission_chapter_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapter_authors` (
  `author_id` bigint NOT NULL,
  `chapter_id` bigint NOT NULL,
  `primary_contact` smallint NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `chapter_authors_pkey` (`author_id`,`chapter_id`),
  KEY `submission_chapter_authors_author_id` (`author_id`),
  KEY `submission_chapter_authors_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_chapter_authors_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The list of authors associated with each submission chapter.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_authors`
--

LOCK TABLES `submission_chapter_authors` WRITE;
/*!40000 ALTER TABLE `submission_chapter_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_chapter_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapter_settings`
--

DROP TABLE IF EXISTS `submission_chapter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapter_settings` (
  `submission_chapter_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chapter_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`submission_chapter_setting_id`),
  UNIQUE KEY `submission_chapter_settings_unique` (`chapter_id`,`locale`,`setting_name`),
  KEY `submission_chapter_settings_chapter_id` (`chapter_id`),
  CONSTRAINT `submission_chapter_settings_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More information about submission chapters, including localized properties such as chapter titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapter_settings`
--

LOCK TABLES `submission_chapter_settings` WRITE;
/*!40000 ALTER TABLE `submission_chapter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_chapter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_chapters`
--

DROP TABLE IF EXISTS `submission_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_chapters` (
  `chapter_id` bigint NOT NULL AUTO_INCREMENT,
  `primary_contact_id` bigint DEFAULT NULL,
  `publication_id` bigint NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `source_chapter_id` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`chapter_id`),
  KEY `chapters_chapter_id` (`chapter_id`),
  KEY `submission_chapters_primary_contact_id` (`primary_contact_id`),
  KEY `submission_chapters_publication_id` (`publication_id`),
  KEY `submission_chapters_source_chapter_id` (`source_chapter_id`),
  KEY `submission_chapters_doi_id_foreign` (`doi_id`),
  CONSTRAINT `submission_chapters_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_chapters_primary_contact_id_foreign` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_chapters_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_chapters_source_chapter_id_foreign` FOREIGN KEY (`source_chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of chapters for each submission (when submissions are divided into chapters).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_chapters`
--

LOCK TABLES `submission_chapters` WRITE;
/*!40000 ALTER TABLE `submission_chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `comment_type` bigint DEFAULT NULL,
  `role_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`),
  KEY `submission_comments_author_id` (`author_id`),
  CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Comments on a submission, e.g. peer review comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id` (`submission_file_id`),
  KEY `submission_file_revisions_file_id` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Revisions map submission_file entries to files on the data store.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_file_setting_id`),
  UNIQUE KEY `submission_file_settings_unique` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_files` (
  `submission_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  `source_submission_file_id` bigint unsigned DEFAULT NULL,
  `genre_id` bigint DEFAULT NULL,
  `file_stage` bigint NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_file_id` (`file_id`),
  KEY `submission_files_genre_id` (`genre_id`),
  KEY `submission_files_uploader_user_id` (`uploader_user_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_source_submission_file_id` (`source_submission_file_id`),
  KEY `submission_files_doi_id` (`doi_id`),
  CONSTRAINT `submission_files_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_source_submission_file_id_foreign` FOREIGN KEY (`source_submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_uploader_user_id_foreign` FOREIGN KEY (`uploader_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_object_keywords` (
  `submission_search_object_keyword_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `object_id` bigint NOT NULL,
  `keyword_id` bigint NOT NULL,
  `pos` int NOT NULL COMMENT 'Word position of the keyword in the object.',
  PRIMARY KEY (`submission_search_object_keyword_id`),
  UNIQUE KEY `submission_search_object_keywords_unique` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_object_id` (`object_id`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`),
  CONSTRAINT `submission_search_object_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `submission_search_keyword_list` (`keyword_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_search_object_keywords_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `submission_search_objects` (`object_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `type` int NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_objects_submission_id` (`submission_id`),
  CONSTRAINT `submission_search_object_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of all search objects indexed in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_settings` (
  `submission_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_setting_id`),
  UNIQUE KEY `submission_settings_unique` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `submission_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `current_publication_id` bigint DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint NOT NULL DEFAULT '1',
  `locale` varchar(28) DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`),
  CONSTRAINT `temporary_files_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_institution_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_institution_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_institution_temporary_records` (
  `usage_stats_temp_institution_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `line_number` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  PRIMARY KEY (`usage_stats_temp_institution_id`),
  UNIQUE KEY `usi_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  KEY `usi_institution_id` (`institution_id`),
  CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats by institution. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_institution_temporary_records`
--

LOCK TABLES `usage_stats_institution_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_institution_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_institution_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_total_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_total_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_total_temporary_records` (
  `usage_stats_temp_total_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `canonical_url` varchar(255) NOT NULL,
  `series_id` bigint DEFAULT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint DEFAULT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_total_id`),
  KEY `ust_series_id` (`series_id`),
  KEY `ust_context_id` (`context_id`),
  KEY `ust_submission_id` (`submission_id`),
  KEY `ust_chapter_id` (`chapter_id`),
  KEY `ust_representation_id` (`representation_id`),
  KEY `ust_submission_file_id` (`submission_file_id`),
  KEY `ust_load_id_context_id_ip_ua_url` (`load_id`,`context_id`,`ip`,`user_agent`,`canonical_url`),
  CONSTRAINT `ust_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_total_temporary_records`
--

LOCK TABLES `usage_stats_total_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_total_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_total_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_item_investigations_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_item_investigations_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_investigations_temporary_records` (
  `usage_stats_temp_unique_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_item_id`),
  KEY `usii_context_id` (`context_id`),
  KEY `usii_submission_id` (`submission_id`),
  KEY `usii_chapter_id` (`chapter_id`),
  KEY `usii_representation_id` (`representation_id`),
  KEY `usii_submission_file_id` (`submission_file_id`),
  KEY `usii_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `usii_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_item_investigations_temporary_records`
--

LOCK TABLES `usage_stats_unique_item_investigations_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_item_investigations_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_item_investigations_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_item_requests_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_item_requests_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_requests_temporary_records` (
  `usage_stats_temp_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_item_id`),
  KEY `usir_context_id` (`context_id`),
  KEY `usir_submission_id` (`submission_id`),
  KEY `usir_chapter_id` (`chapter_id`),
  KEY `usir_representation_id` (`representation_id`),
  KEY `usir_submission_file_id` (`submission_file_id`),
  KEY `usir_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `usir_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_item_requests_temporary_records`
--

LOCK TABLES `usage_stats_unique_item_requests_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_title_investigations_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_title_investigations_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_title_investigations_temporary_records` (
  `usage_stats_temp_unique_investigations_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_investigations_id`),
  KEY `usti_context_id` (`context_id`),
  KEY `usti_submission_id` (`submission_id`),
  KEY `usti_chapter_id` (`chapter_id`),
  KEY `usti_representation_id` (`representation_id`),
  KEY `usti_submission_file_id` (`submission_file_id`),
  KEY `usti_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `usti_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usti_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_title_investigations_temporary_records`
--

LOCK TABLES `usage_stats_unique_title_investigations_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_title_investigations_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_title_investigations_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_title_requests_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_title_requests_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_title_requests_temporary_records` (
  `usage_stats_temp_unique_requests_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `chapter_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_requests_id`),
  KEY `ustr_context_id` (`context_id`),
  KEY `ustr_submission_id` (`submission_id`),
  KEY `ustr_chapter_id` (`chapter_id`),
  KEY `ustr_representation_id` (`representation_id`),
  KEY `ustr_submission_file_id` (`submission_file_id`),
  KEY `ustr_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `ustr_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `submission_chapters` (`chapter_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_formats` (`publication_format_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ustr_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats for unique title requests. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_title_requests_temporary_records`
--

LOCK TABLES `usage_stats_unique_title_requests_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_title_requests_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_title_requests_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_settings` (
  `user_group_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_group_setting_id`),
  UNIQUE KEY `user_group_settings_unique` (`user_group_id`,`locale`,`setting_name`),
  KEY `user_group_settings_user_group_id` (`user_group_id`),
  CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about user groups, including localized properties such as the name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_stage` (
  `user_group_stage_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `stage_id` bigint NOT NULL,
  PRIMARY KEY (`user_group_stage_id`),
  UNIQUE KEY `user_group_stage_unique` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`),
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Which stages of the editorial workflow the user_groups can access.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `role_id` bigint NOT NULL,
  `is_default` smallint NOT NULL DEFAULT '0',
  `show_title` smallint NOT NULL DEFAULT '1',
  `permit_self_registration` smallint NOT NULL DEFAULT '0',
  `permit_metadata_edit` smallint NOT NULL DEFAULT '0',
  `permit_settings` smallint NOT NULL DEFAULT '0',
  `masthead` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_role_id` (`role_id`),
  CONSTRAINT `user_groups_context_id` FOREIGN KEY (`context_id`) REFERENCES `presses` (`press_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,NULL,1,1,1,0,0,1,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interests` (
  `user_interest_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `controlled_vocab_entry_id` bigint NOT NULL,
  PRIMARY KEY (`user_interest_id`),
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`),
  KEY `user_interests_user_id` (`user_id`),
  KEY `user_interests_controlled_vocab_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `user_interests_controlled_vocab_entry_id_foreign` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE,
  CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `user_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_setting_id`),
  UNIQUE KEY `user_settings_unique` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='More data about users, including localized properties like their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,1,'es','familyName','admin'),(2,1,'es','givenName','admin');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `user_user_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `masthead` smallint DEFAULT NULL,
  PRIMARY KEY (`user_user_group_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Maps users to their assigned user_groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1,1,'2026-11-06 13:27:25',NULL,NULL);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) NOT NULL DEFAULT '[]',
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `must_change_password` smallint DEFAULT NULL,
  `auth_id` bigint DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` smallint DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$12$HYIyaFJDLNU1BbPZg84z.eoqi935/anR1M9VQ9/XofkUiuK4WWOaO','admin+123@gmail.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2026-11-06 13:27:25',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `version_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `major` int NOT NULL DEFAULT '0' COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int NOT NULL DEFAULT '0' COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int NOT NULL DEFAULT '0' COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int NOT NULL DEFAULT '0' COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itself',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `versions_unique` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.metadata','dc11','',0,0),(2,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.pubIds','urn','\\APP\\plugins\\pubIds\\urn\\URNPubIdPlugin',0,0),(3,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(4,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(5,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(6,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(7,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(8,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.generic','usageEvent','',0,1),(9,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.generic','htmlMonographFile','HtmlMonographFilePlugin',1,0),(10,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(11,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(12,1,2,0,0,'2026-11-06 13:27:29',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(13,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(14,0,1,0,0,'2026-11-06 13:27:29',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(15,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(16,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(17,1,2,0,0,'2026-11-06 13:27:29',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(18,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(19,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.themes','default','DefaultThemePlugin',1,0),(20,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.importexport','csv','',0,0),(21,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.importexport','users','',0,0),(22,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.importexport','onix30','',0,0),(23,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.importexport','native','',0,0),(24,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.oaiMetadataFormats','dc','',0,0),(25,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.paymethod','manual','',0,0),(26,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.paymethod','paypal','',0,0),(27,2,0,1,0,'2026-11-06 13:27:29',1,'plugins.reports','reviewReport','',0,0),(28,1,0,0,0,'2026-11-06 13:27:29',1,'plugins.reports','monographReport','',0,0),(29,3,5,0,5,'2026-11-06 13:36:57',1,'core','omp','',0,1);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-06 13:48:14
