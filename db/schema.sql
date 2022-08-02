-- reviews schema

CREATE DATABASE reviewsAPI;

\c reviewsapi;

-- ---
-- Table 'reviews'
-- ---

DROP TABLE IF EXISTS reviews CASCADE;

CREATE TABLE reviews (
  id SERIAL NOT NULL,
  product_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  recommended BOOLEAN NOT NULL DEFAULT 'false',
  reported BOOLEAN NOT NULL DEFAULT 'false',
  summary TEXT NOT NULL,
  response TEXT NULL DEFAULT NULL,
  body TEXT NULL DEFAULT NULL,
  date DATE NOT NULL,
  name TEXT NOT NULL,
  email VARCHAR(60),
  helpfulness INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

-- ---
-- Table 'photos'
-- ---

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id SERIAL NOT NULL,
  review_id INTEGER NOT NULL,
  url VARCHAR(200) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (review_id) REFERENCES reviews (id)
);

-- ---
-- Table 'characteristics'
-- ---

DROP TABLE IF EXISTS characteristics CASCADE;

CREATE TABLE characteristics (
  id SMALLSERIAL NOT NULL,
  characteristic VARCHAR(10) NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'review_characteristics'
-- ---

DROP TABLE IF EXISTS review_characteristics;

CREATE TABLE review_characteristics (
  id SERIAL NOT NULL,
  review_id INTEGER NOT NULL,
  characteristic_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (review_id) REFERENCES reviews (id),
  FOREIGN KEY (characteristic_id) REFERENCES characteristics (id)
);

-- ---
-- Table 'review_characteristics'
-- ---

DROP TABLE IF EXISTS product_characteristics (
  id SERIAL NOT NULL,
  product_id INTEGER NOT NULL,
  characteristic_id SMALLINT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (characteristic_id) REFERENCES characteristics (id)
);
