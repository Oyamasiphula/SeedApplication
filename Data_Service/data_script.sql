CREATE TABLE IF NOT EXISTS `category_td` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category_td` (`category_id`, `category_name`) VALUES
(1, 'shortLife'),
(2, 'cannedGoods'),
(3, 'cooldrinks'),
(4, 'longLife'),
(5, 'toiletries'),
(6, 'fruit'),
(7, 'sweets'),
(8, 'gifts');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` text NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `category_id`) VALUES
(1, 'Milk 1l', 1),
(2, 'Imasi', 1),
(3, 'Bread', 1),
(4, 'Chakalaka Can', 2),
(5, 'Gold Dish Vegetable Curry Can', 2),
(6, 'Fanta 500ml', 3),
(7, 'Coke 500ml', 3),
(8, 'Cream Soda 500ml', 3),
(9, 'Iwisa Pap 5kg', 4),
(10, 'Top Class Soy Mince', 4),
(11, 'Shampoo 1 litre', 5),
(12, 'Soap Bar', 5),
(13, 'Bananas - loose', 6),
(14, 'Apples - loose', 6),
(15, 'Mixed Sweets 5s', 8),
(16, 'Heart Chocolates', 8),
(17, 'Rose (plastic)', 7),
(18, 'Valentine Cards', 7);

-- --------------------------------------------------------
