-- phpMyAdmin SQL Dump
-- version 4.2.12deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 09, 2016 at 11:14 AM
-- Server version: 5.5.40-0+wheezy1
-- PHP Version: 5.6.2-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `MyTVTools_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `eit`
--

CREATE TABLE IF NOT EXISTS `eit` (
  `ideit` int(11) NOT NULL,
  `lcn` int(11) DEFAULT '0',
  `usi` int(11) DEFAULT '0',
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `user1` varchar(45) DEFAULT NULL,
  `section_0` mediumtext,
  `section_1` mediumtext,
  `enable` tinyint(4) DEFAULT '0',
  `eit_ts` bigint(20) DEFAULT NULL,
  `videofile` varchar(255) DEFAULT NULL,
  `videoid` int(11) NOT NULL,
  `address` varchar(15) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `tsid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `onid` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'NEW',
  `lastUpdate` datetime DEFAULT NULL,
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `to_inject` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `idvideo` int(11) NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `color` tinyint(4) NOT NULL DEFAULT '1',
  `resolution` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT 'HD',
  `ocs` tinyint(4) NOT NULL DEFAULT '0',
  `csa5` tinyint(4) NOT NULL DEFAULT '0',
  `format` varchar(5) CHARACTER SET utf8 NOT NULL DEFAULT '16/9',
  `status` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'NEW',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `protected` tinyint(4) NOT NULL DEFAULT '1',
  `audio` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pmt` text CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eit`
--
ALTER TABLE `eit`
 ADD PRIMARY KEY (`ideit`), ADD UNIQUE KEY `address_UNIQUE` (`address`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
 ADD PRIMARY KEY (`idvideo`), ADD UNIQUE KEY `filename` (`filename`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
