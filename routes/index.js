const express = require('express');
const router = express.Router();
const queryController = require('../controllers/queryController');

router.get('/', (req, res) => {
    res.render('index', {
        title: 'Forside'
    });
});

router.get('/profil', (req, res) => {
    const cookies = req.cookies;
    if(cookies.user) {
        res.render('profile', {
            title: 'Profil',
            username: cookies.user
        });
    } else {
        res.redirect('/login');
    }
});

router.get('/logud', (req, res) => {
    res.clearCookie("user");
    res.redirect('/');
});

router.get('/produkter-api', async (req, res) => {
    const products = await queryController.handleQuery('SELECT * FROM products');

    res.json(products);
});

module.exports = router;