-- reviews schema

DROP DATABASE IF EXISTS reviewsAPI;
CREATE DATABASE reviewsAPI;

\c reviewsapi;

-- ---
-- Table 'reviews'
-- ---

CREATE TABLE reviews (
  review_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  date BIGINT NOT NULL,
  summary TEXT NOT NULL,
  body TEXT NOT NULL,
  recommended BOOLEAN NOT NULL DEFAULT 'false',
  reported BOOLEAN NOT NULL DEFAULT 'false',
  reviewer_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  response TEXT NULL DEFAULT NULL,
  helpfulness INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);
CREATE INDEX reviews_idx on reviews (product_id);
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
CREATE INDEX photos_idx on photos (review_id);
-- ---
-- Table 'characteristics'
-- ---

CREATE TABLE characteristics (
  id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  characteristic VARCHAR(10) NOT NULL,
  PRIMARY KEY (id)
);
CREATE INDEX char_idx on characteristics (product_id);
CREATE INDEX char_id_idx on characteristics (id);
-- ---
-- Table 'characteristics_review'
-- ---

CREATE TABLE characteristic_reviews (
  id INTEGER NOT NULL,
  characteristic_id INTEGER NOT NULL,
  review_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (review_id) REFERENCES reviews (id),
  FOREIGN KEY (characteristic_id) REFERENCES characteristics (id)
);
CREATE INDEX char_reviews_idx on characteristic_reviews (review_id);
CREATE INDEX char_reviews_char_idx on characteristic_reviews (characteristic_id);
-- ---
-- ETL proccess
-- ---
\! pwd
\copy reviews FROM 'data/reviews.csv' DELIMITER ',' CSV HEADER;
\copy photos FROM 'data/reviews_photos.csv' DELIMITER ',' CSV HEADER;
\copy characteristics FROM 'data/characteristics.csv' DELIMITER ',' CSV HEADER;
\copy characteristic_reviews FROM 'data/characteristic_reviews.csv' DELIMITER ',' CSV HEADER;
