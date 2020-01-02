const express = require('express');
const router = express.Router();
const path = require('path');
const dbConnect = require('../../db/dbConnect');
// const auth = require('../auth.js');

const {OAuth2Client} = require('google-auth-library');



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

router.post('/token_id', (req, res) => {
    var userDetails;

    // console.log(req.body.token);

    if (!req.body.token)
    {
        return res.status(400).json({msg: "Token Missing."});
    }

    const CLIENT_ID = '819801723091-c220n12ttnnvbrdojs2m281svp52flfq.apps.googleusercontent.com';

    const client = new OAuth2Client(CLIENT_ID);

    async function verify(req, res) {
        const ticket = await client.verifyIdToken({
            idToken: req.body.token,
            audience: CLIENT_ID,  // Specify the CLIENT_ID of the app that accesses the backend
            // Or, if multiple clients access the backend:
            //[CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3]
        });
        const payload = ticket.getPayload();
        const userid = payload['sub'];
        // If request specified a G Suite domain:
        const domain = payload['hd'];

        res.json({
            userid: userid,
            domain: domain,
            email: payload['email']
        }
        );
    }

    verify(req, res);
    // auth.googAuthTokenVerify(req.body.token, userDetails);
    // res.json({msg: "Success!"});
});

module.exports = router;