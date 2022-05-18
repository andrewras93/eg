const express = require('express');
const router = express.Router();
const queryController = require('../controllers/queryController');

router.get('/', async (req, res) => {
    const products = await queryController.handleQuery('SELECT * FROM products');

    res.render('products', {
        title: 'Alle Produkter',
        products: products
    });
});

router.get('/disable-popup', async (req, res) => {
    
    res.cookie('isPopUpDisabled', 'true');
    res.redirect('/produkter');
});

module.exports = router;