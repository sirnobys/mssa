var express = require('express');
var router = express.Router();

//calling database file to connect to database
var db = require("../config.js/database");

//isAuthenticated,  async function to verify if the user is logged in
var isAuthenticated = (req, res, next) => {
  if (!req.session.authenticated) res.redirect("/");
  next();
};

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('login', { title: 'Express' });
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


//getting the login page 
router.get('/login',async function(req, res, next) {
  //storing data entered by user into a variable
  var username = req.body.username;
  var password = req.body.password;
  const data = [username, password];

   //query to check the existence of a user
   let sql = await db.query(
    "SELECT * FROM staff WHERE username = ? and pass = ?  ",
    data
  );

  //crosschecking user identity to showcase data to them
  if (sql.length>0){
    req.session.user=sql[0];
      req.session.authenticated = true;
      req.session.save();
      if(sql[0].priority==3){
        res.redirect('/dashboard');
      }
      else if(sql[0].priority==2){
        res.redirect('/dashboard');
      }
      else if(sql[0].priority==1){
        res.redirect('/solver');
      }
      else{
        res.locals.msg = "wrong credentials";
    res.redirect("/");
      };
  }

});

router.get('/Pro', function(req, res, next) {
  res.render('', { title: 'Express' });
});



module.exports = router;
