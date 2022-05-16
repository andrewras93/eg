const express = require('express');
const session = require('express-session');
const path = require('path');
const app = express();
const port = 3000;

app.use(express.static(path.join(__dirname, 'public')));

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.set('view engine', 'ejs');

app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: false
}));

/* Routes */
const index = require('./routes/index.js');
const products = require('./routes/products.js');
const cart = require('./routes/cart.js');

app.use('/', index);
app.use('/produkter', products);
app.use('/kurv', cart);
/* Routes END */

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});