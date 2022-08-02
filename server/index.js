const express = require('express');
const morgan = require('morgan');

require('dotenv').config();
const db = require('../db');
const router = require('./routes');

const app = express();

app.use(express.json());
app.use(morgan('tiny'));
app.use('/', router);

// app.get('/reviews', (req, res) => {
//   console.log(req.query);
//   res.sendStatus(200);
// })

const port = 5000;

const server = app.listen(port, () => {
  console.log(`listening on port ${port}`);
});

process.on('SIGINT', () => {
  console.log('Goodbye!');
  db.end();
  server.close();
});
