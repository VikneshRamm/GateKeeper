const Sequelize = require('sequelize');
const sequelize = new Sequelize('postgres', 'postgres', 'gatekeeper', {
  host: 'localhost',
  dialect: 'postgres',
  pool: {
    max: 9,
    min: 0,
    idle: 10000
  }
});

var users = sequelize.import('../models/users.js');


function dbAuth() {
  sequelize.authenticate().then(() => {
    console.log("Success!");
  }).catch((err) => {
    console.log(err);
  });
}

function getUsers(res) {
  users.findAll({}).then((data) => {
    res.json(data);
  })
}

function addUser() {
  const currTime = new Date();
  users.create({
    UserName: 'Sudharsan',
    UserNickName: 'Susan',
    UserContactNo: '+919894720852',
    UserEmailID: 'sudharsan.varadharajan@solitontech.com',
    UserAccessLevel: 5,
    UserLocation: 1,
    createdAt: currTime.getTime(),
    updatedAt: currTime.getTime()
  })
}

module.exports = {
  dbAuth,
  getUsers,
  addUser
}
