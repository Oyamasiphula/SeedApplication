CREATE TABLE category_td (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  PRIMARY KEY (`category_id`)
);

-- Table structure for table `issues`
--
CREATE TABLE issues (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `Category_Specification` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `Solution` varchar(300) NOT NULL,
  `error_message` varchar(500) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
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


INSERT INTO issues (Category_Specification,description,Solution,error_message,category_id) VALUES ("JavaScript","I'm struggling to create a search using jquery","i forgot to put # tag on the class reference","error message",1);
INSERT INTO issues (Category_Specification,description,Solution,error_message,category_id) VALUES ("Bower package","I'm struggling to install npm packages (bower)","changed package.json file github url link to bower package like","Could not read from remote repository. Please make sure you have the correct access rights", 5);
INSERT INTO issues (Category_Specification,description,Solution,error_message,category_id) VALUES ("JavaScript","I'm struggling to use post and get method on the index.js file","Route.post() requires callback functions but got a [object Undefined]",1);



-- -- --------------------------------------------------------