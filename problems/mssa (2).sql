-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 16, 2020 at 02:15 PM
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
  `completed` tinyint(4) DEFAULT NULL,
  `time` timestamp(2) NOT NULL DEFAULT current_timestamp(2),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`id`, `name`, `staff_student_id`, `email`, `phone`, `issue`, `assigned_to`, `completed`, `time`) VALUES
(1, 'kojo', '123456', 'kojo@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, '2020-06-16 13:51:47.28'),
(2, 'kobby', '123456', 'kobby@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, '2020-06-16 13:51:47.28'),
(3, 'koko', '123456', 'koko@mis.dev', '123456789', 'i have issues with my portal', NULL, 1, '2020-06-16 13:51:47.28'),
(4, 'kowo', '123456', 'koko@mis.dev', '123456789', 'i have issues with my portal', NULL, 1, '2020-06-16 13:51:47.28'),
(5, 'kawo', '12345634', 'kawo@mis.dev', '123456789', 'cant login', NULL, 1, '2020-06-16 13:51:47.28'),
(6, 'kawo', '12345634', 'kawo@mis.dev', '123456789', 'cant login', 'kobby', NULL, '2020-06-16 13:51:47.28'),
(7, 'sam', '19789652', 'sam@mis.dev', '9282743', 'staff portal issue', 'kobby', NULL, '2020-06-16 13:51:47.28'),
(8, 'sammy', '133489652', 'sammy@mis.dev', '9234743', 'staff portal issue', 'kobby', NULL, '2020-06-16 13:51:47.28'),
(9, 'tuga', '445489652', 'tuga@mis.dev', '9233443', 'staff portal issue', 'kobby', NULL, '2020-06-16 13:51:47.28'),
(10, 'barf', '445589652', 'barf@mis.dev', '9236443', 'staff portal issue', 'kobby', NULL, '2020-06-16 13:51:47.28'),
(11, 'barb', '555589652', 'barb@mis.dev', '9456443', 'staff portal issue', 'kobby', NULL, '2020-06-16 13:51:47.28'),
(12, 'barbera', '244589652', 'barbera@mis.dev', '11156443', 'staff portal issue', 'kobby', NULL, '2020-06-16 13:51:47.28'),
(13, 'barber', '566589652', 'barber@mis.dev', '11144443', 'staff portal issue', 'kobby', NULL, '2020-06-16 13:51:47.28'),
(14, 'barbe', '666589652', 'barbe@mis.dev', '11166643', 'staff portal issue', 'kobby', 1, '2020-06-16 13:51:47.28'),
(15, 'kwadwo', '33389652', 'kwadwo@mis.dev', '1123343', 'staff portal issue', 'kobby', 1, '2020-06-16 13:51:47.28'),
(16, 'kwad', '33383452', 'kwad@mis.dev', '1123343', 'staff portal issue', 'kobby', 1, '2020-06-16 13:51:47.28'),
(17, 'kwa', '33383452', 'kwa@mis.dev', '1123343', 'staff portal issue', 'kobby', 1, '2020-06-16 13:51:47.28'),
(18, 'kwaa', '33383452', 'kwaa@mis.dev', '1123343', 'staff portal issue', 'kobby', 1, '2020-06-16 13:51:47.28'),
(19, 'kwaad', '33383452', 'kwaad@mis.dev', '1123343', 'staff portal issue', 'kobby', 1, '2020-06-16 13:51:47.28'),
(22, 'barber', '566589652', 'barber@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(23, 'bar', '566589652', 'bar@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(24, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(25, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(26, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(27, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(28, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(29, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(30, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(31, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(32, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(33, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(34, 'bart', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, '2020-06-16 13:51:47.28'),
(35, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(36, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(37, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(38, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(39, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(40, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(41, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(42, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(43, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(44, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28'),
(45, 'mana', '987875673', 'mana@mis.dev', '34868675', 'staff portal issue', 'kojo', 1, '2020-06-16 13:51:47.28');

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
