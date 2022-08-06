const db = require('../db');

const getReviews = (product_id, count, page) => {
  let queryString = `SELECT
    review_id, rating, summary, recommended, response, body, date, reviewer_name, helpfulness,
    ( SELECT coalesce(json_agg(row_to_json(pics)), '[]'::json)
      FROM (
        SELECT id, url FROM photos
        WHERE photos.review_id = reviews.review_id
        AND reviews.product_id = ${product_id}
      ) AS pics
    ) AS photos
    FROM reviews
    WHERE review_id > ${(page - 1) * count}
    AND product_id = ${product_id}
    AND reported = false
    LIMIT ${count}`;
  return db.query(queryString)
    .then((res) => {
      return res.rows.map((review) => ({
        ...review,
        date: new Date(Number(review.date)).toISOString()
      }));
    });
};

const getMeta = (product_id) => {
  let queryString = `SELECT
    (
      SELECT json_agg(row_to_json(r)) FROM (
        SELECT rating, COUNT(*) FROM reviews
        WHERE product_id = 2
        GROUP BY rating
      ) AS r
    ) AS ratings,
    (
      SELECT json_agg(row_to_json(r)) FROM (
        SELECT recommended, COUNT(*) FROM reviews
        WHERE product_id = ${product_id}
        GROUP BY recommended
      ) AS r
    ) AS recommended,
    (
      SELECT json_agg(row_to_json(r)) FROM (
        SELECT
          characteristics.id,
          characteristic,
          AVG(rating)
        FROM
          characteristics,
          characteristic_reviews
        WHERE
          product_id = ${product_id}
          AND characteristic_id = characteristics.id
        GROUP BY
          characteristic, characteristics.id
      ) AS r
    ) AS characteristics`
  return db.query(queryString)
    .then((res) => {
      const data = res.rows[0];

      const ratings = {};
      for (let i = 0; i < data.ratings.length; i++) {
        const rating = data.ratings[i];
        ratings[rating.rating] = rating.count.toString(10);
      }

      const recommended = {};
      for (let i = 0; i < data.recommended.length; i++) {
        const choice = data.recommended[i];
        recommended[choice.recommended] = choice.count.toString(10);
      }

      const characteristics = {};
      for (let i = 0; i < data.characteristics.length; i++) {
        const ch = data.characteristics[i]
        characteristics[ch.characteristic] = {
          id: ch.id,
          value: ch.avg.toString(10)
        };
      }

      product_id = product_id.toString();
      return { product_id, ratings, recommended, characteristics };
    });
}

/*
with first_insert as (
   insert into sample(firstname,lastname) 
   values('fai55','shaggk') 
   RETURNING id
), 
second_insert as (
  insert into sample1( id ,adddetails) 
  values
  ( (select id from first_insert), 'ss')
  RETURNING user_id
)
insert into sample2 ( id ,adddetails) 
values 
( (select user_id from first_insert), 'ss');
*/

// const postReview = (params) => {
//   const queryString = `INSERT INTO
//   reviews ( product_id, rating, summary, recommended, body, date, reviewer_name, email )
//   VALUES (
//     ${params.product_id}
//     ${params.rating}
//     ${params.summary}
//     ${params.recommended}
//     ${params.body}
//     ${(new Date()).valueOf()}
//     ${params.name}
//     ${params.email}
//   )
//   `
//   return db.query(queryString);
// }



module.exports.getReviews = getReviews;
module.exports.getMeta = getMeta;
// module.exports.postReview = postReview;
