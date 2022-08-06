const express = require('express');
const morgan = require('morgan');

require('dotenv').config();
const db = require('../db');
const router = require('./routes');

const app = express();

app.use(express.json());
app.use(morgan('tiny'));
app.use('/', router);

const port = process.env.PORT;

const server = app.listen(port, () => {
  console.log(`listening on port ${port}`);
});

process.on('SIGINT', () => {
  console.log('Goodbye!');
  db.end();
  server.close();
});
