const express = require('express');
const router = express.Router();
const queryController = require('../controllers/queryController');

router.get('/', async (req, res) => {
    const users = await queryController.handleQuery("SELECT * FROM users");

    res.json(users);
});

module.exports = router;