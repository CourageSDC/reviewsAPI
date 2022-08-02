const db = require('../db');

const getReviews = (product_id, count, page) => {
  let queryString = `SELECT
    review_id, rating, summary, recommend, response, body, date, reviewer_name, helpfulness
    FROM reviews
    WHERE id > ${(page - 1) * count}
    AND product_id = ${product_id}
    LIMIT ${count} OFFSET ${offset}`;
  return db.query(queryString)
    .then((res) => res.rows)
    .catch(() => console.log('error getting reviews from db'))
  };


module.exports.getReviews = getReviews;
