const db = require('../db');
//id,review_id,url
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


module.exports.getReviews = getReviews;
