-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 11, 2015 at 10:46 AM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `OS_issues_Logs`
--
# seed_app

## Database details:

##Run this script to create your database and user

##sql

create database OS_issues_Logs;

CREATE USER oss_seed_db@localhost IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON OS_issues_Logs.* TO oss_seed_db@localhost;
flush privileges;

-- --------------------------------------------------------

--
-- Table structure for table `category_td`
--

CREATE TABLE IF NOT EXISTS `category_td` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `category_td`
--

INSERT INTO `category_td` (`category_id`, `category`) VALUES
(1, 'Languages'),
(2, 'Installations'),
(3, 'mySql_Database'),
(4, 'Terminal_commands'),
(5, 'Libraries'),
(6, 'github'),
(7, 'Other');
-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE IF NOT EXISTS `issues` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subject` varchar(20) NOT NULL,
  `issue_description` varchar(200) NOT NULL,
  `error_message` varchar(500) NOT NULL,
  `Solution` varchar(300) NOT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`issue_id`, `issue_date`, `category_id`, `subject`, `issue_description`, `error_message`, `Solution`) VALUES
(1, '0000-00-00', 1, 'JavaScript', 'I''m struggling to create a search using jquery', 'error message', 'i forgot to put # tag on the class reference'),
(2, '0000-00-00', 5, 'Bower package', 'I''m struggling to install npm packages (bower)', 'Could not read from remote repository. Please make sure you have the correct access rights', 'changed package.json file github url link to bower package like'),
(3, '0000-00-00', 1, 'JavaScript', 'I''m struggling to use post and get method on the index.js file', 'Route.post() requires callback functions but got a [object Undefined]', 'pending'),
(4, '2015-11-20', 4, 'mysql', 'querying my issiue', 'category id is undefind', 'pending...');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_td` (`category_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
