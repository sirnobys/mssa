-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 27, 2020 at 08:30 PM
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
-- Table structure for table `mis_requests`
--

DROP TABLE IF EXISTS `mis_requests`;
CREATE TABLE IF NOT EXISTS `mis_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent_to` varchar(45) DEFAULT NULL,
  `sent_by` varchar(45) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `seen_status` int(11) NOT NULL DEFAULT 0,
  `delete_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mis_requests`
--

INSERT INTO `mis_requests` (`id`, `sent_to`, `sent_by`, `message`, `seen_status`, `delete_status`) VALUES
(1, 'kojo', 'kofi', 'ataa adwoa', 0, 0),
(2, 'Unique', 'kobby', 'Im Hungry', 0, 0),
(3, 'Unique', 'kobby', 'I need a break', 0, 0),
(4, 'Unique', 'kobby', 'heyyyaaa', 1, 0),
(5, 'Unique', 'kobby', 'heyyyaaa', 0, 0),
(6, 'Unique', 'kobby', 'heyyyaaa', 1, 0),
(7, 'Unique', 'kobby', 'heyyyaaa', 0, 0),
(8, 'Unique', 'kobby', 'heyyyaaa', 0, 0),
(9, 'Unique', 'kobby', 'heyyyaaa', 0, 0),
(10, 'kojo', 'kobby', 'heyaaaa', 0, 0),
(11, 'Kujo', 'kobby', 'finally', 0, 0);

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
  `acknowledged` tinyint(4) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`id`, `name`, `staff_student_id`, `email`, `phone`, `issue`, `assigned_to`, `issue_category`, `acknowledged`, `completed`) VALUES
(1, 'kojo', '123456', 'kojo@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, NULL, 0),
(2, 'kobby', '123456', 'kobby@mis.dev', '123456789', 'i have issues with my portal', '', NULL, NULL, 0),
(3, 'koko', '123456', 'koko@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, NULL, 0),
(4, 'kowo', '123456', 'koko@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, NULL, 0),
(5, 'kawo', '12345634', 'kawo@mis.dev', '123456789', 'cant login', NULL, NULL, NULL, 0),
(6, 'kawo', '12345634', 'kawo@mis.dev', '123456789', 'cant login', 'kobby', NULL, NULL, 0),
(7, 'sam', '19789652', 'sam@mis.dev', '9282743', 'staff portal issue', 'kobby', NULL, NULL, 0),
(8, 'sammy', '133489652', 'sammy@mis.dev', '9234743', 'staff portal issue', 'kobby', NULL, NULL, 0),
(9, 'tuga', '445489652', 'tuga@mis.dev', '9233443', 'staff portal issue', 'kobby', NULL, NULL, 0),
(10, 'barf', '445589652', 'barf@mis.dev', '9236443', 'staff portal issue', 'kobby', NULL, 1, 1),
(11, 'barb', '555589652', 'barb@mis.dev', '9456443', 'staff portal issue', 'kobby', NULL, NULL, 0),
(12, 'barbera', '244589652', 'barbera@mis.dev', '11156443', 'staff portal issue', 'kobby', NULL, NULL, 0),
(13, 'barber', '566589652', 'barber@mis.dev', '11144443', 'staff portal issue', 'kobby', NULL, NULL, 0),
(14, 'barbe', '666589652', 'barbe@mis.dev', '11166643', 'staff portal issue', 'kobby', NULL, NULL, 0),
(15, 'kwadwo', '33389652', 'kwadwo@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, NULL, 0),
(16, 'kwad', '33383452', 'kwad@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, NULL, 0),
(17, 'kwa', '33383452', 'kwa@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, NULL, 0),
(18, 'kwaa', '33383452', 'kwaa@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, NULL, 0),
(19, 'kwaad', '33383452', 'kwaad@mis.dev', '1123343', 'staff portal issue', 'kobby', NULL, NULL, 0),
(22, 'barber', '566589652', 'barber@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(23, 'bar', '566589652', 'bar@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(24, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(25, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(26, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(27, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(28, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(29, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(30, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(31, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(32, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(33, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(34, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, 0),
(35, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(36, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(37, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(38, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(39, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(40, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(41, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(42, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(43, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(44, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(45, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', NULL, NULL, 0),
(46, 'Unique', '000000', 'unique@gmail.com', '0000000', 'More unique', NULL, NULL, NULL, 0),
(47, 'JAmes', '7798', 'ertyghjkl', '99', '67890', NULL, NULL, NULL, 0),
(50, 'Mike', '1223344', 'duodu@g.com', '098737', 'well  well well', NULL, 'student portal', NULL, 0),
(51, 'Mike', '1234', 'unique@gmail.com', '567890', 'only trying', NULL, 'results', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `email`, `phone`, `password`, `priority`) VALUES
(0, 'kojo', 'kojo@mis.dev', NULL, '12345', 1),
(1, 'kobby', 'kobby@mis.dev', NULL, '12345', 2),
(2, 'mike', 'mike@mis.dev', NULL, '12345', 3),
(3, 'Unique', 'unique@gmail.com', NULL, '2', 2),
(4, 'Kujo', 'kujo@g.com', '1234567890', '2', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
