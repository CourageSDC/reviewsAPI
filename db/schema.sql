-- reviews schema

CREATE DATABASE reviewsAPI;

\c reviewsapi;

-- ---
-- Table 'reviews'
-- ---

DROP TABLE IF EXISTS reviews CASCADE;

CREATE TABLE reviews (
  id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  recommended BOOLEAN NOT NULL DEFAULT 'false',
  reported BOOLEAN NOT NULL DEFAULT 'false',
  response TEXT NULL DEFAULT NULL,
  body TEXT NULL DEFAULT NULL,
  date DATE NOT NULL,
  name TEXT NOT NULL,
  helpfulness INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

-- ---
-- Table 'photos'
-- ---

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id INTEGER NOT NULL,
  review_id INTEGER NOT NULL,
  url TEXT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (review_id) REFERENCES reviews (id)
);

-- ---
-- Table 'characteristics'
-- ---

DROP TABLE IF EXISTS characteristics CASCADE;

CREATE TABLE characteristics (
  id INTEGER NOT NULL,
  characteristic TEXT NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'review_characteristics'
-- ---

DROP TABLE IF EXISTS review_characteristics;

CREATE TABLE review_characteristics (
  id INTEGER NOT NULL,
  review_id INTEGER NOT NULL,
  characteristic_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (review_id) REFERENCES reviews (id),
  FOREIGN KEY (characteristic_id) REFERENCES characteristics (id)
);
