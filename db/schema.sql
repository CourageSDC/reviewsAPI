-- reviews schema

-- ---
-- Table 'reviews'
-- ---

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` INTEGER NOT NULL,
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
  `id` INTEGER NOT NULL,
  `review_id` INTEGER NULL NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`photo_id`),
  FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`)
);

-- ---
-- Table 'characteristics'
-- ---

DROP TABLE IF EXISTS `characteristics`;

CREATE TABLE `characteristics` (
  `id` INTEGER NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`characteristic_id`),
);

-- ---
-- Table 'review_characteristics'
-- ---

DROP TABLE IF EXISTS `review_characteristics`;

CREATE TABLE `review_characteristics` (
  `id` INTEGER NOT NULL,
  `review_id` INTEGER NOT NULL,
  `characteristic_id` INTEGER NOT NULL,
  `rating` TINYINT NOT NULL,
  PRIMARY KEY (`id`)
  FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`),
  FOREIGN KEY (`characteristic_id`) REFERENCES `characteristics` (`id`)
);
