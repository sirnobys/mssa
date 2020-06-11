-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by kwadwosarbeng-baafi at 11-06-2020 20:26.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE accounts
DROP TABLE IF EXISTS accounts;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Inserting 1 row into accounts
-- Insert batch #1
INSERT INTO accounts (id, username, password, email) VALUES
(1, 'test', 'test', 'test@test.com');

-- END TABLE accounts

-- BEGIN TABLE problems
DROP TABLE IF EXISTS problems;
CREATE TABLE `problems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `staff_student_id` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `issue` text NOT NULL,
  `assigned_to` varchar(45) NOT NULL,
  `completed` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Table problems contains no data. No inserts have been genrated.
-- Inserting 0 rows into problems


-- END TABLE problems

-- BEGIN TABLE staff
DROP TABLE IF EXISTS staff;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `priority` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Table staff contains no data. No inserts have been genrated.
-- Inserting 0 rows into staff


-- END TABLE staff

