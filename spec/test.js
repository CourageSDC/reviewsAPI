const axios = require(axios);

axios.get('localhost:5000/reviews?product_id=1')
  .then((res) => {
    console.log(res.data);
  })
