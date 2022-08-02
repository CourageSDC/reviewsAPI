const express = require('express');
require('dotenv').config;
const db = require('../db');
const router = require('./routes');

const app = express();

app.use(express.json());
app.use('/', router);

const port = 5000;

app.listen(port, () => {
  console.log(`listening on port ${port}`);
});

process.on('SIGINT', () => {
  console.log('Goodbye!');
  db.end()
});
