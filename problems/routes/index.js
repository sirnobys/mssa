var express = require('express');
var router = express.Router();

//calling database file to connect to database
var db = require('../config/config');

//function to verify if the user is logged in
var isAuthenticated = (req,res,next)=>{
  if(!req.session.authenticated) res.redirect('/') 
  next()
}

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('login', { title: 'Express' });
});


//route to check if user exists in database, if not go back to login page
router.post('/auth', async function(req,res,next){
  //storing data entered by user into a variable
  var username = req.body.username;
  var password = req.body.password;
  const data = [username,password];

  //query to check the existence of a user
  let sql = await db.query("SELECT * FROM staff WHERE name = ? and password = ?",data);
  if(sql.length > 0){
     const user = sql[0];

     //storing user details in a session to be used outside the route
     req.session.user = user;
     req.session.authenticated = true;
     if (user.priority==3){
      res.redirect('/dashboard3');
     }
     else if(user.priority==2){
       res.redirect('/dashboard2');
     }
     else{
      res.redirect('/dashboard1');
     }
     
  }else{
     res.locals.msg = "wrong credentials";
     res.redirect('/');
  }
  });

    //route to display dashboard priority three page
router.get('/dashboard3',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.name;
   // var dt = await db.query("select * from messages order by id desc");
    var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
   
    res.render('priorityThree/dashboard',{
      user:req.session.user,
      //messages:dt,
      account:users
    });
    
   //res.json(dt);
  
});



//route to display priority two dashboard page
router.get('/dashboard2',isAuthenticated,async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);

  res.render('priorityTwo/dashboard', { 
    title: 'Express',
    account:users
   });
});

//route to get priority one dashboard page
router.get('/dashboard1',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);

  res.render('priorityOne/dashboard', { 
    title: 'Express' ,
    account:users
  });
});




//route to logout and terminate a user session
router.get('/logout', function(req, res, next) {
  req.session.destroy(()=>{
       res.redirect('/')
  });
  
});


module.exports = router;