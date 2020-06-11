var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

//get dashboard page
router.get('/dashboard', function(req, res, next) {
  res.render('dashboard', { title: 'Express' });
});

//get assigned page
router.get('/assigned', function(req, res, next) {
  res.render('assigned', { title: 'Express' });
});

//get completed page
router.get('/completed', function(req, res, next) {
  res.render('completed', { title: 'Express' });
});

//get completed page
router.get('/solver', function(req, res, next) {
  res.render('solver', { title: 'Express' });
});


// router.post('/auth',async function(request, response) {
// 	var username = request.body.username;
// 	var password = request.body.password;
// 	if (username && password) {
// 		await db.query('SELECT * FROM accounts WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
// 			if (results.length > 0) {
// 				// request.session.authenticated = true;
//         // request.session.username = username;
//       //   request.session.user = results[0];
//       // request.session.authenticated = true;
//       // request.session.save();
        
// 				response.redirect('/dashboard');
// 			} else {
// 				response.send('Incorrect Username and/or Password!');
// 			}			
// 			response.end();
// 		});
// 	} else {
// 		response.send('Please enter Username and Password!');
// 		response.end();
// 	}
// });


module.exports = router;
