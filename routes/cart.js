const express = require('express');
const router = express.Router();
const queryController = require('../controllers/queryController');

let cart;
let neededProducts;
let temp;

router.get('/', (req, res) => {
    if(!req.session.cart) {
        req.session.cart = [];
    }
    cart = req.session.cart;

    const cartTotal = cart.reduce((accumulator, object) => {
        return accumulator + parseFloat(object.price);
    }, 0);

    res.render('cart', {
        title: 'Indkøbskurv',
        cart: cart,
        cartTotal: cartTotal
    });
});

router.post('/:id', async (req, res) => {
    temp.push(req.body);

    if(!req.session.cart) {
        req.session.cart = [];
    }
    cart = req.session.cart;

    cart.push(req.body);

    neededProducts = neededProducts.filter(({id}) => !temp.some((e) => e.id == id));

    const product = await queryController.handleQuery(`SELECT * FROM products WHERE id=${req.params.id}`);
    const products = await queryController.handleQuery(`SELECT * FROM products`);

    res.render('products', {
        title: 'Alle Produkter',
        products: products,
        product: product[0],
        popUp: true,
        neededProducts: neededProducts,
        extraProduct: req.body.title
    });
});

router.get('/:id', async (req, res) => {
    temp = [];

    if(!req.session.cart) {
        req.session.cart = [];
    }
    cart = req.session.cart;
    
    const product = await queryController.handleQuery(`SELECT * FROM products WHERE id=${req.params.id}`);
    const products = await queryController.handleQuery(`SELECT * FROM products`);
    neededProducts = await queryController.handleQuery(`SELECT * FROM products WHERE id!=${req.params.id} AND category = ${product[0].category}`);
    let hasProducts;

    if(neededProducts.length) {
        hasProducts = true;
    } else {
        hasProducts = false;
    }

    cart.push(product[0]);

    //neededProducts = neededProducts.filter(({id}) => !cart.some((e) => e.id === id));

    if(!neededProducts.length) {
        hasProducts = false;
    }

    res.render('products', {
        title: 'Alle Produkter',
        products: products,
        product: product[0],
        popUp: hasProducts,
        neededProducts: neededProducts
    });
});

module.exports = router;