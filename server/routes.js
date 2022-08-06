const express = require('express');

const { getReviews, getMeta } = require('./controllers');

const router = express.Router();

router.get('/reviews', (req, res) => {
  const count = req.query.count || 5;
  const page = req.query.count || 1;
  const product_id = req.query.product_id;
  getReviews(product_id, count, page)
    .then((data) => {
      res.status(200);
      res.send({
        product: product_id.toString(),
        page,
        count,
        results: data
      });
    })
    .catch((err) => {
      console.error(err);
      res.sendStatus(404);
    });
});

// router.post('/reviews', (req, res) => {
//   postReview(req.body)
//     .then(() => {
//       res.sendStatus(201);
//     })
//     .catch((err) => {
//       console.error(err);
//       res.sendStatus(404);
//     });
// })

router.get('/reviews/meta', (req, res) => {
  const product_id = req.query.product_id;
  getMeta(product_id)
    .then((data) => {
      res.status(200);
      res.send(data);
    })
    .catch((err) => {
      console.error(err);
      res.sendStatus(404);
    });
});

module.exports = router;
