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


-- Дамп структуры базы данных maindb
CREATE DATABASE IF NOT EXISTS `maindb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `maindb`;

-- Дамп структуры для таблица maindb.adres
CREATE TABLE IF NOT EXISTS `adres` (
  `Kod_adresa` int(11) NOT NULL AUTO_INCREMENT,
  `Index` char(15) NOT NULL,
  `Kod_ulici` int(11) NOT NULL,
  `Nomer_stroeniya` char(5) NOT NULL,
  `Kod_tipa_stroeniya` int(11) NOT NULL,
  `Nomer_pomesheniya` char(5) NOT NULL,
  `Kod_tipa_pomesheniya` int(11) NOT NULL,
  PRIMARY KEY (`Kod_adresa`),
  KEY `FK_adres_tip_stroeniya` (`Kod_tipa_stroeniya`),
  KEY `FK_adres_tip_pomesheniya` (`Kod_tipa_pomesheniya`),
  KEY `FK_adres_ulici` (`Kod_ulici`),
  CONSTRAINT `FK_adres_tip_pomesheniya` FOREIGN KEY (`Kod_tipa_pomesheniya`) REFERENCES `tip_pomesheniya` (`Kod_tipa_pomesheniya`),
  CONSTRAINT `FK_adres_tip_stroeniya` FOREIGN KEY (`Kod_tipa_stroeniya`) REFERENCES `tip_stroeniya` (`kod_tipa_stroeniya`),
  CONSTRAINT `FK_adres_ulici` FOREIGN KEY (`Kod_ulici`) REFERENCES `ulici` (`Kod_ulici`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.adres: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `adres` DISABLE KEYS */;
/*!40000 ALTER TABLE `adres` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.adres_studenta
CREATE TABLE IF NOT EXISTS `adres_studenta` (
  `Kod_adresa` int(11) NOT NULL,
  `Kod_studenta` int(11) NOT NULL,
  `Kod_vida_adresa` int(11) NOT NULL,
  KEY `FK_adres_studenta_st` (`Kod_studenta`),
  KEY `FK_adres_studenta_adres` (`Kod_adresa`),
  KEY `FK_adres_studenta_vidi_adresov` (`Kod_vida_adresa`),
  CONSTRAINT `FK_adres_studenta_adres` FOREIGN KEY (`Kod_adresa`) REFERENCES `adres` (`Kod_adresa`),
  CONSTRAINT `FK_adres_studenta_st` FOREIGN KEY (`Kod_studenta`) REFERENCES `st` (`ST_ID`),
  CONSTRAINT `FK_adres_studenta_vidi_adresov` FOREIGN KEY (`Kod_vida_adresa`) REFERENCES `vidi_adresov` (`Kod_vida_adresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.adres_studenta: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `adres_studenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `adres_studenta` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.akgrp
CREATE TABLE IF NOT EXISTS `akgrp` (
  `AKGRP1` int(11) NOT NULL AUTO_INCREMENT,
  `AKGRP2R` char(10) DEFAULT NULL,
  `AKGRP2U` char(10) DEFAULT NULL,
  `AKGRP3` int(11) DEFAULT NULL,
  `AKGRP4` int(11) DEFAULT NULL,
  `AKGRP5` int(11) DEFAULT NULL,
  `AKGRP6` year(4) DEFAULT NULL,
  `AKGRP7` int(11) DEFAULT NULL,
  `AKGRP8` int(11) DEFAULT NULL,
  PRIMARY KEY (`AKGRP1`),
  KEY `FK_akgrp_prep` (`AKGRP3`),
  KEY `FK_akgrp_kaf` (`AKGRP5`),
  KEY `FK_akgrp_stpns` (`AKGRP8`),
  KEY `FK_akgrp_uchpl` (`AKGRP7`),
  CONSTRAINT `FK_akgrp_kaf` FOREIGN KEY (`AKGRP5`) REFERENCES `kaf` (`KAF1`),
  CONSTRAINT `FK_akgrp_prep` FOREIGN KEY (`AKGRP3`) REFERENCES `prep` (`PREP1`),
  CONSTRAINT `FK_akgrp_stpns` FOREIGN KEY (`AKGRP8`) REFERENCES `stpns` (`STPNS1`),
  CONSTRAINT `FK_akgrp_uchpl` FOREIGN KEY (`AKGRP7`) REFERENCES `uchpl` (`id_uch_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.akgrp: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `akgrp` DISABLE KEYS */;
INSERT INTO `akgrp` (`AKGRP1`, `AKGRP2R`, `AKGRP2U`, `AKGRP3`, `AKGRP4`, `AKGRP5`, `AKGRP6`, `AKGRP7`, `AKGRP8`) VALUES
	(1, 'КН-37а', 'КН-37а', NULL, NULL, NULL, NULL, 1, NULL),
	(2, 'КН-37б', 'КН-37б', NULL, NULL, NULL, NULL, 1, NULL);
/*!40000 ALTER TABLE `akgrp` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.akotp
CREATE TABLE IF NOT EXISTS `akotp` (
  `AKOTP1` int(11) NOT NULL,
  `AKOTP2` date NOT NULL,
  `AKOTP3` date NOT NULL,
  `AKOTP4` char(100) NOT NULL,
  PRIMARY KEY (`AKOTP2`),
  KEY `FK_akotp_st` (`AKOTP1`),
  CONSTRAINT `FK_akotp_st` FOREIGN KEY (`AKOTP1`) REFERENCES `st` (`ST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.akotp: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `akotp` DISABLE KEYS */;
/*!40000 ALTER TABLE `akotp` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.aud
CREATE TABLE IF NOT EXISTS `aud` (
  `aud1` int(11) NOT NULL AUTO_INCREMENT,
  `aud2` char(10) NOT NULL,
  `aud3` int(11) NOT NULL,
  PRIMARY KEY (`aud1`),
  KEY `FK_aud_korp` (`aud3`),
  CONSTRAINT `FK_aud_korp` FOREIGN KEY (`aud3`) REFERENCES `korp` (`korp1`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.aud: ~13 rows (приблизительно)
/*!40000 ALTER TABLE `aud` DISABLE KEYS */;
INSERT INTO `aud` (`aud1`, `aud2`, `aud3`) VALUES
	(1, '100', 1),
	(2, '200', 2),
	(3, '300', 3),
	(4, '400', 4),
	(5, '500', 5),
	(6, '101', 1),
	(7, '201', 2),
	(8, '301', 3),
	(9, '401', 4),
	(10, '501', 5),
	(14, '712', 2),
	(15, '1403', 1),
	(16, '719', 2),
	(17, '618', 2);
/*!40000 ALTER TABLE `aud` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.cntr
CREATE TABLE IF NOT EXISTS `cntr` (
  `CNTR1` int(11) NOT NULL AUTO_INCREMENT,
  `CNTR2R` char(15) DEFAULT NULL,
  `CNTR2U` char(15) DEFAULT NULL,
  `CNTR3` char(5) DEFAULT NULL,
  PRIMARY KEY (`CNTR1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.cntr: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `cntr` DISABLE KEYS */;
INSERT INTO `cntr` (`CNTR1`, `CNTR2R`, `CNTR2U`, `CNTR3`) VALUES
	(1, 'Украина', 'Україна', '+38'),
	(2, 'Россия', 'Росія', '+7');
/*!40000 ALTER TABLE `cntr` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.dn
CREATE TABLE IF NOT EXISTS `dn` (
  `dn1` int(11) NOT NULL AUTO_INCREMENT,
  `dn2r` char(11) NOT NULL,
  `dn2u` char(10) NOT NULL,
  `dn3r` char(3) NOT NULL,
  `dn3u` char(3) NOT NULL,
  PRIMARY KEY (`dn1`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.dn: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `dn` DISABLE KEYS */;
INSERT INTO `dn` (`dn1`, `dn2r`, `dn2u`, `dn3r`, `dn3u`) VALUES
	(1, 'Понедельник', 'Понеділок', 'Пн', 'Пн'),
	(2, 'Вторник', 'Вівторок', 'Вт', 'Вт'),
	(3, 'Среда', 'Середа', 'Ср', 'Ср'),
	(4, 'Четверг', 'Четвер', 'Чт', 'Чт'),
	(5, 'Пятница', 'П`ятниця', 'Пт', 'Пт'),
	(6, 'Суббота', 'Субота', 'Сб', 'Сб');
/*!40000 ALTER TABLE `dn` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.dolg
CREATE TABLE IF NOT EXISTS `dolg` (
  `DOLG1` int(11) NOT NULL AUTO_INCREMENT,
  `DOLG2R` char(35) NOT NULL,
  `DOLG2U` char(35) NOT NULL,
  PRIMARY KEY (`DOLG1`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.dolg: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `dolg` DISABLE KEYS */;
INSERT INTO `dolg` (`DOLG1`, `DOLG2R`, `DOLG2U`) VALUES
	(1, 'Ассистент', 'Асистент');
/*!40000 ALTER TABLE `dolg` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.fklt
CREATE TABLE IF NOT EXISTS `fklt` (
  `FKLT1` int(11) NOT NULL AUTO_INCREMENT,
  `FKLT2R` char(60) NOT NULL,
  `FKLT2U` char(60) NOT NULL,
  PRIMARY KEY (`FKLT1`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.fklt: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `fklt` DISABLE KEYS */;
INSERT INTO `fklt` (`FKLT1`, `FKLT2R`, `FKLT2U`) VALUES
	(1, 'КН', 'КН');
/*!40000 ALTER TABLE `fklt` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.indzad
CREATE TABLE IF NOT EXISTS `indzad` (
  `id_individ_zad` int(11) NOT NULL,
  `nazv_ind_zad` char(60) CHARACTER SET utf8 DEFAULT NULL,
  `kratkoe_nazv_ind_zad` char(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_individ_zad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы maindb.indzad: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `indzad` DISABLE KEYS */;
INSERT INTO `indzad` (`id_individ_zad`, `nazv_ind_zad`, `kratkoe_nazv_ind_zad`) VALUES
	(0, 'Відсутнє', ''),
	(1, 'Розрахункове завдання', 'Р'),
	(2, 'Розрахунково-графічне завдання', 'РГЗ'),
	(3, 'Реферат', 'РЕ'),
	(4, 'Курсовий проект', 'КП'),
	(5, 'Курсова робота', 'КР');
/*!40000 ALTER TABLE `indzad` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.indzadpr
CREATE TABLE IF NOT EXISTS `indzadpr` (
  `id_uch_plan` int(11) NOT NULL,
  `id_predmeta` int(11) NOT NULL,
  `id_individ_zad` int(11) NOT NULL,
  `semestr` int(11) NOT NULL,
  PRIMARY KEY (`id_predmeta`,`id_uch_plan`,`semestr`),
  KEY `FK_indzadpr_indzad` (`id_individ_zad`),
  KEY `FK_indzadpr_uchpl` (`id_uch_plan`),
  CONSTRAINT `FK_indzadpr_indzad` FOREIGN KEY (`id_individ_zad`) REFERENCES `indzad` (`id_individ_zad`),
  CONSTRAINT `FK_indzadpr_predm` FOREIGN KEY (`id_predmeta`) REFERENCES `predm` (`predm1`),
  CONSTRAINT `FK_indzadpr_uchpl` FOREIGN KEY (`id_uch_plan`) REFERENCES `uchpl` (`id_uch_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.indzadpr: ~59 rows (приблизительно)
/*!40000 ALTER TABLE `indzadpr` DISABLE KEYS */;
INSERT INTO `indzadpr` (`id_uch_plan`, `id_predmeta`, `id_individ_zad`, `semestr`) VALUES
	(1, 2, 0, 2),
	(1, 5, 0, 1),
	(1, 5, 0, 2),
	(1, 5, 0, 3),
	(1, 5, 0, 4),
	(1, 7, 0, 4),
	(1, 8, 0, 6),
	(1, 18, 0, 8),
	(1, 20, 0, 1),
	(1, 20, 0, 2),
	(1, 20, 0, 3),
	(1, 20, 0, 4),
	(1, 20, 0, 5),
	(1, 20, 0, 6),
	(1, 21, 0, 1),
	(1, 27, 0, 1),
	(1, 28, 0, 2),
	(1, 31, 0, 2),
	(1, 32, 0, 3),
	(1, 37, 0, 2),
	(1, 38, 0, 1),
	(1, 40, 0, 4),
	(1, 41, 0, 5),
	(1, 43, 0, 3),
	(1, 44, 0, 2),
	(1, 45, 0, 8),
	(1, 46, 0, 4),
	(1, 47, 0, 3),
	(1, 49, 0, 8),
	(1, 51, 0, 7),
	(1, 52, 0, 8),
	(1, 53, 0, 8),
	(1, 55, 0, 6),
	(1, 56, 0, 5),
	(1, 57, 0, 6),
	(1, 9, 1, 1),
	(1, 10, 1, 2),
	(1, 11, 1, 1),
	(1, 12, 1, 1),
	(1, 13, 1, 2),
	(1, 15, 1, 3),
	(1, 16, 1, 4),
	(1, 17, 1, 5),
	(1, 22, 1, 3),
	(1, 23, 1, 4),
	(1, 24, 1, 5),
	(1, 25, 1, 6),
	(1, 34, 1, 7),
	(1, 35, 1, 7),
	(1, 36, 1, 6),
	(1, 50, 1, 7),
	(1, 3, 3, 1),
	(1, 4, 3, 4),
	(1, 6, 3, 3),
	(1, 33, 4, 4),
	(1, 42, 4, 6),
	(1, 39, 5, 3),
	(1, 48, 5, 7),
	(1, 54, 5, 5);
/*!40000 ALTER TABLE `indzadpr` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.istf
CREATE TABLE IF NOT EXISTS `istf` (
  `ISTF1` int(11) NOT NULL AUTO_INCREMENT,
  `ISTF2` char(50) NOT NULL,
  PRIMARY KEY (`ISTF1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.istf: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `istf` DISABLE KEYS */;
INSERT INTO `istf` (`ISTF1`, `ISTF2`) VALUES
	(1, 'Бюджет'),
	(2, 'Контракт');
/*!40000 ALTER TABLE `istf` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.kaf
CREATE TABLE IF NOT EXISTS `kaf` (
  `KAF1` int(11) NOT NULL AUTO_INCREMENT,
  `KAF2R` char(100) NOT NULL,
  `KAF2U` char(100) NOT NULL,
  `KAF3` int(11) DEFAULT NULL,
  `KAF4` int(11) DEFAULT NULL,
  `KAF5R` char(10) DEFAULT NULL,
  `KAF5U` char(10) DEFAULT NULL,
  PRIMARY KEY (`KAF1`),
  KEY `FK_kaf_fklt` (`KAF3`),
  KEY `FK_kaf_prep` (`KAF4`),
  CONSTRAINT `FK_kaf_fklt` FOREIGN KEY (`KAF3`) REFERENCES `fklt` (`FKLT1`),
  CONSTRAINT `FK_kaf_prep` FOREIGN KEY (`KAF4`) REFERENCES `prep` (`PREP1`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.kaf: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `kaf` DISABLE KEYS */;
INSERT INTO `kaf` (`KAF1`, `KAF2R`, `KAF2U`, `KAF3`, `KAF4`, `KAF5R`, `KAF5U`) VALUES
	(5, 'Програмна інженерія та інформаційні технології управління', 'Програмна інженерія та інформаційні технології управління', 1, NULL, 'ПИИТУ', 'ПІІТУ');
/*!40000 ALTER TABLE `kaf` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.korp
CREATE TABLE IF NOT EXISTS `korp` (
  `korp1` int(11) NOT NULL AUTO_INCREMENT,
  `korp2r` char(35) NOT NULL,
  `korp2u` char(35) NOT NULL,
  `korp3r` char(10) NOT NULL,
  `korp3u` char(10) NOT NULL,
  PRIMARY KEY (`korp1`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.korp: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `korp` DISABLE KEYS */;
INSERT INTO `korp` (`korp1`, `korp2r`, `korp2u`, `korp3r`, `korp3u`) VALUES
	(1, '', '', '', 'У/1'),
	(2, '', '', '', 'У/2'),
	(3, '', '', '', 'У/3'),
	(4, '', '', '', 'У/4'),
	(5, '', '', '', 'У/5'),
	(9, '', '', '', '');
/*!40000 ALTER TABLE `korp` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.kval
CREATE TABLE IF NOT EXISTS `kval` (
  `id_kval` int(11) NOT NULL,
  `rus_name_kval` char(100) DEFAULT NULL,
  `ua_name_kval` char(100) DEFAULT NULL,
  `en_name_kval` char(100) DEFAULT NULL,
  `id_kval_lvl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kval`),
  KEY `FK_kval_kval_lvl` (`id_kval_lvl`),
  CONSTRAINT `FK_kval_kvalur` FOREIGN KEY (`id_kval_lvl`) REFERENCES `kvalur` (`id_kval_lvl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.kval: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `kval` DISABLE KEYS */;
INSERT INTO `kval` (`id_kval`, `rus_name_kval`, `ua_name_kval`, `en_name_kval`, `id_kval_lvl`) VALUES
	(0, 'бакалавр инженерии программного обеспечения', 'бакалавр з інженерії програмного забезпечення', 'bachelor of Engineering Software', 1);
/*!40000 ALTER TABLE `kval` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.kvalur
CREATE TABLE IF NOT EXISTS `kvalur` (
  `id_kval_lvl` int(11) NOT NULL AUTO_INCREMENT,
  `rus_name_kval_lvl` char(100) DEFAULT NULL,
  `ua_name_kval_lvl` char(100) DEFAULT NULL,
  `en_name_kval_lvl` char(100) DEFAULT NULL,
  `kolvo_sem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_kval_lvl`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.kvalur: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `kvalur` DISABLE KEYS */;
INSERT INTO `kvalur` (`id_kval_lvl`, `rus_name_kval_lvl`, `ua_name_kval_lvl`, `en_name_kval_lvl`, `kolvo_sem`) VALUES
	(1, 'бакалавр', 'бакалавр', 'bachelor', 1),
	(2, 'магистр', 'магістр', ' master', 2);
/*!40000 ALTER TABLE `kvalur` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.mobilnie
CREATE TABLE IF NOT EXISTS `mobilnie` (
  `id_telefona` int(11) NOT NULL,
  `nomer_operatora` int(11) NOT NULL,
  KEY `FK_mobilnie_telefoni` (`id_telefona`),
  KEY `FK_mobilnie_nomera_operatorov` (`nomer_operatora`),
  CONSTRAINT `FK_mobilnie_nomera_operatorov` FOREIGN KEY (`nomer_operatora`) REFERENCES `nomera_operatorov` (`nomer_operatora`),
  CONSTRAINT `FK_mobilnie_telefoni` FOREIGN KEY (`id_telefona`) REFERENCES `telefoni` (`id_telefona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.mobilnie: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `mobilnie` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobilnie` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.napr
CREATE TABLE IF NOT EXISTS `napr` (
  `NAPR1` int(11) NOT NULL AUTO_INCREMENT,
  `NAPR2R` char(100) NOT NULL,
  `NAPR2U` char(100) NOT NULL,
  `NAPR2E` char(100) NOT NULL,
  `NAPR3` char(10) NOT NULL,
  PRIMARY KEY (`NAPR1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.napr: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `napr` DISABLE KEYS */;
INSERT INTO `napr` (`NAPR1`, `NAPR2R`, `NAPR2U`, `NAPR2E`, `NAPR3`) VALUES
	(2, 'Информационные технологии', 'Інформаційні технології', 'Information Technology', '12');
/*!40000 ALTER TABLE `napr` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.nasel_punkti
CREATE TABLE IF NOT EXISTS `nasel_punkti` (
  `Kod_np` int(11) NOT NULL AUTO_INCREMENT,
  `NP` char(30) NOT NULL,
  `Kod_tipa_np` int(11) NOT NULL,
  `Kod_pod_regiona` int(11) NOT NULL,
  `kod_telefona` char(10) NOT NULL,
  PRIMARY KEY (`Kod_np`),
  KEY `FK_nasel_punkti_tip_nasel_punktov` (`Kod_tipa_np`),
  KEY `FK_nasel_punkti_pod_regioni` (`Kod_pod_regiona`),
  CONSTRAINT `FK_nasel_punkti_pod_regioni` FOREIGN KEY (`Kod_pod_regiona`) REFERENCES `pod_regioni` (`Kod_pod_regiona`),
  CONSTRAINT `FK_nasel_punkti_tip_nasel_punktov` FOREIGN KEY (`Kod_tipa_np`) REFERENCES `tip_nasel_punktov` (`Kod_tipa_np`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.nasel_punkti: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `nasel_punkti` DISABLE KEYS */;
/*!40000 ALTER TABLE `nasel_punkti` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.nomera_operatorov
CREATE TABLE IF NOT EXISTS `nomera_operatorov` (
  `nomer_operatora` int(11) NOT NULL AUTO_INCREMENT,
  `kod_operatora` int(11) NOT NULL,
  `nomer_op` char(3) NOT NULL,
  PRIMARY KEY (`nomer_operatora`),
  KEY `FK_nomera_operatorov_operatori` (`kod_operatora`),
  CONSTRAINT `FK_nomera_operatorov_operatori` FOREIGN KEY (`kod_operatora`) REFERENCES `operatori` (`kod_operatora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.nomera_operatorov: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `nomera_operatorov` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomera_operatorov` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.ob
CREATE TABLE IF NOT EXISTS `ob` (
  `OB1` int(11) NOT NULL,
  `OB2` int(11) NOT NULL,
  `OB3` date NOT NULL,
  `OB4` date NOT NULL,
  `OB5` char(100) NOT NULL,
  PRIMARY KEY (`OB3`),
  KEY `FK_ob_st` (`OB1`),
  KEY `FK_ob_akgrp` (`OB2`),
  CONSTRAINT `FK_ob_akgrp` FOREIGN KEY (`OB2`) REFERENCES `akgrp` (`AKGRP1`),
  CONSTRAINT `FK_ob_st` FOREIGN KEY (`OB1`) REFERENCES `st` (`ST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.ob: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `ob` DISABLE KEYS */;
/*!40000 ALTER TABLE `ob` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.operatori
CREATE TABLE IF NOT EXISTS `operatori` (
  `kod_operatora` int(11) NOT NULL AUTO_INCREMENT,
  `nazvanie` char(30) NOT NULL,
  `Kod_strani` int(11) NOT NULL,
  PRIMARY KEY (`kod_operatora`),
  KEY `FK_operatori_cntr` (`Kod_strani`),
  CONSTRAINT `FK_operatori_cntr` FOREIGN KEY (`Kod_strani`) REFERENCES `cntr` (`CNTR1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.operatori: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `operatori` DISABLE KEYS */;
/*!40000 ALTER TABLE `operatori` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.para
CREATE TABLE IF NOT EXISTS `para` (
  `numb_para` int(11) NOT NULL,
  `start_para` char(5) DEFAULT NULL,
  `fin_para` char(5) DEFAULT NULL,
  PRIMARY KEY (`numb_para`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.para: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `para` DISABLE KEYS */;
INSERT INTO `para` (`numb_para`, `start_para`, `fin_para`) VALUES
	(1, '08:30', '10:05'),
	(2, '10:25', '12:00'),
	(3, '12:35', '14:10'),
	(4, '14:30', '16:05'),
	(5, '16:25', '18:00'),
	(6, '18:10', '19:45');
/*!40000 ALTER TABLE `para` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.pod_regioni
CREATE TABLE IF NOT EXISTS `pod_regioni` (
  `Kod_pod_regiona` int(11) NOT NULL AUTO_INCREMENT,
  `Pod_region` char(30) NOT NULL,
  `Kod_regiona` int(11) NOT NULL,
  `Kod_tipa_podregiona` int(11) NOT NULL,
  PRIMARY KEY (`Kod_pod_regiona`),
  KEY `FK_pod_regioni_tipi_pod_regionov` (`Kod_tipa_podregiona`),
  KEY `FK_pod_regioni_regioni` (`Kod_regiona`),
  CONSTRAINT `FK_pod_regioni_regioni` FOREIGN KEY (`Kod_regiona`) REFERENCES `regioni` (`Kod_regiona`),
  CONSTRAINT `FK_pod_regioni_tipi_pod_regionov` FOREIGN KEY (`Kod_tipa_podregiona`) REFERENCES `tipi_pod_regionov` (`Kod_tipa_podregiona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.pod_regioni: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `pod_regioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `pod_regioni` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.pol
CREATE TABLE IF NOT EXISTS `pol` (
  `POL1` int(11) NOT NULL AUTO_INCREMENT,
  `POL2R` char(10) NOT NULL,
  `POL2U` char(10) NOT NULL,
  `POL3R` char(3) NOT NULL,
  `POL3U` char(3) NOT NULL,
  PRIMARY KEY (`POL1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.pol: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `pol` DISABLE KEYS */;
INSERT INTO `pol` (`POL1`, `POL2R`, `POL2U`, `POL3R`, `POL3U`) VALUES
	(1, 'Мужской', 'Чоловічий', 'м', 'ч'),
	(2, 'Женский', 'Жіночий', 'ж', 'ж');
/*!40000 ALTER TABLE `pol` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.predm
CREATE TABLE IF NOT EXISTS `predm` (
  `predm1` int(11) NOT NULL AUTO_INCREMENT,
  `predm2r` char(100) DEFAULT NULL,
  `predm2u` char(100) NOT NULL,
  `predm2e` char(100) DEFAULT NULL,
  `predm3r` char(30) DEFAULT NULL,
  `predm3u` char(30) NOT NULL,
  `predm3e` char(30) DEFAULT NULL,
  PRIMARY KEY (`predm1`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.predm: ~48 rows (приблизительно)
/*!40000 ALTER TABLE `predm` DISABLE KEYS */;
INSERT INTO `predm` (`predm1`, `predm2r`, `predm2u`, `predm2e`, `predm3r`, `predm3u`, `predm3e`) VALUES
	(2, NULL, 'Українська мова', NULL, NULL, 'Укр. мова', NULL),
	(3, NULL, 'Історія України', NULL, NULL, 'Іст. Укр.', NULL),
	(4, NULL, 'Історія української культури', NULL, NULL, 'Іст. Укр. культ', NULL),
	(5, NULL, 'Іноземна мова', NULL, NULL, 'Ін. мова', NULL),
	(6, NULL, 'Філософія', NULL, NULL, 'Філософія', NULL),
	(7, NULL, 'Основи економічної теорії', NULL, NULL, 'Осн. економ. теор.', NULL),
	(8, NULL, 'Екологія', NULL, NULL, 'Екол.', NULL),
	(9, NULL, 'Математичний аналіз (частина 1)', NULL, NULL, 'Мат. аналіз', NULL),
	(10, NULL, 'Математичний аналіз (частина 2)', NULL, NULL, 'Мат. аналіз', NULL),
	(11, NULL, 'Лінійна алгебра', NULL, NULL, 'Лін. алгебра', NULL),
	(12, NULL, 'Фізика', NULL, NULL, 'Фізика', NULL),
	(13, NULL, 'Дискретна математика (частина 1)', NULL, NULL, 'Дискр. мат.', NULL),
	(15, NULL, 'Дискретна математика (частина 2)', NULL, NULL, 'Дискр. мат.', NULL),
	(16, NULL, 'Дискретна математика (частина 3)', NULL, NULL, 'Дискр. мат.', NULL),
	(17, NULL, 'Чисельні методи', NULL, NULL, 'Чисел. методи', NULL),
	(18, NULL, 'Економіка виробництва програмного забезпечення', NULL, NULL, 'Економ. вироб. ПЗ', NULL),
	(20, NULL, 'Фізичне виховання', NULL, NULL, 'Фіз. вих.', NULL),
	(21, NULL, 'Історія науки і техніки', NULL, NULL, 'Історія НІТ', NULL),
	(22, NULL, 'Теорія ймовірностей', NULL, NULL, 'Теор. ймовір.', NULL),
	(23, NULL, 'Математична статистика', NULL, NULL, 'Мат. стат.', NULL),
	(24, NULL, 'Дослідження операцій (частина 1)', NULL, NULL, 'Досл. опер.', NULL),
	(25, NULL, 'Дослідження операцій (частина 2)', NULL, NULL, 'Досл. опер.', NULL),
	(27, NULL, 'Основи програмування (частина 1)', NULL, NULL, 'Осн. прогр.', NULL),
	(28, NULL, 'Основи програмування (частина 2)', NULL, NULL, 'Осн. прогр.', NULL),
	(31, NULL, 'Архітектура комп`ютера та комп`ютерних мереж', NULL, NULL, 'Арх. комп. та комп. мер.', NULL),
	(32, NULL, 'Організація баз даних', NULL, NULL, 'ОБД', NULL),
	(33, NULL, 'Проектування баз даних', NULL, NULL, 'Проектування БД', NULL),
	(34, NULL, 'Моделі і методи м`яких обчислень', NULL, NULL, 'МіММО', NULL),
	(35, NULL, 'Теорія прийняття рішень', NULL, NULL, 'ТПР', NULL),
	(36, NULL, 'Основи професійної безпеки та здоров`я людини', NULL, NULL, 'Осн. проф. безп.', NULL),
	(37, NULL, 'Основи операційних систем', NULL, NULL, 'Основи ОС', NULL),
	(38, NULL, 'Основи інженерії програмного забезпечення', NULL, NULL, 'Осн. інж.ПЗ', NULL),
	(39, NULL, 'Об`єктно орієнтоване програмування (частина 1)', NULL, NULL, 'ООП', NULL),
	(40, NULL, 'Об`єктно орієнтоване програмування (частина 2)', NULL, NULL, 'ООП', NULL),
	(41, NULL, 'Архітектура та проектування програмного забезпечення (частина 1)', NULL, NULL, 'Арх. та проект. ПЗ', NULL),
	(42, NULL, 'Архітектура та проектування програмного забезпечення (частина 2)', NULL, NULL, 'Арх. та проект. ПЗ', NULL),
	(43, NULL, 'Основи Java', NULL, NULL, 'Основи Java', NULL),
	(44, NULL, 'Алгоритми і структури даних', NULL, NULL, 'Алг. і структ. даних', NULL),
	(45, NULL, 'Безпека програм і даних', NULL, NULL, 'Безп. прог. і даних', NULL),
	(46, NULL, 'Технології розробки веб-орієнтованих систем', NULL, NULL, 'Техн. розр. веб систем', NULL),
	(47, NULL, 'Мережеві технології', NULL, NULL, 'Мереж. техн.', NULL),
	(48, NULL, 'Моделювання та аналіз програмного забезпечення', NULL, NULL, 'Мод. та аналіз ПЗ', NULL),
	(49, NULL, 'Якість програмного забезпечення', NULL, NULL, 'Якість ПЗ', NULL),
	(50, NULL, 'Методи обробки емпіричної інформації', NULL, NULL, 'Мет. оброб. емп. інф.', NULL),
	(51, NULL, 'Основи моделювання систем', NULL, NULL, 'Осн. модел. сист.', NULL),
	(52, NULL, 'Основи управління проектами програмної інженерії', NULL, NULL, 'ОУППІ', NULL),
	(53, NULL, 'Знання-орієнтовані моделі та технології розробки програмного забезпечення', NULL, NULL, 'ЗОМ та ТРПЗ', NULL),
	(54, NULL, 'Стек технології Java EE', NULL, NULL, 'Стек Java EE', NULL),
	(55, NULL, 'Стек технології .Net', NULL, NULL, 'Стек .Net', NULL),
	(56, NULL, 'Технології розробки мобільних систем (частина 1)', NULL, NULL, 'Техн. розр. моб. сист.', NULL),
	(57, NULL, 'Технології розробки мобільних систем (частина 2)', NULL, NULL, 'Техн. розр. моб. сист.', NULL);
/*!40000 ALTER TABLE `predm` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.prep
CREATE TABLE IF NOT EXISTS `prep` (
  `PREP1` int(11) NOT NULL AUTO_INCREMENT,
  `PREP2R` char(40) DEFAULT NULL,
  `PREP2U` char(40) DEFAULT NULL,
  `PREP2E` char(40) DEFAULT NULL,
  `PREP3R` char(40) DEFAULT NULL,
  `PREP3U` char(40) DEFAULT NULL,
  `PREP3E` char(40) DEFAULT NULL,
  `PREP4R` char(40) DEFAULT NULL,
  `PREP4U` char(40) DEFAULT NULL,
  `PREP4E` char(40) DEFAULT NULL,
  `PREP5` int(11) DEFAULT NULL,
  `PREP6` int(11) DEFAULT NULL,
  `PREP7` int(11) DEFAULT NULL,
  `PREP8` int(11) DEFAULT NULL,
  `PREP9` date DEFAULT NULL,
  PRIMARY KEY (`PREP1`),
  KEY `FK_prep_kaf` (`PREP5`),
  KEY `FK_prep_dolg` (`PREP6`),
  KEY `FK_prep_zvan` (`PREP8`),
  KEY `FK_prep_step` (`PREP7`),
  CONSTRAINT `FK_prep_dolg` FOREIGN KEY (`PREP6`) REFERENCES `dolg` (`DOLG1`),
  CONSTRAINT `FK_prep_kaf` FOREIGN KEY (`PREP5`) REFERENCES `kaf` (`KAF1`),
  CONSTRAINT `FK_prep_step` FOREIGN KEY (`PREP7`) REFERENCES `step` (`STEP1`),
  CONSTRAINT `FK_prep_zvan` FOREIGN KEY (`PREP8`) REFERENCES `zvan` (`ZVAN1`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.prep: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `prep` DISABLE KEYS */;
INSERT INTO `prep` (`PREP1`, `PREP2R`, `PREP2U`, `PREP2E`, `PREP3R`, `PREP3U`, `PREP3E`, `PREP4R`, `PREP4U`, `PREP4E`, `PREP5`, `PREP6`, `PREP7`, `PREP8`, `PREP9`) VALUES
	(2, 'Преподаватель', 'Викладач', 'Teacher', 'П.', 'В.', 'Т.', 'О.', 'П.', 'S.', 5, 1, 1, 1, '2018-05-01'),
	(3, '', 'Шевченко', '', '', '', '', '', '', '', 5, 1, 1, 1, '0000-00-00'),
	(4, '', 'Гужва', '', '', '', '', '', '', '', 5, 1, 1, 1, '0000-00-00'),
	(5, '', 'Копп', '', '', '', '', '', '', '', 5, 1, 1, 1, '0000-00-00'),
	(6, '', 'Фірсова', '', '', '', '', '', '', '', 5, 1, 1, 1, '0000-00-00'),
	(7, '', 'Іванов', '', '', '', '', '', '', '', 5, 1, 1, 1, '0000-00-00'),
	(8, '', 'Стратієнко', '', '', '', '', '', '', '', 5, 1, 1, 1, '0000-00-00'),
	(9, '', 'Лемешева', '', '', '', '', '', '', '', 5, 1, 1, 1, '0000-00-00'),
	(10, '', 'Орешич', '', '', '', '', '', '', '', 5, 1, 1, 1, '0000-00-00');
/*!40000 ALTER TABLE `prep` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.pzan
CREATE TABLE IF NOT EXISTS `pzan` (
  `pzan1` int(11) NOT NULL,
  `pzan2` int(11) NOT NULL,
  `pzan3` int(11) NOT NULL,
  `pzan4` int(11) NOT NULL,
  `pzan5` date NOT NULL,
  `pzan6` char(5) NOT NULL,
  `pzan7` int(11) NOT NULL,
  `pzan8` int(11) NOT NULL,
  `pzan9` int(11) NOT NULL,
  `pzan10` int(11) NOT NULL,
  PRIMARY KEY (`pzan1`,`pzan2`,`pzan3`,`pzan4`,`pzan5`,`pzan6`,`pzan7`),
  KEY `FK_pzan_uchgod` (`pzan2`),
  KEY `FK_pzan_predm` (`pzan4`),
  KEY `FK_pzan_vidzan` (`pzan7`),
  KEY `FK_pzan_prep` (`pzan8`),
  KEY `FK_pzan_aud` (`pzan10`),
  CONSTRAINT `FK_pzan_aud` FOREIGN KEY (`pzan10`) REFERENCES `aud` (`aud1`),
  CONSTRAINT `FK_pzan_predm` FOREIGN KEY (`pzan4`) REFERENCES `predm` (`predm1`),
  CONSTRAINT `FK_pzan_prep` FOREIGN KEY (`pzan8`) REFERENCES `prep` (`PREP1`),
  CONSTRAINT `FK_pzan_st` FOREIGN KEY (`pzan1`) REFERENCES `st` (`ST_ID`),
  CONSTRAINT `FK_pzan_uchgod` FOREIGN KEY (`pzan2`) REFERENCES `uchgod` (`uchgod1`),
  CONSTRAINT `FK_pzan_vidzan` FOREIGN KEY (`pzan7`) REFERENCES `vidzan` (`vidzan1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.pzan: ~16 rows (приблизительно)
/*!40000 ALTER TABLE `pzan` DISABLE KEYS */;
INSERT INTO `pzan` (`pzan1`, `pzan2`, `pzan3`, `pzan4`, `pzan5`, `pzan6`, `pzan7`, `pzan8`, `pzan9`, `pzan10`) VALUES
	(1, 1, 2, 5, '2018-05-22', '5', 2, 2, 2, 16),
	(2, 1, 2, 5, '2018-05-22', '5', 2, 2, 2, 16),
	(3, 1, 2, 5, '2018-05-22', '5', 2, 2, 1, 16),
	(4, 1, 2, 5, '2018-05-22', '5', 2, 2, 2, 16),
	(5, 1, 2, 5, '2018-05-22', '5', 2, 2, 2, 16),
	(6, 1, 2, 5, '2018-05-22', '5', 2, 2, 2, 16),
	(7, 1, 2, 5, '2018-05-22', '5', 2, 2, 2, 16),
	(8, 1, 2, 5, '2018-05-22', '5', 2, 2, 2, 16),
	(9, 1, 2, 5, '2018-05-22', '5', 2, 2, 2, 16),
	(10, 1, 2, 5, '2018-05-22', '5', 2, 2, 2, 16),
	(11, 1, 2, 5, '2018-05-22', '5', 2, 2, 0, 16),
	(12, 1, 2, 5, '2018-05-22', '5', 2, 2, 0, 16),
	(13, 1, 2, 5, '2018-05-22', '5', 2, 2, 0, 16),
	(14, 1, 2, 5, '2018-05-22', '5', 2, 2, 0, 16),
	(15, 1, 2, 5, '2018-05-22', '5', 2, 2, 0, 16),
	(16, 1, 2, 5, '2018-05-22', '5', 2, 2, 0, 16);
/*!40000 ALTER TABLE `pzan` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.rasp
CREATE TABLE IF NOT EXISTS `rasp` (
  `rasp1` int(11) NOT NULL,
  `rasp2` int(11) NOT NULL,
  `rasp3` int(11) NOT NULL,
  `rasp4` int(11) NOT NULL,
  `rasp5` int(11) NOT NULL,
  `rasp6` int(11) NOT NULL,
  `rasp7` int(11) NOT NULL,
  `rasp10` int(11) NOT NULL,
  `rasp8` int(11) NOT NULL,
  `rasp9` int(11) NOT NULL,
  PRIMARY KEY (`rasp1`,`rasp3`,`rasp4`,`rasp6`,`rasp7`,`rasp8`),
  KEY `FK_rasp_uchgod` (`rasp2`),
  KEY `FK_rasp_predm` (`rasp4`),
  KEY `FK_rasp_prep` (`rasp5`),
  KEY `FK_rasp_dn` (`rasp6`),
  KEY `FK_rasp_vidzan` (`rasp8`),
  KEY `FK_rasp_aud` (`rasp9`),
  KEY `FK_rasp_para` (`rasp7`),
  CONSTRAINT `FK_rasp_akgrp` FOREIGN KEY (`rasp1`) REFERENCES `akgrp` (`AKGRP1`),
  CONSTRAINT `FK_rasp_aud` FOREIGN KEY (`rasp9`) REFERENCES `aud` (`aud1`),
  CONSTRAINT `FK_rasp_dn` FOREIGN KEY (`rasp6`) REFERENCES `dn` (`dn1`),
  CONSTRAINT `FK_rasp_para` FOREIGN KEY (`rasp7`) REFERENCES `para` (`numb_para`),
  CONSTRAINT `FK_rasp_predm` FOREIGN KEY (`rasp4`) REFERENCES `predm` (`predm1`),
  CONSTRAINT `FK_rasp_prep` FOREIGN KEY (`rasp5`) REFERENCES `prep` (`PREP1`),
  CONSTRAINT `FK_rasp_uchgod` FOREIGN KEY (`rasp2`) REFERENCES `uchgod` (`uchgod1`),
  CONSTRAINT `FK_rasp_vidzan` FOREIGN KEY (`rasp8`) REFERENCES `vidzan` (`vidzan1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.rasp: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `rasp` DISABLE KEYS */;
INSERT INTO `rasp` (`rasp1`, `rasp2`, `rasp3`, `rasp4`, `rasp5`, `rasp6`, `rasp7`, `rasp10`, `rasp8`, `rasp9`) VALUES
	(1, 1, 2, 2, 6, 3, 2, 0, 2, 5),
	(1, 1, 2, 5, 10, 5, 5, 0, 2, 1),
	(1, 1, 2, 10, 9, 4, 4, 0, 1, 1),
	(1, 1, 2, 10, 9, 4, 5, 0, 2, 1),
	(1, 1, 2, 10, 9, 5, 3, 2, 1, 1),
	(1, 1, 2, 13, 4, 2, 3, 0, 1, 2),
	(1, 1, 2, 13, 4, 2, 4, 0, 2, 2),
	(1, 1, 2, 28, 5, 2, 5, 0, 3, 2),
	(1, 1, 2, 28, 7, 3, 3, 1, 1, 2),
	(1, 1, 2, 28, 7, 3, 4, 0, 1, 2),
	(1, 1, 2, 28, 5, 5, 4, 0, 3, 7),
	(1, 1, 2, 31, 3, 1, 2, 0, 3, 2),
	(1, 1, 2, 31, 3, 1, 3, 0, 1, 6),
	(1, 1, 2, 44, 8, 3, 3, 2, 3, 2),
	(1, 1, 2, 44, 8, 4, 3, 0, 1, 2);
/*!40000 ALTER TABLE `rasp` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.regioni
CREATE TABLE IF NOT EXISTS `regioni` (
  `Kod_regiona` int(11) NOT NULL AUTO_INCREMENT,
  `Regiion` char(30) NOT NULL,
  `Kod_strani` int(11) NOT NULL,
  `Kod_tipa_reg` int(11) NOT NULL,
  PRIMARY KEY (`Kod_regiona`),
  KEY `FK_regioni_cntr` (`Kod_strani`),
  KEY `FK_regioni_tipi_regionov` (`Kod_tipa_reg`),
  CONSTRAINT `FK_regioni_cntr` FOREIGN KEY (`Kod_strani`) REFERENCES `cntr` (`CNTR1`),
  CONSTRAINT `FK_regioni_tipi_regionov` FOREIGN KEY (`Kod_tipa_reg`) REFERENCES `tipi_regionov` (`kod_tipa_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.regioni: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `regioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `regioni` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.rodstveniki
CREATE TABLE IF NOT EXISTS `rodstveniki` (
  `kod_rodstvenika` int(11) NOT NULL AUTO_INCREMENT,
  `familiya` char(20) NOT NULL,
  `imya` char(20) NOT NULL,
  `otchestvo` char(20) NOT NULL,
  `pol` int(11) NOT NULL,
  PRIMARY KEY (`kod_rodstvenika`),
  KEY `FK_rodstveniki_pol` (`pol`),
  CONSTRAINT `FK_rodstveniki_pol` FOREIGN KEY (`pol`) REFERENCES `pol` (`POL1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.rodstveniki: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `rodstveniki` DISABLE KEYS */;
/*!40000 ALTER TABLE `rodstveniki` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.rodstveniki_studenta
CREATE TABLE IF NOT EXISTS `rodstveniki_studenta` (
  `kod_rodstvenika` int(1) NOT NULL,
  `Kod_studenta` int(11) NOT NULL,
  `kod_vida_rodstva` int(11) NOT NULL,
  KEY `FK_rodstveniki_studenta_rodstveniki` (`kod_rodstvenika`),
  KEY `FK_rodstveniki_studenta_st` (`Kod_studenta`),
  KEY `FK_rodstveniki_studenta_vidi_rodstva` (`kod_vida_rodstva`),
  CONSTRAINT `FK_rodstveniki_studenta_rodstveniki` FOREIGN KEY (`kod_rodstvenika`) REFERENCES `rodstveniki` (`kod_rodstvenika`),
  CONSTRAINT `FK_rodstveniki_studenta_st` FOREIGN KEY (`Kod_studenta`) REFERENCES `st` (`ST_ID`),
  CONSTRAINT `FK_rodstveniki_studenta_vidi_rodstva` FOREIGN KEY (`kod_vida_rodstva`) REFERENCES `vidi_rodstva` (`kod_vida_rodstva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.rodstveniki_studenta: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `rodstveniki_studenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `rodstveniki_studenta` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.spez
CREATE TABLE IF NOT EXISTS `spez` (
  `SPEZ1` int(11) NOT NULL AUTO_INCREMENT,
  `SPEZ2R` char(100) NOT NULL,
  `SPEZ2U` char(100) NOT NULL,
  `SPEZ2E` char(100) NOT NULL,
  `SPEZ3` int(11) NOT NULL,
  `SPEZ4` char(10) NOT NULL,
  PRIMARY KEY (`SPEZ1`),
  KEY `FK_spez_napr` (`SPEZ3`),
  CONSTRAINT `FK_spez_napr` FOREIGN KEY (`SPEZ3`) REFERENCES `napr` (`NAPR1`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.spez: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `spez` DISABLE KEYS */;
INSERT INTO `spez` (`SPEZ1`, `SPEZ2R`, `SPEZ2U`, `SPEZ2E`, `SPEZ3`, `SPEZ4`) VALUES
	(1, 'Инженерия программного обеспечения', 'Інженерія програмного забезпечення', 'Software Engineering', 2, '121');
/*!40000 ALTER TABLE `spez` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.spezz
CREATE TABLE IF NOT EXISTS `spezz` (
  `SPEZZ1` int(11) NOT NULL AUTO_INCREMENT,
  `SPEZZ2R` char(100) NOT NULL,
  `SPEZZ2U` char(100) NOT NULL,
  `SPEZZ2E` char(100) DEFAULT NULL,
  `SPEZZ3` int(11) NOT NULL,
  `SPEZZ4` char(10) NOT NULL,
  PRIMARY KEY (`SPEZZ1`),
  KEY `FK_SPEZZ_spez` (`SPEZZ3`),
  CONSTRAINT `FK_SPEZZ_spez` FOREIGN KEY (`SPEZZ3`) REFERENCES `spez` (`SPEZ1`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.spezz: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `spezz` DISABLE KEYS */;
INSERT INTO `spezz` (`SPEZZ1`, `SPEZZ2R`, `SPEZZ2U`, `SPEZZ2E`, `SPEZZ3`, `SPEZZ4`) VALUES
	(1, 'Инженерия программного обеспечения', 'Інженерія програмного забезпечення', 'Software Engineering', 1, '121');
/*!40000 ALTER TABLE `spezz` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.sprv
CREATE TABLE IF NOT EXISTS `sprv` (
  `sprv1` int(11) NOT NULL AUTO_INCREMENT,
  `sprv2` date NOT NULL,
  `sprv3` date NOT NULL,
  `sprv4` char(100) NOT NULL,
  `sprv5` date NOT NULL,
  `sprv6` int(11) NOT NULL,
  `sprv7` char(100) NOT NULL,
  PRIMARY KEY (`sprv1`),
  KEY `FK_sprv_tsprv` (`sprv6`),
  CONSTRAINT `FK_sprv_tsprv` FOREIGN KEY (`sprv6`) REFERENCES `tsprv` (`tsprv1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.sprv: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `sprv` DISABLE KEYS */;
/*!40000 ALTER TABLE `sprv` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.sprvst
CREATE TABLE IF NOT EXISTS `sprvst` (
  `sprvst1` int(11) NOT NULL,
  `sprvst2` int(11) NOT NULL,
  PRIMARY KEY (`sprvst1`,`sprvst2`),
  KEY `FK_sprvst_st` (`sprvst2`),
  CONSTRAINT `FK_sprvst_sprv` FOREIGN KEY (`sprvst1`) REFERENCES `sprv` (`sprv1`),
  CONSTRAINT `FK_sprvst_st` FOREIGN KEY (`sprvst2`) REFERENCES `st` (`ST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.sprvst: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `sprvst` DISABLE KEYS */;
/*!40000 ALTER TABLE `sprvst` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.st
CREATE TABLE IF NOT EXISTS `st` (
  `ST_ID` int(10) NOT NULL AUTO_INCREMENT,
  `ST_F1R` char(20) NOT NULL,
  `ST_F1U` char(20) NOT NULL,
  `ST_F1E` char(20) NOT NULL,
  `ST_F2R` char(20) NOT NULL,
  `ST_F2U` char(20) NOT NULL,
  `ST_F2E` char(20) NOT NULL,
  `ST_F3R` char(20) DEFAULT NULL,
  `ST_F3U` char(20) DEFAULT NULL,
  `ST_F3E` char(20) DEFAULT NULL,
  `ST_F4R` char(20) DEFAULT NULL,
  `ST_F4U` char(20) DEFAULT NULL,
  `ST_F4E` char(20) DEFAULT NULL,
  `ST_F5R` char(20) DEFAULT NULL,
  `ST_F5U` char(20) DEFAULT NULL,
  `ST_F5E` char(20) DEFAULT NULL,
  `ST_CNTR` int(10) DEFAULT NULL,
  `ST_POL` int(11) DEFAULT NULL,
  `ST_DR` date DEFAULT NULL,
  `ST_MR` text,
  `ST_AKGRP` int(11) DEFAULT NULL,
  `ST_DPR` date DEFAULT NULL,
  `ST_DOT` date DEFAULT NULL,
  `ST_NZK` char(10) DEFAULT NULL,
  `ST_INN` char(10) DEFAULT NULL,
  `ST_PSPS` char(2) DEFAULT NULL,
  `ST_PSPN` char(6) DEFAULT NULL,
  `ST_PSPV` tinytext,
  `ST_COMM` text,
  `ST_FOTO` blob,
  `ST_STATUS` int(11) DEFAULT NULL,
  `ST_ISTF` int(11) DEFAULT NULL,
  PRIMARY KEY (`ST_ID`),
  KEY `FK_st_akgrp` (`ST_AKGRP`),
  KEY `ST_POL` (`ST_POL`),
  KEY `ST_CNTR` (`ST_CNTR`),
  KEY `FK_st_status` (`ST_STATUS`),
  KEY `FK_st_istf` (`ST_ISTF`),
  CONSTRAINT `FK_st_akgrp` FOREIGN KEY (`ST_AKGRP`) REFERENCES `akgrp` (`AKGRP1`),
  CONSTRAINT `FK_st_cntr` FOREIGN KEY (`ST_CNTR`) REFERENCES `cntr` (`CNTR1`),
  CONSTRAINT `FK_st_istf` FOREIGN KEY (`ST_ISTF`) REFERENCES `istf` (`ISTF1`),
  CONSTRAINT `FK_st_pol` FOREIGN KEY (`ST_POL`) REFERENCES `pol` (`POL1`),
  CONSTRAINT `FK_st_status` FOREIGN KEY (`ST_STATUS`) REFERENCES `status` (`kod_statusa`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.st: ~16 rows (приблизительно)
/*!40000 ALTER TABLE `st` DISABLE KEYS */;
INSERT INTO `st` (`ST_ID`, `ST_F1R`, `ST_F1U`, `ST_F1E`, `ST_F2R`, `ST_F2U`, `ST_F2E`, `ST_F3R`, `ST_F3U`, `ST_F3E`, `ST_F4R`, `ST_F4U`, `ST_F4E`, `ST_F5R`, `ST_F5U`, `ST_F5E`, `ST_CNTR`, `ST_POL`, `ST_DR`, `ST_MR`, `ST_AKGRP`, `ST_DPR`, `ST_DOT`, `ST_NZK`, `ST_INN`, `ST_PSPS`, `ST_PSPN`, `ST_PSPV`, `ST_COMM`, `ST_FOTO`, `ST_STATUS`, `ST_ISTF`) VALUES
	(1, ' Аллот', 'Аллот', 'Allot', 'Дмитрий', 'Дмитро', 'Дмитрий', 'Евгенивич', 'Євгенійович', 'Евгений', '', '', '', '', '', '', 1, 1, '2000-05-06', '', 1, '2017-09-01', '0000-00-00', '', '3668110037', 'МТ', '000101', '', '  ', _binary '', 1, 1),
	(2, ' Беленчио', 'Белінчіо', 'Б', 'Александр', 'Олександр', 'о', 'Станиславович', 'Станіславович', 'с', '', '', '', '', '', '', 1, 1, '0000-00-00', '', 1, '2017-09-01', '0000-00-00', '', '3664105279', '', '', '', '', _binary '', 1, 1),
	(3, ' Белоус', 'Білоус', 'ч', 'Иван', 'Іван', 'ч', 'Сергеевич', 'Сергійович', 'ч', '', '', '', '', '', '', 1, 1, '2000-01-20', '', 1, '2017-09-01', '0000-00-00', '', '364401617', '', '', '', ' ', _binary '', 1, 1),
	(4, ' Волков', 'Волков', 'х', 'Сергей', 'Сергій', 'х', 'Владимирович', 'Володимирович', 'х', '', '', '', '', '', '', 1, 1, '2000-06-16', '', 1, '2017-09-01', '0000-00-00', '', '3668910516', '', '', '', '', _binary '', 1, 1),
	(5, ' Зизин', 'Зізін', 'х', 'Александр', 'Олександр', 'х', 'Михайлович', 'Михайлович', 'х', '', '', '', '', '', '', 1, 1, '2000-07-20', '', 1, '2017-09-01', '0000-00-00', '', '3672602936', '', '', '', '', _binary '', 1, 1),
	(6, ' Ипатов', 'Іпатов', 'я', 'Артем', 'Артем', 'я', 'Денисович', 'Денисович', 'я', '', '', '', '', '', '', 1, 1, '2000-02-14', '', 1, '2017-09-01', '0000-00-00', '', '365905079', '', '', '', '', _binary '', 1, 1),
	(7, ' Курява', 'Курява', 'и', 'Анна', 'Ганна', 'и', 'Олеговна', 'Олегівна', 'и', '', '', '', '', '', '', 1, 2, '2000-01-02', '', 1, '2017-09-01', '0000-00-00', '', '3652600309', '', '', '', ' ', _binary '', 1, 1),
	(8, ' Лактинов', 'Лактінов', 'г', 'Сергей', 'Сергій', 'г', 'Юрьевич', 'Юрійович', 'г', '', '', '', '', '', '', 1, 1, '2017-04-10', '', 1, '2017-09-01', '0000-00-00', '', '3662504559', '', '', '', '', _binary '', 1, 1),
	(9, ' Матяш', 'Матяш', 'и', 'Алексей', 'Олексій', 'а', 'Юрьевич', 'Юрійович', 'р', '', '', '', '', '', '', 1, 1, '1999-09-13', '', 1, '2017-09-01', '0000-00-00', '', '3641509390', '', '', '', '', _binary '', 1, 1),
	(10, ' Менженко', 'Менженко', 'у', 'Вячеслав', 'Вячеслав', 'у', 'Александрович', 'Олександрович', 'у', '', '', '', '', '', '', 1, 1, '1999-12-18', '', 1, '2017-09-01', '0000-00-00', '', '3651103655', '', '', '', ' ', _binary '', 1, 1),
	(11, ' Мыльников', 'Мильніков', 'й', 'Андрей', 'Андрій', 'й', 'Олегович', 'Олегович', 'й', '', '', '', '', '', '', 1, 1, '2000-06-23', '', 1, '2017-09-01', '0000-00-00', '', '', '', '', '', '', _binary '', 1, 1),
	(12, ' Осетров', 'Осетров', 'ц', 'Денис', 'Денис', 'ц', 'Алексеевич', 'Олексійович', 'ц', '', '', '', '', '', '', 1, 1, '1999-12-24', '', 1, '2017-09-01', '0000-00-00', '', '3651703412', '', '', '', '', _binary '', 1, 1),
	(13, ' Санталова', 'Санталова', 'с', 'Анастасия', 'Анастасія', 'с', 'Романовна', 'Романівна', 'с', '', '', '', '', '', '', 1, 2, '2000-10-26', '', 1, '2017-09-01', '0000-00-00', '', '', '', '', '', '', _binary '', 1, 1),
	(14, ' Федаш', 'Федаш', 'ї', 'Владислав', 'Владислав', 'ї', 'Александрович', 'Олександрович', 'ї', '', '', '', '', '', '', 1, 1, '2000-07-27', '', 1, '2017-09-01', '0000-00-00', '', '3673401879', '', '', '', '', _binary '', 1, 1),
	(15, ' Шашков', 'Шашков', 'х', 'Сергей', 'Сергій', 'х', 'Витальевич', 'Віталійович', 'х', '', '', '', '', '', '', 1, 1, '1999-11-20', '', 1, '2017-09-01', '0000-00-00', '', '3648302713', '', '', '', '', _binary '', 1, 1),
	(16, ' Ву', 'Ву', 'я', 'Минь Дик', 'Мінь Дик', 'я', '', '', '', '', '', '', '', '', '', 1, 1, '2000-04-16', '', 1, '2017-09-01', '0000-00-00', '', '3663102613', '', '', '', '', _binary '', 1, 1);
/*!40000 ALTER TABLE `st` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.stacionarnie
CREATE TABLE IF NOT EXISTS `stacionarnie` (
  `id_telefona` int(11) NOT NULL,
  `kod_np` int(11) NOT NULL,
  KEY `FK_stacionarnie_telefoni` (`id_telefona`),
  KEY `FK_stacionarnie_nasel_punkti` (`kod_np`),
  CONSTRAINT `FK_stacionarnie_nasel_punkti` FOREIGN KEY (`kod_np`) REFERENCES `nasel_punkti` (`Kod_np`),
  CONSTRAINT `FK_stacionarnie_telefoni` FOREIGN KEY (`id_telefona`) REFERENCES `telefoni` (`id_telefona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.stacionarnie: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `stacionarnie` DISABLE KEYS */;
/*!40000 ALTER TABLE `stacionarnie` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.status
CREATE TABLE IF NOT EXISTS `status` (
  `kod_statusa` int(11) NOT NULL AUTO_INCREMENT,
  `Nazvanie_statusa` char(25) NOT NULL,
  PRIMARY KEY (`kod_statusa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.status: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`kod_statusa`, `Nazvanie_statusa`) VALUES
	(1, 'Гражданин');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.step
CREATE TABLE IF NOT EXISTS `step` (
  `STEP1` int(11) NOT NULL AUTO_INCREMENT,
  `STEP2R` char(40) NOT NULL,
  `STEP2U` char(40) NOT NULL,
  `STEP3R` char(10) NOT NULL,
  `STEP3U` char(10) NOT NULL,
  PRIMARY KEY (`STEP1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.step: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` (`STEP1`, `STEP2R`, `STEP2U`, `STEP3R`, `STEP3U`) VALUES
	(1, 'Кандидат наук', 'Кандидат наук', 'к.н.', 'к.н.'),
	(2, 'Кандидат технических наук', 'Кандидат технічних наук', 'к.т.н.', 'к.т.н.');
/*!40000 ALTER TABLE `step` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.stpns
CREATE TABLE IF NOT EXISTS `stpns` (
  `STPNS1` int(11) NOT NULL AUTO_INCREMENT,
  `STPNS2` char(10) NOT NULL,
  PRIMARY KEY (`STPNS1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.stpns: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `stpns` DISABLE KEYS */;
INSERT INTO `stpns` (`STPNS1`, `STPNS2`) VALUES
	(1, 'Бакалавр'),
	(2, 'Магистр');
/*!40000 ALTER TABLE `stpns` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.telefoni
CREATE TABLE IF NOT EXISTS `telefoni` (
  `id_telefona` int(11) NOT NULL AUTO_INCREMENT,
  `nomer_telefona` char(10) NOT NULL,
  PRIMARY KEY (`id_telefona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.telefoni: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `telefoni` DISABLE KEYS */;
INSERT INTO `telefoni` (`id_telefona`, `nomer_telefona`) VALUES
	(1, '640 2157');
/*!40000 ALTER TABLE `telefoni` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.telefoni_rodstvenikov
CREATE TABLE IF NOT EXISTS `telefoni_rodstvenikov` (
  `id_telefona` int(11) NOT NULL,
  `kod_rodstvenika` int(11) NOT NULL,
  KEY `FK_telefoni_rodstvenikov_telefoni` (`id_telefona`),
  KEY `FK_telefoni_rodstvenikov_rodstveniki` (`kod_rodstvenika`),
  CONSTRAINT `FK_telefoni_rodstvenikov_rodstveniki` FOREIGN KEY (`kod_rodstvenika`) REFERENCES `rodstveniki` (`kod_rodstvenika`),
  CONSTRAINT `FK_telefoni_rodstvenikov_telefoni` FOREIGN KEY (`id_telefona`) REFERENCES `telefoni` (`id_telefona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.telefoni_rodstvenikov: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `telefoni_rodstvenikov` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefoni_rodstvenikov` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.telefoni_studentov
CREATE TABLE IF NOT EXISTS `telefoni_studentov` (
  `kod_studenta` int(11) NOT NULL,
  `id_telefona` int(11) NOT NULL,
  KEY `FK_telefoni_studentov_st` (`kod_studenta`),
  KEY `FK_telefoni_studentov_telefoni` (`id_telefona`),
  CONSTRAINT `FK_telefoni_studentov_st` FOREIGN KEY (`kod_studenta`) REFERENCES `st` (`ST_ID`),
  CONSTRAINT `FK_telefoni_studentov_telefoni` FOREIGN KEY (`id_telefona`) REFERENCES `telefoni` (`id_telefona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.telefoni_studentov: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `telefoni_studentov` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefoni_studentov` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.tipi_pod_regionov
CREATE TABLE IF NOT EXISTS `tipi_pod_regionov` (
  `Kod_tipa_podregiona` int(11) NOT NULL AUTO_INCREMENT,
  `Tip_podregiona` char(30) NOT NULL,
  `Tip_podregiona_kr` char(30) NOT NULL,
  PRIMARY KEY (`Kod_tipa_podregiona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.tipi_pod_regionov: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tipi_pod_regionov` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipi_pod_regionov` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.tipi_regionov
CREATE TABLE IF NOT EXISTS `tipi_regionov` (
  `kod_tipa_reg` int(11) NOT NULL AUTO_INCREMENT,
  `tip_reg` char(30) NOT NULL,
  `tip_reg_kr` char(30) NOT NULL,
  PRIMARY KEY (`kod_tipa_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.tipi_regionov: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tipi_regionov` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipi_regionov` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.tip_nasel_punktov
CREATE TABLE IF NOT EXISTS `tip_nasel_punktov` (
  `Kod_tipa_np` int(11) NOT NULL AUTO_INCREMENT,
  `tip_np` char(30) NOT NULL,
  `tip_np_kr` char(30) NOT NULL,
  PRIMARY KEY (`Kod_tipa_np`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.tip_nasel_punktov: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tip_nasel_punktov` DISABLE KEYS */;
/*!40000 ALTER TABLE `tip_nasel_punktov` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.tip_pomesheniya
CREATE TABLE IF NOT EXISTS `tip_pomesheniya` (
  `Kod_tipa_pomesheniya` int(10) NOT NULL AUTO_INCREMENT,
  `Tip_pomesheniya` char(30) NOT NULL,
  `Tip_pomesheniya_kr` char(30) NOT NULL,
  PRIMARY KEY (`Kod_tipa_pomesheniya`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.tip_pomesheniya: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tip_pomesheniya` DISABLE KEYS */;
/*!40000 ALTER TABLE `tip_pomesheniya` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.tip_stroeniya
CREATE TABLE IF NOT EXISTS `tip_stroeniya` (
  `kod_tipa_stroeniya` int(10) NOT NULL AUTO_INCREMENT,
  `tip_stroeniya` char(30) NOT NULL,
  `tip_stroeniya_kr` char(30) NOT NULL,
  PRIMARY KEY (`kod_tipa_stroeniya`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.tip_stroeniya: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tip_stroeniya` DISABLE KEYS */;
/*!40000 ALTER TABLE `tip_stroeniya` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.tip_ulici
CREATE TABLE IF NOT EXISTS `tip_ulici` (
  `Kod_tipa_ul` int(11) NOT NULL AUTO_INCREMENT,
  `Tip_ulici` char(30) NOT NULL,
  `Tip_ulici_kr` char(30) NOT NULL,
  PRIMARY KEY (`Kod_tipa_ul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.tip_ulici: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tip_ulici` DISABLE KEYS */;
/*!40000 ALTER TABLE `tip_ulici` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.tsprv
CREATE TABLE IF NOT EXISTS `tsprv` (
  `tsprv1` int(11) NOT NULL AUTO_INCREMENT,
  `tsprv2r` char(10) NOT NULL,
  `tsprv2u` char(10) NOT NULL,
  `tsprv3r` char(3) NOT NULL,
  `tsprv3u` char(3) NOT NULL,
  PRIMARY KEY (`tsprv1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.tsprv: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tsprv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsprv` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.uchgod
CREATE TABLE IF NOT EXISTS `uchgod` (
  `uchgod1` int(11) NOT NULL AUTO_INCREMENT,
  `uchgod2` char(10) NOT NULL,
  PRIMARY KEY (`uchgod1`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.uchgod: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `uchgod` DISABLE KEYS */;
INSERT INTO `uchgod` (`uchgod1`, `uchgod2`) VALUES
	(1, '2017/2018');
/*!40000 ALTER TABLE `uchgod` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.uchpl
CREATE TABLE IF NOT EXISTS `uchpl` (
  `id_uch_plan` int(11) NOT NULL AUTO_INCREMENT,
  `vveden` date DEFAULT NULL,
  `id_kafedry` int(11) DEFAULT '0',
  `id_spec_z` int(11) DEFAULT '0',
  `id_kval` int(11) DEFAULT '0',
  PRIMARY KEY (`id_uch_plan`),
  KEY `FK_uchpl_kaf` (`id_kafedry`),
  KEY `FK_uchpl_spezz` (`id_spec_z`),
  KEY `FK_uchpl_kval` (`id_kval`),
  CONSTRAINT `FK_uchpl_kaf` FOREIGN KEY (`id_kafedry`) REFERENCES `kaf` (`KAF1`),
  CONSTRAINT `FK_uchpl_kval` FOREIGN KEY (`id_kval`) REFERENCES `kval` (`id_kval`),
  CONSTRAINT `FK_uchpl_spezz` FOREIGN KEY (`id_spec_z`) REFERENCES `spezz` (`SPEZZ1`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.uchpl: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `uchpl` DISABLE KEYS */;
INSERT INTO `uchpl` (`id_uch_plan`, `vveden`, `id_kafedry`, `id_spec_z`, `id_kval`) VALUES
	(1, '2016-09-01', 5, 1, 0);
/*!40000 ALTER TABLE `uchpl` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.uchplpr
CREATE TABLE IF NOT EXISTS `uchplpr` (
  `id_uch_plan` int(11) NOT NULL,
  `semestr` int(11) NOT NULL,
  `id_predmeta` int(11) NOT NULL,
  `id_vida_kontrolya` int(11) NOT NULL,
  `creditov` int(11) NOT NULL,
  `chasov` int(11) NOT NULL,
  `shifr_opp` char(25) NOT NULL,
  PRIMARY KEY (`id_predmeta`,`semestr`,`id_uch_plan`),
  KEY `FK_uchplpr_uchpl` (`id_uch_plan`),
  KEY `FK_uchplpr_predm` (`id_predmeta`),
  KEY `FK_UCHPLPR_vidkont` (`id_vida_kontrolya`),
  CONSTRAINT `FK_UCHPLPR_vidkont` FOREIGN KEY (`id_vida_kontrolya`) REFERENCES `vidkont` (`id_vida_kontrolya`),
  CONSTRAINT `FK_uchplpr_predm` FOREIGN KEY (`id_predmeta`) REFERENCES `predm` (`predm1`),
  CONSTRAINT `FK_uchplpr_uchpl` FOREIGN KEY (`id_uch_plan`) REFERENCES `uchpl` (`id_uch_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.uchplpr: ~59 rows (приблизительно)
/*!40000 ALTER TABLE `uchplpr` DISABLE KEYS */;
INSERT INTO `uchplpr` (`id_uch_plan`, `semestr`, `id_predmeta`, `id_vida_kontrolya`, `creditov`, `chasov`, `shifr_opp`) VALUES
	(1, 2, 2, 1, 3, 32, 'ЗП 1'),
	(1, 1, 3, 1, 3, 32, 'ЗП 2'),
	(1, 4, 4, 1, 2, 32, 'ЗП 3'),
	(1, 1, 5, 4, 2, 32, 'ЗП 4'),
	(1, 2, 5, 4, 2, 32, 'ЗП 4'),
	(1, 3, 5, 4, 2, 32, 'ЗП 4'),
	(1, 4, 5, 1, 2, 32, 'ЗП 4'),
	(1, 3, 6, 4, 3, 32, 'ЗП 5'),
	(1, 4, 7, 4, 2, 32, 'ЗП 6'),
	(1, 6, 8, 4, 2, 32, 'ЗП 7'),
	(1, 1, 9, 1, 5, 80, 'ЗП 8'),
	(1, 2, 10, 1, 5, 80, 'ЗП 9'),
	(1, 1, 11, 1, 3, 48, 'ЗП 10'),
	(1, 1, 12, 1, 4, 64, 'ЗП 11'),
	(1, 2, 13, 4, 4, 64, 'ЗП 12'),
	(1, 3, 15, 4, 3, 48, 'ЗП 13'),
	(1, 4, 16, 1, 4, 48, 'ЗП 14'),
	(1, 5, 17, 1, 5, 80, 'ЗП 15'),
	(1, 8, 18, 4, 4, 50, 'ЗП 16'),
	(1, 1, 20, 4, 2, 32, 'ЗП 17'),
	(1, 2, 20, 4, 2, 32, 'ЗП 17'),
	(1, 3, 20, 4, 2, 32, 'ЗП 17'),
	(1, 4, 20, 4, 2, 32, 'ЗП 17'),
	(1, 5, 20, 4, 2, 32, 'ЗП 17'),
	(1, 6, 20, 4, 2, 32, 'ЗП 17'),
	(1, 1, 21, 4, 2, 32, 'ПП 1'),
	(1, 3, 22, 1, 4, 64, 'ПП 2'),
	(1, 4, 23, 4, 4, 64, 'ПП 3'),
	(1, 5, 24, 1, 4, 64, 'ПП 4'),
	(1, 6, 25, 1, 5, 64, 'ПП 5'),
	(1, 1, 27, 1, 6, 96, 'ПП 6'),
	(1, 2, 28, 1, 4, 64, 'ПП 7'),
	(1, 2, 31, 4, 3, 48, 'ПП 8'),
	(1, 3, 32, 1, 4, 64, 'ПП 9'),
	(1, 4, 33, 1, 4, 64, 'ПП 10'),
	(1, 7, 34, 1, 5, 64, 'ПП 11'),
	(1, 7, 35, 1, 6, 80, 'ПП 12'),
	(1, 6, 36, 1, 3, 32, 'ПП 13'),
	(1, 2, 37, 1, 3, 48, 'ПП 14'),
	(1, 1, 38, 4, 3, 48, 'ПП 15'),
	(1, 3, 39, 1, 4, 64, 'ППс 1'),
	(1, 4, 40, 4, 4, 64, 'ППс 2'),
	(1, 5, 41, 1, 5, 64, 'ППс 3'),
	(1, 6, 42, 1, 5, 64, 'ППс 4'),
	(1, 3, 43, 1, 4, 64, 'ППс 5'),
	(1, 2, 44, 1, 4, 64, 'ППс 6'),
	(1, 8, 45, 1, 3, 40, 'ППс 7'),
	(1, 4, 46, 1, 6, 96, 'ППс 8'),
	(1, 3, 47, 4, 4, 64, 'ППс 9'),
	(1, 7, 48, 1, 5, 64, 'ППс 10'),
	(1, 8, 49, 1, 4, 40, 'ППс 11'),
	(1, 7, 50, 1, 5, 48, 'ППс 12'),
	(1, 7, 51, 1, 5, 64, 'ППс 13'),
	(1, 8, 52, 1, 3, 30, 'ППс 14'),
	(1, 8, 53, 1, 4, 40, 'ППс 15'),
	(1, 5, 54, 1, 5, 64, 'ППс 16'),
	(1, 6, 55, 1, 5, 64, 'ППс 17'),
	(1, 5, 56, 1, 5, 48, 'ППс 18'),
	(1, 6, 57, 4, 4, 64, 'ППс 19');
/*!40000 ALTER TABLE `uchplpr` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.uchplzn
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
  CONSTRAINT `FK_uchplzn_predm` FOREIGN KEY (`id_predmeta`) REFERENCES `predm` (`predm1`),
  CONSTRAINT `FK_uchplzn_uchpl` FOREIGN KEY (`id_uch_plan`) REFERENCES `uchpl` (`id_uch_plan`),
  CONSTRAINT `FK_uchplzn_vidzan` FOREIGN KEY (`id_vida_zanyatiy`) REFERENCES `vidzan` (`vidzan1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.uchplzn: ~164 rows (приблизительно)
/*!40000 ALTER TABLE `uchplzn` DISABLE KEYS */;
INSERT INTO `uchplzn` (`semestr`, `id_uch_plan`, `id_predmeta`, `id_vida_zanyatiy`, `chasov`) VALUES
	(1, 1, 3, 1, 16),
	(1, 1, 9, 1, 48),
	(1, 1, 11, 1, 32),
	(1, 1, 12, 1, 32),
	(1, 1, 21, 1, 16),
	(1, 1, 27, 1, 48),
	(1, 1, 38, 1, 32),
	(1, 1, 3, 2, 16),
	(1, 1, 5, 2, 32),
	(1, 1, 9, 2, 32),
	(1, 1, 11, 2, 16),
	(1, 1, 20, 2, 32),
	(1, 1, 21, 2, 16),
	(1, 1, 12, 3, 32),
	(1, 1, 27, 3, 48),
	(1, 1, 38, 3, 16),
	(1, 1, 3, 4, 58),
	(1, 1, 5, 4, 28),
	(1, 1, 9, 4, 70),
	(1, 1, 11, 4, 42),
	(1, 1, 12, 4, 56),
	(1, 1, 20, 4, 28),
	(1, 1, 21, 4, 28),
	(1, 1, 27, 4, 84),
	(1, 1, 38, 4, 42),
	(2, 1, 10, 1, 48),
	(2, 1, 13, 1, 48),
	(2, 1, 28, 1, 32),
	(2, 1, 31, 1, 16),
	(2, 1, 37, 1, 16),
	(2, 1, 44, 1, 32),
	(2, 1, 2, 2, 32),
	(2, 1, 5, 2, 32),
	(2, 1, 10, 2, 32),
	(2, 1, 13, 2, 16),
	(2, 1, 20, 2, 32),
	(2, 1, 28, 3, 32),
	(2, 1, 31, 3, 32),
	(2, 1, 37, 3, 32),
	(2, 1, 44, 3, 32),
	(2, 1, 2, 4, 58),
	(2, 1, 5, 4, 28),
	(2, 1, 10, 4, 70),
	(2, 1, 13, 4, 56),
	(2, 1, 20, 4, 28),
	(2, 1, 28, 4, 56),
	(2, 1, 31, 4, 42),
	(2, 1, 37, 4, 42),
	(2, 1, 44, 4, 56),
	(3, 1, 6, 1, 16),
	(3, 1, 15, 1, 32),
	(3, 1, 22, 1, 32),
	(3, 1, 32, 1, 32),
	(3, 1, 39, 1, 32),
	(3, 1, 43, 1, 32),
	(3, 1, 47, 1, 32),
	(3, 1, 5, 2, 32),
	(3, 1, 6, 2, 16),
	(3, 1, 15, 2, 16),
	(3, 1, 20, 2, 32),
	(3, 1, 22, 2, 32),
	(3, 1, 32, 3, 32),
	(3, 1, 39, 3, 32),
	(3, 1, 43, 3, 32),
	(3, 1, 47, 3, 32),
	(3, 1, 5, 4, 28),
	(3, 1, 6, 4, 58),
	(3, 1, 15, 4, 42),
	(3, 1, 20, 4, 28),
	(3, 1, 22, 4, 56),
	(3, 1, 32, 4, 56),
	(3, 1, 39, 4, 56),
	(3, 1, 43, 4, 56),
	(3, 1, 47, 4, 56),
	(4, 1, 4, 1, 16),
	(4, 1, 7, 1, 16),
	(4, 1, 16, 1, 32),
	(4, 1, 23, 1, 32),
	(4, 1, 33, 1, 32),
	(4, 1, 40, 1, 32),
	(4, 1, 46, 1, 48),
	(4, 1, 4, 2, 16),
	(4, 1, 5, 2, 32),
	(4, 1, 7, 2, 16),
	(4, 1, 16, 2, 16),
	(4, 1, 20, 2, 32),
	(4, 1, 23, 2, 32),
	(4, 1, 33, 3, 32),
	(4, 1, 40, 3, 32),
	(4, 1, 46, 3, 48),
	(4, 1, 4, 4, 28),
	(4, 1, 5, 4, 28),
	(4, 1, 7, 4, 28),
	(4, 1, 16, 4, 72),
	(4, 1, 20, 4, 28),
	(4, 1, 23, 4, 56),
	(4, 1, 33, 4, 56),
	(4, 1, 40, 4, 56),
	(4, 1, 46, 4, 84),
	(5, 1, 17, 1, 48),
	(5, 1, 24, 1, 32),
	(5, 1, 41, 1, 32),
	(5, 1, 54, 1, 32),
	(5, 1, 56, 1, 32),
	(5, 1, 20, 2, 32),
	(5, 1, 24, 2, 32),
	(5, 1, 17, 3, 32),
	(5, 1, 41, 3, 32),
	(5, 1, 54, 3, 32),
	(5, 1, 56, 3, 16),
	(5, 1, 17, 4, 70),
	(5, 1, 20, 4, 28),
	(5, 1, 24, 4, 56),
	(5, 1, 41, 4, 86),
	(5, 1, 54, 4, 86),
	(5, 1, 56, 4, 102),
	(6, 1, 8, 1, 16),
	(6, 1, 25, 1, 48),
	(6, 1, 36, 1, 16),
	(6, 1, 42, 1, 32),
	(6, 1, 55, 1, 32),
	(6, 1, 57, 1, 32),
	(6, 1, 20, 2, 32),
	(6, 1, 8, 3, 16),
	(6, 1, 25, 3, 16),
	(6, 1, 36, 3, 16),
	(6, 1, 42, 3, 32),
	(6, 1, 55, 3, 32),
	(6, 1, 57, 3, 32),
	(6, 1, 8, 4, 28),
	(6, 1, 20, 4, 28),
	(6, 1, 25, 4, 86),
	(6, 1, 36, 4, 58),
	(6, 1, 42, 4, 86),
	(6, 1, 55, 4, 86),
	(6, 1, 57, 4, 56),
	(7, 1, 34, 1, 48),
	(7, 1, 35, 1, 48),
	(7, 1, 48, 1, 32),
	(7, 1, 50, 1, 32),
	(7, 1, 51, 1, 48),
	(7, 1, 34, 2, 16),
	(7, 1, 50, 2, 16),
	(7, 1, 35, 3, 32),
	(7, 1, 48, 3, 32),
	(7, 1, 51, 3, 16),
	(7, 1, 34, 4, 86),
	(7, 1, 35, 4, 100),
	(7, 1, 48, 4, 86),
	(7, 1, 50, 4, 102),
	(7, 1, 51, 4, 86),
	(8, 1, 18, 1, 30),
	(8, 1, 45, 1, 20),
	(8, 1, 49, 1, 20),
	(8, 1, 52, 1, 20),
	(8, 1, 53, 1, 20),
	(8, 1, 18, 3, 20),
	(8, 1, 45, 3, 20),
	(8, 1, 49, 3, 20),
	(8, 1, 52, 3, 10),
	(8, 1, 53, 3, 20),
	(8, 1, 18, 4, 70),
	(8, 1, 45, 4, 50),
	(8, 1, 49, 4, 80),
	(8, 1, 52, 4, 60),
	(8, 1, 53, 4, 80);
/*!40000 ALTER TABLE `uchplzn` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.ulici
CREATE TABLE IF NOT EXISTS `ulici` (
  `Kod_ulici` int(10) NOT NULL AUTO_INCREMENT,
  `Nazvanie` char(30) NOT NULL,
  `Kod_np` int(11) NOT NULL,
  `Kod_tipa_ul` int(11) NOT NULL,
  PRIMARY KEY (`Kod_ulici`),
  KEY `FK_ulici_tip_ulici` (`Kod_tipa_ul`),
  KEY `FK_ulici_nasel_punkti` (`Kod_np`),
  CONSTRAINT `FK_ulici_nasel_punkti` FOREIGN KEY (`Kod_np`) REFERENCES `nasel_punkti` (`Kod_np`),
  CONSTRAINT `FK_ulici_tip_ulici` FOREIGN KEY (`Kod_tipa_ul`) REFERENCES `tip_ulici` (`Kod_tipa_ul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.ulici: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `ulici` DISABLE KEYS */;
/*!40000 ALTER TABLE `ulici` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.vidi_adresov
CREATE TABLE IF NOT EXISTS `vidi_adresov` (
  `Kod_vida_adresa` int(11) NOT NULL AUTO_INCREMENT,
  `Nazvanie` char(30) NOT NULL,
  PRIMARY KEY (`Kod_vida_adresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.vidi_adresov: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `vidi_adresov` DISABLE KEYS */;
/*!40000 ALTER TABLE `vidi_adresov` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.vidi_rodstva
CREATE TABLE IF NOT EXISTS `vidi_rodstva` (
  `kod_vida_rodstva` int(11) NOT NULL,
  `nazvanie_vida_rodstva` char(30) NOT NULL,
  PRIMARY KEY (`kod_vida_rodstva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.vidi_rodstva: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `vidi_rodstva` DISABLE KEYS */;
/*!40000 ALTER TABLE `vidi_rodstva` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.vidkont
CREATE TABLE IF NOT EXISTS `vidkont` (
  `id_vida_kontrolya` int(11) NOT NULL,
  `ua_nazva_kontrolya` char(30) CHARACTER SET utf8 NOT NULL,
  `ua_krat_nazva_kontrolya` char(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_vida_kontrolya`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы maindb.vidkont: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `vidkont` DISABLE KEYS */;
INSERT INTO `vidkont` (`id_vida_kontrolya`, `ua_nazva_kontrolya`, `ua_krat_nazva_kontrolya`) VALUES
	(1, 'іспит', 'іспит'),
	(2, 'курсова робота', 'КР'),
	(3, 'залік', 'залік'),
	(4, 'диференційований залік', 'диф.залік'),
	(5, 'практика', 'практика');
/*!40000 ALTER TABLE `vidkont` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.vidzan
CREATE TABLE IF NOT EXISTS `vidzan` (
  `vidzan1` int(11) NOT NULL AUTO_INCREMENT,
  `vidzan2r` char(30) DEFAULT NULL,
  `vidzan2u` char(30) NOT NULL,
  `vidzan2e` char(30) DEFAULT NULL,
  `vidzan3r` char(10) DEFAULT NULL,
  `vidzan3u` char(10) NOT NULL,
  `vidzan3e` char(10) DEFAULT NULL,
  `name` char(30) NOT NULL,
  PRIMARY KEY (`vidzan1`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.vidzan: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `vidzan` DISABLE KEYS */;
INSERT INTO `vidzan` (`vidzan1`, `vidzan2r`, `vidzan2u`, `vidzan2e`, `vidzan3r`, `vidzan3u`, `vidzan3e`, `name`) VALUES
	(1, 'лекция', 'лекція', 'lec', 'лк', 'лк', 'lection', 'lection'),
	(2, 'практическое занятие', 'практичне заняття', 'prac', 'пр', 'пр', 'prac', 'prac'),
	(3, 'лабораторное занятие', 'лабораторне заняття', 'labs', 'лаб', 'лаб', 'labs', 'labs'),
	(4, 'самостоятельная работа', 'самостійна робота', 'samost', 'ср', 'ср', 'samost', 'samost');
/*!40000 ALTER TABLE `vidzan` ENABLE KEYS */;

-- Дамп структуры для таблица maindb.zvan
CREATE TABLE IF NOT EXISTS `zvan` (
  `ZVAN1` int(11) NOT NULL AUTO_INCREMENT,
  `ZVAN2R` char(30) NOT NULL,
  `ZVAN2U` char(30) NOT NULL,
  PRIMARY KEY (`ZVAN1`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы maindb.zvan: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `zvan` DISABLE KEYS */;
INSERT INTO `zvan` (`ZVAN1`, `ZVAN2R`, `ZVAN2U`) VALUES
	(1, 'Доцент', 'Доцент'),
	(2, 'Профессор', 'Професор');
/*!40000 ALTER TABLE `zvan` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
