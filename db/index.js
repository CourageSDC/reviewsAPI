const { Client } = require('pg')
require('dotenv').config();

// pools will use environment variables
// for connection information

const client = new Client({
  password: process.env.PSQLPASS,
  database: 'test'
})
client.connect();

client.query('SELECT * FROM person', (err, res) => {
  if (err) {
    console.error(err);
  } else {
    console.log(res.rows);
  }
  client.end()
})
