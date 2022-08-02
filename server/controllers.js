const db = require('../db');

const getReviews = (product_id, count, page) => {
  let queryString = `SELECT
    review_id, rating, summary, recommended, response, body, date, reviewer_name, helpfulness
    FROM reviews
    WHERE review_id > ${(page - 1) * count}
    AND product_id = ${product_id}
    AND reported = false
    LIMIT ${count}`;
  return db.query(queryString)
    .then((res) => {
      return res.rows.map((review) => ({
        ...review,
        date: new Date(Number(1596080481467)).toISOString()
      }));
    })
  };


module.exports.getReviews = getReviews;
