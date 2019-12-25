const express = require('express');
const router = express.Router();
const path = require('path');
const dbConnect = require('../../db/dbConnect');

// const sequelize = dbConnect.sequelize;
// const logger = require();

const app = express();

// APIs
router.get('/', (req, res) => {
    dbConnect.dbAuth();
    dbConnect.getUsers(res);
});

router.post('/add', (req, res) => {
    dbConnect.addUser();
    res.json({msg: "Success!"});
});

module.exports = router;