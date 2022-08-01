const { Pool, Client } = require('pg')
require('dotenv').config();

// pools will use environment variables
// for connection information

const pool = new Pool({
  password: process.env.PSQLPASS
})

pool.query('SELECT NOW()', (err, res) => {
  console.log(err, res)
  pool.end()
})
