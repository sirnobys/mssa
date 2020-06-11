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
     res.redirect('dashboard');
  }else{
     res.locals.msg = "wrong credentials";
     res.redirect('login');
  }
  });

    //route to display dashboard page
router.get('/dashboard',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.username;
  //  var dt = await db.query("select * from messages order by id desc");
  //  var users = await db.query("SELECT * FROM loginform WHERE username = ? limit 1",username);
   
    res.render('dashboard',{
      //user:req.session.user,
      //messages:dt,
      //account:users
    });
    
   //res.json(dt);
  
});

//route to update database at status
router.get('/status/:id',isAuthenticated, async function(req,res,next){
  var id = req.params.id;
  var status = req.query.status;

  if(status == '0'){
    var complete = await db.query("UPDATE messages SET status ='Complete' where id = ?",id); 
  }else{
    var pending = await db.query("UPDATE messages SET status ='Pending' where id = ?",id); 
  }
  res.redirect('/dashboard');
})



    //route to display pending page
    router.get('/pending',isAuthenticated, async function(req, res, next) {
      var username = req.session.user.username;
      var dt = await db.query("select * from messages where status is Null order by id desc");
      //query to print user information
      var users = await db.query("SELECT * FROM loginform WHERE username = ? limit 1",username);
       res.render('pending',{
         user:req.session.user,
         messages:dt,
         account:users
       });
       
      //res.json(dt);
     
   });
   
   //route to display complete page
   router.get('/complete',isAuthenticated, async function(req, res, next) {
    var username = req.session.user.username;
    var dt = await db.query("select * from messages where status is not Null order by id desc");
    //query to display user details
    var users = await db.query("SELECT * FROM loginform WHERE username = ? limit 1",username);
     res.render('complete',{
       user:req.session.user,
       messages:dt,
       account:users
     });
     
    //res.json(dt);
   
 });
 
   


//route to logout and terminate a user session
router.get('/logout', function(req, res, next) {
  req.session.destroy(()=>{
       res.redirect('/')
  });
  
});


module.exports = router;