const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.render('index', {
        title: 'Forside'
    });
});

router.get('/produkter-api', async (req, res) => {
    const products = await queryController.handleQuery('SELECT * FROM products');

    res.json(products);
});

module.exports = router;