DROP DATABASE IF EXISTS `crmapp`;
CREATE DATABASE IF NOT EXISTS `crmapp`;
USE `crmapp`;

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `alias` varchar(150) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `edrpou` varchar(15) DEFAULT NULL,
  `inn` varchar(15) DEFAULT NULL,
  `vat_certificate` varchar(15) DEFAULT NULL,
  `optlock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `agreement`;
CREATE TABLE IF NOT EXISTS `agreement` (
  `id` int(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `client_id` int(11) UNSIGNED DEFAULT NULL,
  `number` varchar(150) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `optlock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `agreement`
  ADD CONSTRAINT `FKf80mc7qmk5p905f2hmfycw1e8` FOREIGN KEY(`client_id`) REFERENCES `client` (`id`);

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `agreement_id` int(11) UNSIGNED DEFAULT NULL,
  `doc_type_id` int(11) UNSIGNED DEFAULT NULL,
  `number` varchar(30) DEFAULT NULL,
  `dated` date DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0',
  `payment_date` date DEFAULT NULL,
  `doc_status_id` int(11) UNSIGNED DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `optlock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `id` int(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `optlock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `document_status`;
CREATE TABLE IF NOT EXISTS `document_status` (
  `id` int(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `status` varchar(150) DEFAULT NULL,
  `optlock` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




INSERT INTO `client` (`alias`, `title`, `edrpou`, `inn`, `vat_certificate`, `optlock`)
VALUES 
  ('kyivstar', 'PRAT "KYIVCTAR"', '00987654', '0098765321', '345432678', 0),
  ('farlep', 'PRAT "FARLEP-INVEST"', '00678906', '00678905412', '087654322', 0);

INSERT INTO `agreement` (`client_id`, `number`, `date_start`, `comment`, `optlock`)
VALUES 
  ('1', '20170701/45/76', '2017-07-01', '', 0),
  ('2', 'FLP-2015/3', '2015-03-01', '??????? ?? ?? 2015 ???', 0);
  
INSERT INTO `document_type` (`title`, `optlock`)
VALUES 
  ('??? ??????????? ?????', 0),
  ('????-???????', 0),
  ('???. ??????????', 0);
  
INSERT INTO `document_status` (`status`, `optlock`)
VALUES 
  ('???????', 0),
  ('????????', 0),
  ('???????', 0);
  
INSERT INTO `document` (`agreement_id`, `doc_type_id`, `number`, `dated`, `amount`, `payment_date`, `doc_status_id`, `comment`, `optlock`)
VALUES 
  ('1', '2', '18', '2017-06-30', 20000.0, null, '1', '', 0),
  ('2', '3', '3', '2017-07-01', 500000.0, '2017-07-01', '2', '?? ???. ?????? ?? 3 ???????', 0),
  ('1', '1', '64', '2017-06-30', 20000.0, '2017-07-10', '3', '', 0);
  
INSERT INTO `acl_sid` (`principal`, `sid`)
VALUES 
  (true, '');