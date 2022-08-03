const axios = require('axios');

axios.get('http://localhost:5000/reviews?product_id=2')
  .then((res) => {
    console.log(JSON.stringify(res.data, null, 2));
  })
  .catch((err) => {
    console.error(err)
  });
