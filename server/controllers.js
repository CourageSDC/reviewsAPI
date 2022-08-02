const db = require('../db');

const getReviews = (product_id, count, page) => {
  let queryString = `SELECT
    id, rating, summary, recommended, response, body, date, reviewer_name, helpfulness
    FROM reviews
    WHERE id > ${(page - 1) * count}
    AND product_id = ${product_id}
    AND reported = false
    LIMIT ${count}`;
  return db.query(queryString)
    .then((res) => {
      return res.rows.map((review) => {
        review.review_id = review.id;
      })
    })
  };


module.exports.getReviews = getReviews;
