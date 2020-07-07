-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 07, 2020 at 05:08 PM
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
  `seen_status` int(11) DEFAULT 0,
  `delete_status` int(11) DEFAULT 0,
  `time` varchar(11) DEFAULT NULL,
  `date` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mis_requests`
--

INSERT INTO `mis_requests` (`id`, `sent_to`, `sent_by`, `message`, `seen_status`, `delete_status`, `time`, `date`) VALUES
(1, 'kojo', 'kofi', 'ataa adwoa', 0, 0, '12:2:28', '2020-06-24'),
(2, 'kojo', 'kobby', 'hello', 0, 0, '8:00:00', '2020-06-23'),
(3, 'kobby', 'kojo', 'I need a break', 1, 0, '9:00:00', '2020-06-22'),
(4, 'kobby', 'kofi', 'yooooooo', 0, 0, '10:00:00', '2020-06-22'),
(5, 'Unique', 'kobby', 'heyyyaaa', 0, 0, '11:00:00', '2020-06-25'),
(6, 'Unique', 'kobby', 'What\'s good', 0, 0, '10:50:00', '2020-06-22'),
(7, 'Unique', 'kobby', 'heyyyaaa', 0, 0, '10:00:00', '2020-06-21'),
(8, 'Unique', 'kobby', 'Jack', 0, 0, '10:10:28', '2020-06-26'),
(9, 'kujo', 'kobby', 'heyyyaaa', 0, 0, '12:32:28', '2020-06-20'),
(10, 'kujo', 'kobby', 'heyaaaa', 0, 0, '7:00:00', '2020-06-28'),
(11, 'Kujo', 'kobby', 'finally', 0, 0, '11:12:28', '2020-06-21'),
(12, 'kojo', 'kobby', 'new', 0, 0, '10:12:28', '2020-06-28'),
(13, 'kojo', 'kobby', 'kojjjjooooooo', 0, 0, '12:12:28', '2020-06-24'),
(14, 'kojo', 'kobby', ' last one  nie', 0, 1, '16:49:25', '2020-07-07'),
(15, 'Kojo', 'kobby', ' Our AC is malfunctioning  small', 0, 0, '11:39:01', '2020-07-07');

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
  `note` tinytext DEFAULT NULL,
  `issue_category` tinytext DEFAULT NULL,
  `estimated_datetime` varchar(45) DEFAULT NULL,
  `acknowledged` tinyint(4) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT 0,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`id`, `name`, `staff_student_id`, `email`, `phone`, `issue`, `assigned_to`, `note`, `issue_category`, `estimated_datetime`, `acknowledged`, `completed`, `time`) VALUES
(1, 'Jameson', '123456', 'kojo@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(2, 'Adoma', '123456', 'kobby@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(3, 'Kwao', '123456', 'koko@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(4, 'Jeffery', '123456', 'koko@mis.dev', '123456789', 'i have issues with my portal', NULL, NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(5, 'Kidi', '12345634', 'kawo@mis.dev', '123456789', 'cant login', NULL, NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(6, 'John', '12345634', 'kawo@mis.dev', '123456789', 'cant login', 'kobby', NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(7, 'sam', '19789652', 'sam@mis.dev', '9282743', 'staff portal issue', 'kobby', NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(8, 'Scilla', '133489652', 'sammy@mis.dev', '9234743', 'staff portal issue', 'kobby', NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(9, 'Jiga', '445489652', 'tuga@mis.dev', '9233443', 'staff portal issue', 'kobby', '   lllllll', NULL, NULL, NULL, 0, '2020-07-07 16:27:02'),
(13, 'koffie', '566589652', 'barber@mis.dev', '11144443', 'staff portal issue', 'kobby', NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(22, 'Benny', '566589652', 'barber@mis.dev', '11144443', 'staff portal issue', 'kojo', '   do your best  oo   yooo  00000000\r\n  ', NULL, '2020-07-05 00:18:00', 1, 0, '2020-07-07 16:31:34'),
(23, 'Dufie', '566589652', 'bar@mis.dev', '11144443', 'staff portal issue', 'kojo', ' as expected  okay\r\n', NULL, '2020-12-03 00:00:00', 1, 0, '2020-07-07 16:29:52'),
(24, 'Adams Oppong Afriyie', 'AR/MAB/20/0022', 'adams.oppong@stu.ucc.edu.gh', '0245678909', 'I have difficulty in giving my time to some relevant important critiques of some sort', 'kojo', '  monitor gimme  okay ok\r\n  ', NULL, '2020-07-25 00:23:00', 1, 0, '2020-07-07 16:13:56'),
(31, 'Rashford', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(32, 'Martial', '566589652', 'bart@mis.dev', '11144443', 'staff portal issue', 'kojo', NULL, NULL, NULL, NULL, 0, '2020-07-07 16:13:56'),
(50, 'Ronaldo', '1223344', 'duodu@g.com', '098737', 'well  well well', NULL, 'Just do as is', 'student portal', NULL, NULL, 0, '2020-07-07 16:13:56'),
(51, 'Mike', '1234', 'unique@gmail.com', '567890', 'only trying', NULL, 'More vim', 'results', NULL, NULL, 0, '2020-07-07 16:13:56'),
(52, 'Mary', '12345', 'sirnobys@gmail.com', '0246971090', 'Wrong hall assigned', 'kojo', 'It\'s a delicate issue\r\n', 'hall placement', NULL, NULL, 0, '2020-07-07 16:13:56');

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
(3, 'Unique', 'unique@gmail.com', NULL, '12345', 2),
(4, 'Kujo', 'kujo@g.com', '1234567890', '12345', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
