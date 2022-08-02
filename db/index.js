const { Pool } = require('pg')
require('dotenv').config();


const pool = new Pool({
  database: 'reviewsapi'
})
// Pool.connect();

module.exports = pool;
