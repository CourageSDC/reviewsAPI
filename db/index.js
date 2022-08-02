const { Client } = require('pg')
require('dotenv').config();


const client = new Client({
  database: 'reviewsapi'
})
client.connect();

client.query('SELECT * FROM reviews LIMIT 1')
  .then((res) => {
    console.log(res);
    client.end();
  });
