const {OAuth2Client} = require('google-auth-library');

const CLIENT_ID = '819801723091-c220n12ttnnvbrdojs2m281svp52flfq.apps.googleusercontent.com';

const client = new OAuth2Client(CLIENT_ID);
var token;

async function verify(token, clientDetails) {
  const ticket = await client.verifyIdToken({
      idToken: token,
      audience: CLIENT_ID,  // Specify the CLIENT_ID of the app that accesses the backend
      // Or, if multiple clients access the backend:
      //[CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3]
  });
  const payload = ticket.getPayload();
  const userid = payload['sub'];
  // If request specified a G Suite domain:
  //const domain = payload['hd'];
}

exports.googAuthTokenVerify = verify();
// verify().catch(console.error);