-- CREATE DATABASE OS_issues_Logs;

use OS_issues_Logs;
 
CREATE TABLE category_td (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  PRIMARY KEY (`category_id`)
);

-- Table structure for table `issues`
--

CREATE TABLE issues (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `issue_date` Date,
  `category_id` int(11) DEFAULT NULL,                                  
  `subject` varchar(20) NOT NULL,
  `issue_description` varchar(200) NOT NULL,
  `error_message` varchar(500) NOT NULL,
  `Solution` varchar(300) NOT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `category_id` (`category_id`)
);

ALTER TABLE  `issues` ADD FOREIGN KEY (  `category_id` ) REFERENCES  `OS_issues_Logs`.`category_td` (
`category_id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

-- Dumping data for table `category`

INSERT INTO category_td (category) VALUES ("Languages");
INSERT INTO category_td (category) VALUES ("Installations");
INSERT INTO category_td (category) VALUES ("mySql_Database");
INSERT INTO category_td (category) VALUES ("Terminal_commands");
INSERT INTO category_td (category) VALUES ("Libraries");
INSERT INTO category_td (category) VALUES ("github");
INSERT INTO category_td (category) VALUES ("Other");


INSERT INTO issues (issue_date,category_id,subject,issue_description,error_message,Solution) VALUES (2015-011-26,1,"JavaScript","I'm struggling to create a search using jquery","error message","i forgot to put # tag on the class reference");
INSERT INTO issues (issue_date,category_id,subject,issue_description,error_message,Solution) VALUES (2015-011-26,5,"Bower package","I'm struggling to install npm packages (bower)","Could not read from remote repository. Please make sure you have the correct access rights","changed package.json file github url link to bower package like");
INSERT INTO issues (issue_date,category_id,subject,issue_description,error_message,Solution) VALUES (2015-011-26,1,"JavaScript","I'm struggling to use post and get method on the index.js file","Route.post() requires callback functions but got a [object Undefined]","pending");



-- -- --------------------------------------------------------
-- when log as a root I can just use the commands below
-- CREATE USER oss_seed_db@localhost IDENTIFIED BY 'password';
-- GRANT ALL PRIVILEGES ON OS_issues_Logs.* TO oss_seed_db@localhost;
-- flush privileges;
````
-----------------------------------------------------------------