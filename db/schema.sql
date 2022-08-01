-- reviews schema

-- ---
-- Table 'reviews'
-- ---

DROP TABLE IF EXISTS `reviews`;
		
CREATE TABLE `reviews` (
  `review_id` INTEGER NOT NULL,
  `product_id` INTEGER NOT NULL,
  `rating` TINYINT NOT NULL,
  `recommended` BINARY NOT NULL DEFAULT '0',
  `reported` BINARY NOT NULL DEFAULT '0',
  `response` VARCHAR(200) NULL DEFAULT NULL,
  `body` VARCHAR(200) NULL DEFAULT NULL,
  `date` DATE NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  `helpfulness` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`review_id`)
);

-- ---
-- Table 'photos'
-- ---

DROP TABLE IF EXISTS `photos`;
		
CREATE TABLE `photos` (
  `photo_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `review_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
  FOREIGN KEY (review_id) REFERENCES `reviews` (`review_id`)
);
