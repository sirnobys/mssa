-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 22, 2020 at 01:04 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mssa`
--

-- --------------------------------------------------------

--
-- Table structure for table `issue_category`
--

DROP TABLE IF EXISTS `issue_category`;
CREATE TABLE IF NOT EXISTS `issue_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issue_category`
--

INSERT INTO `issue_category` (`id`, `category`) VALUES
(1, 'student portal'),
(2, 'staff portal'),
(3, 'oasis account'),
(4, 'ucosis account'),
(5, 'institutional email'),
(6, 'personal details'),
(7, 'course registration'),
(8, 'course grouping'),
(9, 'hall placement'),
(10, 'room placement'),
(11, 'results'),
(12, 'exams timetable'),
(13, 'staff id\r\n'),
(14, 'student id');

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
CREATE TABLE IF NOT EXISTS `problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `staff_student_id` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `issue` text NOT NULL,
  `assigned_to` varchar(45) DEFAULT NULL,
  `issue_category` tinytext DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`id`, `name`, `staff_student_id`, `email`, `phone`, `issue`, `assigned_to`, `issue_category`, `completed`) VALUES
(1, 'kojo', '123456', 'kojo@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, 1),
(2, 'kobby', '123456', 'kobby@mis.dev', '123456789', 'i have issues with my portal', '', NULL, NULL),
(3, 'koko', '123456', 'koko@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, 1),
(4, 'kowo', '123456', 'koko@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, 1),
(5, 'kawo', '12345634', 'kawo@mis.dev', '123456789', 'cant login', NULL, NULL, 1),
(6, 'kawo', '12345634', 'kawo@mis.dev', '123456789', 'cant login', 'kobby', NULL, NULL),
(7, 'sam', '19789652', 'sam@mis.dev', '9282743', 'staff portal issue', 'kobby', NULL, NULL),
(8, 'sammy', '133489652', 'sammy@mis.dev', '9234743', 'staff portal issue', 'kobby', NULL, NULL),
(9, 'tuga', '445489652', 'tuga@mis.dev', '9233443', 'staff portal issue', 'kobby', NULL, NULL),
(10, 'barf', '445589652', 'barf@mis.dev', '9236443', 'staff portal issue', 'kobby', NULL, NULL),
(11, 'barb', '555589652', 'barb@mis.dev', '9456443', 'staff portal issue', 'kobby', NULL, NULL),
(12, 'barbera', '244589652', 'barbera@mis.dev', '11156443', 'staff portal issue', 'kobby', NULL, NULL),
(13, 'barber', '566589652', 'barber@mis.dev', '11144443', 'staff portal issue', 'kobby', NULL, NULL),
(14, 'barbe', '666589652', 'barbe@mis.dev', '11166643', 'staff portal issue', 'kobby', NULL, 1),
(15, 'kwadwo', '33389652', 'kwadwo@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, 1),
(16, 'kwad', '33383452', 'kwad@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, 1),
(17, 'kwa', '33383452', 'kwa@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, 1),
(18, 'kwaa', '33383452', 'kwaa@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, 1),
(19, 'kwaad', '33383452', 'kwaad@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, 1),
(22, 'barber', '566589652', 'barber@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(23, 'bar', '566589652', 'bar@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(24, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(25, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(26, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(27, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(28, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(29, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(30, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(31, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(32, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(33, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(34, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL),
(35, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(36, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(37, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(38, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(39, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(40, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(41, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(42, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(43, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(44, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(45, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, 1),
(46, 'Unique', '000000', 'unique@gmail.com', '0000000', 'More unique', NULL, NULL, NULL),
(47, 'JAmes', '7798', 'ertyghjkl', '99', '67890', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `email`, `password`, `priority`) VALUES
(0, 'kojo', 'kojo@mis.dev', '12345', 1),
(1, 'kobby', 'kobby@mis.dev', '12345', 2),
(2, 'mike', 'mike@mis.dev', '12345', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
