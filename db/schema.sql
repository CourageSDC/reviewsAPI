-- reviews schema

DROP DATABASE IF EXISTS reviewsAPI;
CREATE DATABASE reviewsAPI;

\c reviewsapi;

-- ---
-- Table 'reviews'
-- ---

CREATE TABLE reviews (
  id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  date BIGINT NOT NULL,
  summary TEXT NOT NULL,
  body TEXT NOT NULL,
  recommended BOOLEAN NOT NULL DEFAULT 'false',
  reported BOOLEAN NOT NULL DEFAULT 'false',
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  response TEXT NULL DEFAULT NULL,
  helpfulness INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

-- ---
-- Table 'photos'
-- ---

CREATE TABLE photos (
  id INTEGER NOT NULL,
  review_id INTEGER NOT NULL,
  url VARCHAR(200) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (review_id) REFERENCES reviews (id)
);

-- ---
-- Table 'characteristics'
-- ---

CREATE TABLE characteristics (
  id SMALLINT NOT NULL,
  characteristic VARCHAR(10) NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'review_characteristics'
-- ---


CREATE TABLE review_characteristics (
  id INTEGER NOT NULL,
  review_id INTEGER NOT NULL,
  characteristic_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (review_id) REFERENCES reviews (id),
  FOREIGN KEY (characteristic_id) REFERENCES characteristics (id)
);

-- ---
-- Table 'product_characteristics'
-- ---

CREATE TABLE product_characteristics (
  id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  characteristic_id SMALLINT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (characteristic_id) REFERENCES characteristics (id)
);
