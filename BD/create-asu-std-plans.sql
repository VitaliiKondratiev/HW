-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.1.30-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.5.0.5261
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных asu-std-plans
CREATE DATABASE IF NOT EXISTS `asu-std-plans` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `asu-std-plans`;

-- Дамп структуры для таблица asu-std-plans.akgrp
CREATE TABLE IF NOT EXISTS `akgrp` (
  `id_akadem_grup` int(11) NOT NULL AUTO_INCREMENT,
  `rus_index_ak_gr` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `ua_index_ak_gr` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `id_kafedry` int(11) DEFAULT NULL,
  `god_sozdania` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `id_uch_plan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_akadem_grup`),
  KEY `FK_akgrp_kaf` (`id_kafedry`),
  KEY `FK_akgrp_uchpl` (`id_uch_plan`),
  CONSTRAINT `FK_akgrp_kaf` FOREIGN KEY (`id_kafedry`) REFERENCES `kaf` (`id_kafedry`),
  CONSTRAINT `FK_akgrp_uchpl` FOREIGN KEY (`id_uch_plan`) REFERENCES `uchpl` (`id_uch_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.akgrp: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `akgrp` DISABLE KEYS */;
INSERT INTO `akgrp` (`id_akadem_grup`, `rus_index_ak_gr`, `ua_index_ak_gr`, `id_kafedry`, `god_sozdania`, `id_uch_plan`) VALUES
	(1, 'ÐšÐ-34Ð±', 'ÐšÐ-34Ð±', 3, '2018', NULL);
/*!40000 ALTER TABLE `akgrp` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.fklt
CREATE TABLE IF NOT EXISTS `fklt` (
  `id_fakulteta` int(11) NOT NULL AUTO_INCREMENT,
  `rus_nazva_fak` char(30) CHARACTER SET utf8 NOT NULL,
  `ua_nazva_fak` char(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_fakulteta`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.fklt: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `fklt` DISABLE KEYS */;
INSERT INTO `fklt` (`id_fakulteta`, `rus_nazva_fak`, `ua_nazva_fak`) VALUES
	(45, 'ÐŸÑ€Ð¾Ð³Ñ€Ð°Ð¼Ð½Ð¾Ð¹ Ð¸Ð½Ð¶ÐµÐ', 'ÐŸÑ€Ð¾Ð³Ñ€Ð°Ð¼Ð½Ð° Ñ–Ð½Ð¶ÐµÐ½Ð'),
	(46, 'ÐÐ²Ñ‚Ð¾Ð¼Ð°Ñ‚Ð¸Ð·Ð¸Ñ€Ð¾Ð²Ð°Ð½', 'ÐÐ²Ñ‚Ð¾Ð¼Ð°Ñ‚Ð¸Ð·Ð¾Ð²Ð°Ð½Ñ– Ñ');
/*!40000 ALTER TABLE `fklt` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.indzad
CREATE TABLE IF NOT EXISTS `indzad` (
  `id_individ_zad` int(11) NOT NULL,
  `nazv_ind_zad` char(60) CHARACTER SET utf8 DEFAULT NULL,
  `kratkoe_nazv_ind_zad` char(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_individ_zad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.indzad: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `indzad` DISABLE KEYS */;
INSERT INTO `indzad` (`id_individ_zad`, `nazv_ind_zad`, `kratkoe_nazv_ind_zad`) VALUES
	(0, 'Ð’Ñ–Ð´ÑÑƒÑ‚Ð½Ñ”', 'Ð’Ñ–Ð´Ñ'),
	(1, 'Ð Ð¾Ð·Ñ€Ð°Ñ…ÑƒÐ½ÐºÐ¾Ð²Ðµ Ð·Ð°Ð²Ð´Ð°Ð½Ð½Ñ', 'Ð Ð—'),
	(2, 'Ð Ð¾Ð·Ñ€Ð°Ñ…ÑƒÐ½ÐºÐ¾Ð²Ð¾-Ð³Ñ€Ð°Ñ„Ñ–Ñ‡Ð½Ðµ Ð·Ð°Ð²Ð´Ð°Ð½Ð½Ñ', 'Ð Ð“Ð—'),
	(3, 'Ð ÐµÑ„ÐµÑ€Ð°Ñ‚', 'Ð '),
	(4, 'ÐšÑƒÑ€ÑÐ¾Ð²Ð¸Ð¹ Ð¿Ñ€Ð¾ÐµÐºÑ‚', 'ÐšÐŸ'),
	(5, 'ÐšÑƒÑ€ÑÐ¾Ð²Ð° Ñ€Ð¾Ð±Ð¾Ñ‚Ð°', 'ÐšÐ ');
/*!40000 ALTER TABLE `indzad` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.indzadpr
CREATE TABLE IF NOT EXISTS `indzadpr` (
  `id_uch_plan` int(11) NOT NULL,
  `id_predmeta` int(11) NOT NULL,
  `id_individ_zad` int(11) NOT NULL,
  PRIMARY KEY (`id_predmeta`,`id_uch_plan`),
  KEY `FK_indzadpr_indzad` (`id_individ_zad`),
  KEY `FK_indzadpr_uchpl` (`id_uch_plan`),
  CONSTRAINT `FK_indzadpr_indzad` FOREIGN KEY (`id_individ_zad`) REFERENCES `indzad` (`id_individ_zad`),
  CONSTRAINT `FK_indzadpr_predm` FOREIGN KEY (`id_predmeta`) REFERENCES `predm` (`id_predmeta`),
  CONSTRAINT `FK_indzadpr_uchpl` FOREIGN KEY (`id_uch_plan`) REFERENCES `uchpl` (`id_uch_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.indzadpr: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `indzadpr` DISABLE KEYS */;
INSERT INTO `indzadpr` (`id_uch_plan`, `id_predmeta`, `id_individ_zad`) VALUES
	(18, 27, 0),
	(18, 31, 0),
	(18, 32, 0),
	(18, 33, 0),
	(18, 34, 0),
	(18, 35, 1),
	(18, 28, 3),
	(18, 29, 3),
	(18, 30, 3);
/*!40000 ALTER TABLE `indzadpr` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.kaf
CREATE TABLE IF NOT EXISTS `kaf` (
  `id_kafedry` int(11) NOT NULL AUTO_INCREMENT,
  `rus_krat_nazva_kaf` char(10) CHARACTER SET utf8 NOT NULL,
  `ua_krat_nazva_kaf` char(10) CHARACTER SET utf8 NOT NULL,
  `rus_nazva_kaf` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `ua_nazva_kaf` char(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_fakulteta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kafedry`),
  KEY `FK_kaf_fklt` (`id_fakulteta`),
  CONSTRAINT `FK_kaf_fklt` FOREIGN KEY (`id_fakulteta`) REFERENCES `fklt` (`id_fakulteta`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.kaf: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `kaf` DISABLE KEYS */;
INSERT INTO `kaf` (`id_kafedry`, `rus_krat_nazva_kaf`, `ua_krat_nazva_kaf`, `rus_nazva_kaf`, `ua_nazva_kaf`, `id_fakulteta`) VALUES
	(3, 'ÐŸÐ˜Ð˜Ð¢Ð£', 'ÐŸÐ†Ð†Ð¢Ð£', 'ÐŸÑ€Ð¾Ð³Ñ€Ð°Ð¼Ð½Ð°Ñ Ð¸Ð¶ÐµÐ½ÐµÑ€Ð¸Ñ', 'ÐŸÑ€Ð¾Ð³Ñ€Ð°Ð¼Ð½Ð° Ñ–Ð½Ð¶ÐµÐ½ÐµÑ€Ñ–Ñ', 45),
	(4, 'Ð¡Ð£', 'Ð¡Ð£', 'Ð¡Ñ‚Ñ€Ð°Ñ‚ÐµÐ³Ð¸Ñ‡ÐµÑÐºÐ¾Ð³Ð¾ ÑƒÐ¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ñ', 'Ð¡Ñ‚Ñ€Ð°Ñ‚ÐµÐ³Ñ–Ñ‡Ð½Ð¾Ð³Ð¾ ÑƒÐ¿Ñ€Ð°Ð²Ð»Ñ–Ð½Ð½Ñ', 45);
/*!40000 ALTER TABLE `kaf` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.kval_lvl
CREATE TABLE IF NOT EXISTS `kval_lvl` (
  `id_kval_lvl` int(11) NOT NULL AUTO_INCREMENT,
  `ua_nazva_kval_lvl` char(100) DEFAULT NULL,
  PRIMARY KEY (`id_kval_lvl`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы asu-std-plans.kval_lvl: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `kval_lvl` DISABLE KEYS */;
INSERT INTO `kval_lvl` (`id_kval_lvl`, `ua_nazva_kval_lvl`) VALUES
	(5, 'Ð±Ð°ÐºÐ°Ð»Ð°Ð²Ñ€ Ð· Ñ–Ð½Ð¶ÐµÐ½ÐµÑ€Ñ–Ñ— Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð½Ð¾Ð³Ð¾ Ð·Ð°Ð±ÐµÐ·Ð¿ÐµÑ‡ÐµÐ½Ð½Ñ');
/*!40000 ALTER TABLE `kval_lvl` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.napr
CREATE TABLE IF NOT EXISTS `napr` (
  `id_napravlenia` int(11) NOT NULL AUTO_INCREMENT,
  `ua_nazva_napr` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `shifr_napr` char(15) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_napravlenia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.napr: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `napr` DISABLE KEYS */;
INSERT INTO `napr` (`id_napravlenia`, `ua_nazva_napr`, `shifr_napr`) VALUES
	(4, 'Ð†Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ñ–Ð¹Ð½Ñ– Ñ‚ÐµÑ…Ð½Ð¾Ð»Ð¾Ð³Ñ–Ñ—', '12');
/*!40000 ALTER TABLE `napr` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.predm
CREATE TABLE IF NOT EXISTS `predm` (
  `id_predmeta` int(11) NOT NULL AUTO_INCREMENT,
  `ua_nazva_predmeta` char(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_predmeta`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.predm: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `predm` DISABLE KEYS */;
INSERT INTO `predm` (`id_predmeta`, `ua_nazva_predmeta`) VALUES
	(27, 'Ð£ÐºÑ€Ð°Ñ—Ð½ÑÑŒÐºÐ° Ð¼Ð¾Ð²Ð°'),
	(28, 'Ð†ÑÑ‚Ð¾Ñ€Ñ–Ñ Ð£ÐºÑ€Ð°Ñ—Ð½Ð¸'),
	(29, 'Ð†ÑÑ‚Ð¾Ñ€Ñ–Ñ ÑƒÐºÑ€Ð°Ñ—Ð½ÑÑŒÐºÐ¾Ñ— ÐºÑƒÐ»ÑŒÑ‚ÑƒÑ€Ð¸'),
	(30, 'Ð¤Ñ–Ð»Ð¾ÑÐ¾Ñ„Ñ–Ñ'),
	(31, 'Ð•ÐºÐ¾Ð»Ð¾Ð³Ñ–Ñ'),
	(32, 'Ð†ÑÑ‚Ð¾Ñ€Ñ–Ñ Ð½Ð°ÑƒÐºÐ¸ Ñ– Ñ‚ÐµÑ…Ð½Ñ–ÐºÐ¸'),
	(33, 'ÐžÑ€Ð³Ð°Ð½Ñ–Ð·Ð°Ñ†Ñ–Ñ Ð±Ð°Ð· Ð´Ð°Ð½Ð¸Ñ…'),
	(34, 'Ð¡Ñ‚ÐµÐº Ñ‚ÐµÑ…Ð½Ð¾Ð»Ð¾Ð³Ñ–Ñ— Java EE'),
	(35, 'Ð”Ð¸ÑÐºÑ€ÐµÑ‚Ð½Ð° Ð¼Ð°Ñ‚ÐµÐ¼Ð°Ñ‚Ð¸ÐºÐ° (Ñ‡Ð°ÑÑ‚Ð¸Ð½Ð° 1)');
/*!40000 ALTER TABLE `predm` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.spez
CREATE TABLE IF NOT EXISTS `spez` (
  `id_specialnosti` int(11) NOT NULL AUTO_INCREMENT,
  `rus_nazva_specialnosti` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `ua_nazva_specialnosti` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `id_napravlenia` int(11) DEFAULT NULL,
  `shifr_specialnosti` char(15) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_specialnosti`),
  KEY `FK_spez_napr` (`id_napravlenia`),
  CONSTRAINT `FK_spez_napr` FOREIGN KEY (`id_napravlenia`) REFERENCES `napr` (`id_napravlenia`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.spez: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `spez` DISABLE KEYS */;
INSERT INTO `spez` (`id_specialnosti`, `rus_nazva_specialnosti`, `ua_nazva_specialnosti`, `id_napravlenia`, `shifr_specialnosti`) VALUES
	(18, 'Ð˜Ð½Ð¶ÐµÐ½ÐµÑ€Ð¸Ñ Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð¼Ð½Ð¾Ð³Ð¾ Ð¾Ð±ÐµÑÐ¿ÐµÑ‡ÐµÐ½Ð¸Ñ', 'Ð†Ð½Ð¶ÐµÐ½ÐµÑ€Ñ–Ñ Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð½Ð¾Ð³Ð¾ Ð·Ð°Ð±ÐµÐ·Ð¿ÐµÑ‡ÐµÐ½Ð½Ñ', 4, '121');
/*!40000 ALTER TABLE `spez` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.spezz
CREATE TABLE IF NOT EXISTS `spezz` (
  `id_spec_z` int(11) NOT NULL AUTO_INCREMENT,
  `rus_nazva_spec_z` char(100) DEFAULT NULL,
  `ua_nazva_spec_z` char(100) DEFAULT NULL,
  `id_specialnosti` int(11) DEFAULT NULL,
  `shifr_spec_z` char(20) DEFAULT NULL,
  PRIMARY KEY (`id_spec_z`),
  KEY `FK_SPEZZ_spez` (`id_specialnosti`),
  CONSTRAINT `FK_SPEZZ_spez` FOREIGN KEY (`id_specialnosti`) REFERENCES `spez` (`id_specialnosti`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы asu-std-plans.spezz: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `spezz` DISABLE KEYS */;
INSERT INTO `spezz` (`id_spec_z`, `rus_nazva_spec_z`, `ua_nazva_spec_z`, `id_specialnosti`, `shifr_spec_z`) VALUES
	(8, 'Ð˜Ð½Ð¶ÐµÐ½ÐµÑ€Ð¸Ñ Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð¼Ð½Ð¾Ð³Ð¾ Ð¾Ð±ÐµÑÐ¿ÐµÑ‡ÐµÐ½Ð¸Ñ', 'Ð†Ð½Ð¶ÐµÐ½ÐµÑ€Ñ–Ñ Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð½Ð¾Ð³Ð¾ Ð·Ð°Ð±ÐµÐ·Ð¿ÐµÑ‡ÐµÐ½Ð½Ñ', 18, '121');
/*!40000 ALTER TABLE `spezz` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.uchpl
CREATE TABLE IF NOT EXISTS `uchpl` (
  `vveden` date DEFAULT NULL,
  `id_kval_lvl` int(11) DEFAULT NULL,
  `id_uch_plan` int(11) NOT NULL AUTO_INCREMENT,
  `id_kafedry` int(11) DEFAULT NULL,
  `id_spec_z` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_uch_plan`),
  KEY `FK_uchpl_kaf` (`id_kafedry`),
  KEY `FK_uchpl_spezz` (`id_spec_z`),
  KEY `FK_uchpl_kval_lvl` (`id_kval_lvl`),
  CONSTRAINT `FK_uchpl_kaf` FOREIGN KEY (`id_kafedry`) REFERENCES `kaf` (`id_kafedry`) ON UPDATE CASCADE,
  CONSTRAINT `FK_uchpl_kval_lvl` FOREIGN KEY (`id_kval_lvl`) REFERENCES `kval_lvl` (`id_kval_lvl`) ON UPDATE CASCADE,
  CONSTRAINT `FK_uchpl_spezz` FOREIGN KEY (`id_spec_z`) REFERENCES `spezz` (`id_spec_z`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.uchpl: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `uchpl` DISABLE KEYS */;
INSERT INTO `uchpl` (`vveden`, `id_kval_lvl`, `id_uch_plan`, `id_kafedry`, `id_spec_z`) VALUES
	('2016-09-01', 5, 18, 3, 8);
/*!40000 ALTER TABLE `uchpl` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.uchplpr
CREATE TABLE IF NOT EXISTS `uchplpr` (
  `id_uch_plan` int(11) NOT NULL,
  `semestr` int(11) NOT NULL,
  `id_predmeta` int(11) NOT NULL,
  `id_vida_kontrolya` int(11) NOT NULL,
  `creditov` int(11) NOT NULL,
  `chasov` int(11) NOT NULL,
  `shifr_opp` char(25) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_vida_kontrolya`,`id_predmeta`,`semestr`,`id_uch_plan`),
  KEY `FK_uchplpr_uchpl` (`id_uch_plan`),
  KEY `FK_uchplpr_predm` (`id_predmeta`),
  CONSTRAINT `FK_UCHPLPR_vidkont` FOREIGN KEY (`id_vida_kontrolya`) REFERENCES `vidkont` (`id_vida_kontrolya`),
  CONSTRAINT `FK_uchplpr_predm` FOREIGN KEY (`id_predmeta`) REFERENCES `predm` (`id_predmeta`),
  CONSTRAINT `FK_uchplpr_uchpl` FOREIGN KEY (`id_uch_plan`) REFERENCES `uchpl` (`id_uch_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.uchplpr: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `uchplpr` DISABLE KEYS */;
INSERT INTO `uchplpr` (`id_uch_plan`, `semestr`, `id_predmeta`, `id_vida_kontrolya`, `creditov`, `chasov`, `shifr_opp`) VALUES
	(18, 2, 27, 1, 3, 32, 'Ð—ÐŸ 1'),
	(18, 1, 28, 1, 3, 32, 'Ð—ÐŸ 2'),
	(18, 4, 29, 1, 2, 32, 'Ð—ÐŸ 3'),
	(18, 3, 30, 1, 3, 32, 'Ð—ÐŸ 5'),
	(18, 3, 33, 1, 4, 64, 'ÐŸÐŸ 9'),
	(18, 5, 34, 1, 5, 64, 'ÐŸÐŸÑ 16'),
	(18, 6, 31, 3, 2, 32, 'Ð—ÐŸ 7'),
	(18, 1, 32, 3, 2, 32, 'ÐŸÐŸ 1'),
	(18, 2, 35, 3, 4, 64, 'Ð—ÐŸ 12');
/*!40000 ALTER TABLE `uchplpr` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.uchplzn
CREATE TABLE IF NOT EXISTS `uchplzn` (
  `semestr` int(11) NOT NULL,
  `id_uch_plan` int(11) NOT NULL,
  `id_predmeta` int(11) NOT NULL,
  `id_vida_zanyatiy` int(11) NOT NULL,
  `chasov` int(11) DEFAULT NULL,
  PRIMARY KEY (`semestr`,`id_vida_zanyatiy`,`id_predmeta`,`id_uch_plan`),
  KEY `FK_uchplzn_vidzan` (`id_vida_zanyatiy`),
  KEY `FK_uchplzn_uchpl` (`id_uch_plan`),
  KEY `FK_uchplzn_predm` (`id_predmeta`),
  CONSTRAINT `FK_uchplzn_predm` FOREIGN KEY (`id_predmeta`) REFERENCES `predm` (`id_predmeta`),
  CONSTRAINT `FK_uchplzn_uchpl` FOREIGN KEY (`id_uch_plan`) REFERENCES `uchpl` (`id_uch_plan`),
  CONSTRAINT `FK_uchplzn_vidzan` FOREIGN KEY (`id_vida_zanyatiy`) REFERENCES `vidzan` (`id_vida_zanyatiy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.uchplzn: ~26 rows (приблизительно)
/*!40000 ALTER TABLE `uchplzn` DISABLE KEYS */;
INSERT INTO `uchplzn` (`semestr`, `id_uch_plan`, `id_predmeta`, `id_vida_zanyatiy`, `chasov`) VALUES
	(1, 18, 28, 1, 16),
	(1, 18, 32, 1, 16),
	(1, 18, 28, 2, 16),
	(1, 18, 32, 3, 16),
	(1, 18, 28, 4, 58),
	(1, 18, 32, 4, 28),
	(2, 18, 35, 1, 48),
	(2, 18, 27, 3, 32),
	(2, 18, 35, 3, 16),
	(2, 18, 27, 4, 58),
	(2, 18, 35, 4, 56),
	(3, 18, 30, 1, 16),
	(3, 18, 33, 1, 32),
	(3, 18, 33, 2, 32),
	(3, 18, 30, 3, 16),
	(3, 18, 30, 4, 58),
	(3, 18, 33, 4, 56),
	(4, 18, 29, 1, 16),
	(4, 18, 29, 3, 16),
	(4, 18, 29, 4, 28),
	(5, 18, 34, 1, 32),
	(5, 18, 34, 2, 32),
	(5, 18, 34, 4, 86),
	(6, 18, 31, 1, 16),
	(6, 18, 31, 3, 16),
	(6, 18, 31, 4, 28);
/*!40000 ALTER TABLE `uchplzn` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.vidkont
CREATE TABLE IF NOT EXISTS `vidkont` (
  `id_vida_kontrolya` int(11) NOT NULL,
  `ua_nazva_kontrolya` char(30) CHARACTER SET utf8 NOT NULL,
  `ua_krat_nazva_kontrolya` char(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_vida_kontrolya`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.vidkont: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `vidkont` DISABLE KEYS */;
INSERT INTO `vidkont` (`id_vida_kontrolya`, `ua_nazva_kontrolya`, `ua_krat_nazva_kontrolya`) VALUES
	(1, 'Ð†ÑÐ¿Ð¸Ñ‚', 'Ð†ÑÐ¿Ð¸Ñ‚'),
	(2, 'ÐšÑƒÑ€ÑÐ¾Ð²Ð° Ñ€Ð¾Ð±Ð¾Ñ‚Ð°', 'ÐšÐ '),
	(3, 'Ð—Ð°Ð»Ñ–Ðº', 'Ð—Ð°Ð»Ñ–Ðº'),
	(4, 'Ð”Ð¸Ñ„ÐµÑ€ÐµÐ½Ñ†Ñ–Ð¹Ð¾Ð²Ð°Ð½Ð¸', 'Ð”Ð¸Ñ„. Ð·'),
	(5, 'ÐŸÑ€Ð°ÐºÑ‚Ð¸ÐºÐ°', 'ÐŸÑ€Ð°ÐºÑ‚');
/*!40000 ALTER TABLE `vidkont` ENABLE KEYS */;

-- Дамп структуры для таблица asu-std-plans.vidzan
CREATE TABLE IF NOT EXISTS `vidzan` (
  `id_vida_zanyatiy` int(11) NOT NULL,
  `ua_nazva_vida_zanyatiy` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `ua_krat_nazva_vida_zanyatiy` char(25) CHARACTER SET utf8 DEFAULT NULL,
  `eng_name` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_vida_zanyatiy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы asu-std-plans.vidzan: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `vidzan` DISABLE KEYS */;
INSERT INTO `vidzan` (`id_vida_zanyatiy`, `ua_nazva_vida_zanyatiy`, `ua_krat_nazva_vida_zanyatiy`, `eng_name`) VALUES
	(1, 'Ð›ÐµÐºÑ†Ñ–Ñ', 'Ð›Ðº', 'lection'),
	(2, 'ÐŸÑ€Ð°ÐºÑ‚Ð¸Ñ‡Ð½Ðµ Ð·Ð°Ð½ÑÑ‚Ñ‚Ñ', 'ÐŸÑ€', 'labs'),
	(3, 'Ð›Ð°Ð±Ð¾Ñ€Ð°Ñ‚Ð¾Ñ€Ð½Ðµ Ð·Ð°Ð½ÑÑ‚Ñ‚Ñ', 'Ð›Ð°Ð±', 'prac'),
	(4, 'Ð¡Ð°Ð¼Ð¾ÑÑ‚Ñ–Ð¹Ð½Ð° Ñ€Ð¾Ð±Ð¾Ñ‚Ð°', 'Ð¡Ð ', 'samost');
/*!40000 ALTER TABLE `vidzan` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
