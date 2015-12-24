-- CREATE DATABASE OS_issues_Logs;

-- use OS_issues_Logs;
 
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `OS_issues_Logs`
--

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE IF NOT EXISTS `issues` (
  `issue_id` int(11) NOT NULL,
  `issue_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) DEFAULT NULL,
  `subject` varchar(20) NOT NULL,
  `issue_description` varchar(200) NOT NULL,
  `error_message` varchar(500) NOT NULL,
  `Solution` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`issue_id`, `issue_date`, `id`, `subject`, `issue_description`, `error_message`, `Solution`) VALUES
(1, '0000-00-00 00:00:00', 1, 'JavaScript', 'I''m struggling to create a search using jquery', 'error message', 'i forgot to put # tag on the class reference'),
(2, '0000-00-00 00:00:00', 4, 'Bower package', 'I''m struggling to install npm packages (bower)', 'Could not read from remote repository. Please make sure you have the correct access rights', 'changed package.json file github url link to bower package'),
(3, '0000-00-00 00:00:00', 1, 'JavaScript', 'I''m struggling to use post and get method on the index.js file', 'Route.post() requires callback functions but got a [object Undefined]', 'pending'),
(4, '2015-11-19 22:00:00', 3, 'mysql', 'querying my issiue', 'category id is undefind', 'pending...'),
(5, '0000-00-00 00:00:00', 2, 'mysql and phpmyadmin', 'cant see error messeges and am out of an idea', 'blank', 'pending\r\n'),
(6, '2015-12-21 03:30:45', 3, 'mongodb', ' fatal error: gssapi/gssapi.h: No such file or directory compilation terminated.', 'gyp ERR! build error  gyp ERR! stack Error: `make` failed with exit code: 2', ''),
(7, '2015-12-21 03:46:23', 2, 'query', 'cant add current and time for hidden datetime html input', 'no error message mysql database filed is just blank', ''),
(8, '2015-12-24 15:44:05', 3, 'route', 'I wanted to push data whenever the function is being called back data is doesnt go to mySql data storage', 'Cannot POST /issues/update/', 'my mustache wrappers were located below the form action and method opening div');

-- --------------------------------------------------------

--
-- Table structure for table `category_td`
--

CREATE TABLE IF NOT EXISTS `category_td` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_td`
--

INSERT INTO `category_td` (`id`, `category`) VALUES
(1, 'Languages'),
(2, 'Installations'),
(3, 'mySql_Database'),
(4, 'Terminal_commands'),
(5, 'Libraries'),
(6, 'github'),
(7, 'Other');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_td`
--
ALTER TABLE `category_td`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_td`
--
ALTER TABLE `category_td`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;

-- -- --------------------------------------------------------
-- when log as a root I can just use the commands below
-- CREATE USER oss_seed_db@localhost IDENTIFIED BY 'password';
-- GRANT ALL PRIVILEGES ON OS_issues_Logs.* TO oss_seed_db@localhost;
-- flush privileges;
````
-----------------------------------------------------------------