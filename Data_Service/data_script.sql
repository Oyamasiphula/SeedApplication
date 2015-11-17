CREATE TABLE IF NOT EXISTS `category_td` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category_td` (`category_id`, `category`) VALUES
(1, 'Languages'),
(2, 'Installations'),
(3, 'mySql_Database'),
(4, 'Terminal_commands'),
(5, 'Libraries'),
(6, 'github'),
(7, 'Other'),
-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `issues` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `Solution` text NOT NULL,
  `Log` text NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`issue_id`,'Category_Specification', `description`,`Solution`,`Log`,`category_id`) VALUES
(1,'JavaScript', 'I"m struggling to create a search using jquery ','i forgot to put # tag on the class reference','error message', 1),
(2,'Bower package', 'I"m struggling to install npm packages (bower)','changed package.json file github url link to bower package like','Could not read from remote repository.
Please make sure you have the correct access rights',5),
(3,'JavaScript','I"m struggling to use post and get method on the index.js file','Route.post() requires callback functions but got a [object Undefined]
',1),

(4,'Boostrap Library','I"m struggling make columns','added .col-md-8 on to my table class','', 2)