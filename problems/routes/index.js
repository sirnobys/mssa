var express = require('express');
var router = express.Router();

//calling database file to connect to database
var db = require('../config/config');

//function to verify if the user is logged in
var isAuthenticated = (req,res,next)=>{
  if(!req.session.authenticated) res.redirect('/admin') 
  next()
}

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('complaint', { title: 'Express' });
});

router.get('/admin', function(req, res, next) {
  res.render('login', { title: 'Express' });
});

router.get('/staff_success', function(req, res, next) {
  res.render('priorityTwo/staff_success', { title: 'Express' });
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
     res.redirect('/admin');
  }
  });

    //route to display dashboard priority three page
router.get('/dashboard3',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.name;
   // var dt = await db.query("select * from messages order by id desc");
    var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
    //count queries for the ticker
    var total_count = await db.query("SELECT COUNT(*) as total FROM problems");
    var issues_count =  await db.query("SELECT COUNT(*) as issues FROM problems where completed IS NULL AND assigned_to IS NULL");
    var complete = 1;
  var completed = await db.query("SELECT COUNT(*) as complete FROM problems where completed =?",complete);
  var assigned = await db.query("SELECT COUNT(*) as assigned FROM problems where assigned_to IS NOT NULL ");
    var problems = await db.query("SELECT * FROM problems");
    res.render('priorityThree/dashboard',{
      user:req.session.user,
      //messages:dt,
      account:users,
      problem:problems,
      total:total_count,
      issues:issues_count,
      complete:completed,
      assign:assigned
    });
    
   //res.json(dt);
  
});



//route to display priority two dashboard page
router.get('/dashboard2',isAuthenticated,async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //count queries for the ticker
  var total_count = await db.query("SELECT COUNT(*) as total FROM problems");
  var issues_count =  await db.query("SELECT COUNT(*) as issues FROM problems where completed IS NULL AND assigned_to IS NULL");
  var complete = 1;
var completed = await db.query("SELECT COUNT(*) as complete FROM problems where completed =?",complete);
var assigned = await db.query("SELECT COUNT(*) as assigned FROM problems where assigned_to IS NOT NULL ");
  var problems = await db.query("SELECT * FROM problems where assigned_to IS NOT NULL");
  res.render('priorityTwo/dashboard', { 
    title: 'Express',
    account:users,
    problem:problems,
    total:total_count,
    issues:issues_count,
    complete:completed,
      assign:assigned
   });
});

//route to get priority one dashboard page
router.get('/dashboard1',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  var problems = await db.query("SELECT * FROM problems where assigned_to IS NOT NULL");
  res.render('priorityOne/dashboard', { 
    title: 'Express' ,
    account:users,
    problem:problems
  });
});


//get assigned1 page
router.get('/assigned1',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //var completed = 1;
  var problems = await db.query("SELECT * FROM problems where assigned_to=?",username)
  res.render('priorityOne/assigned', { 
    title: 'Express',
  account:users ,
problem:problems});
});

//get completed1 page
router.get('/completed1',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  var completed = 1;
  var data=[completed,username];
  var problems = await db.query("SELECT * FROM problems where completed =? AND assigned_to =?",data);
  res.render('priorityOne/completed', {
     title: 'Express' ,
    account:users,
    problem:problems
  });
});

//get issues3 page
router.get('/issues1',isAuthenticated,async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  var completed = 1;
  var data=[username,completed]
  var problems = await db.query("SELECT * FROM problems where assigned_to=? and completed =?",data)
  res.render('priorityOne/issues', { 
    title: 'Express',
  account:users ,
  problem:problems
});
});


//get assigned2 page
router.get('/assigned2',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //var completed = 1;
  var problems = await db.query("SELECT * FROM problems where assigned_to IS NOT NULL")
  res.render('priorityTwo/assigned', {
     title: 'Express',
    account:users,
  problem:problems });
});

//get completed2 page
router.get('/completed2',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  var completed = 1;
  var problems = await db.query("SELECT * FROM problems where completed =?",completed)
  res.render('priorityTwo/completed', { 
    title: 'Express',
  account:users ,
  problem:problems});
});

//get issues2 page
router.get('/issues2',isAuthenticated,async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  var staff = await db.query("SELECT * FROM staff ");
  //var completed = 1;
  var problems = await db.query("SELECT * FROM problems where completed IS NULL AND assigned_to IS NULL")
  res.render('priorityTwo/issues', { 
    title: 'Express',
  account:users ,
  problem:problems,
  staff:staff
});
});





//get assigned3 page
router.get('/assigned3',isAuthenticated, async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username); 
  var problems = await db.query("SELECT * FROM problems where assigned_to IS NOT NULL ");
  res.render('priorityThree/assigned', { 
    title: 'Express',
  account:users ,
  problem:problems
});
});

//get completed3 page
router.get('/completed3',isAuthenticated,async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  var completed = 1;
  var problems = await db.query("SELECT * FROM problems where completed =?",completed);
  res.render('priorityThree/completed', { 
    title: 'Express',
  account:users ,
  problem:problems
});
});

//get issues3 page
router.get('/issues3',isAuthenticated,async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //var completed = 1;
  var problems = await db.query("SELECT * FROM problems where completed IS NULL AND assigned_to IS NULL")
  res.render('priorityThree/issues', { 
    title: 'Express',
  account:users ,
  problem:problems
});
});



//get completed page
router.post('/insert', function(req, res, next) {
  var name=req.body.name;
  var staff_student_id = req.body.staff_student_id;
  var phone = req.body.phone;
  var email = req.body.email;
  var issue = req.body.problem;
  var data= [name,staff_student_id,email,phone,issue];
  let sql = db.query("INSERT INTO problems (name,staff_student_id,email,phone,issue) VALUES(?,?,?,?,?)",data)
  res.redirect('/success');
});

//get add_staff page
router.get('/add_staff',isAuthenticated,async function(req, res, next) {
  var username = req.session.user.name;
  
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //var staff = await db.query("SELECT * FROM staff ");
  //var completed = 1;
  //var problems = await db.query("SELECT * FROM problems where completed IS NULL AND assigned_to IS NULL")
  res.render('priorityTwo/add_staff', { 
    title: 'Express',
  account:users ,
 // problem:problems,
  //staff:staff
});
});

//get add_staff page
router.post('/insert_staff',isAuthenticated,async function(req, res, next) {
  var username = req.session.user.name;
  var name=req.body.name;
  //var staff_student_id = req.body.staff_student_id;
  var phone = req.body.phone;
  var email = req.body.email;
  var priority = req.body.priority
  var data= [name,email,phone,priority];
  let sql = db.query("INSERT INTO staff (name,email,phone,password,priority) VALUES(?,?,?,?,?)",data)
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //var staff = await db.query("SELECT * FROM staff ");
  //var completed = 1;
  //var problems = await db.query("SELECT * FROM problems where completed IS NULL AND assigned_to IS NULL")
  res.redirect('/staff_success');
});




router.get('/success',isAuthenticated, function(req, res, next) {
  res.render('success', { title: 'Express' });
});


//route to logout and terminate a user session
router.get('/logout', function(req, res, next) {
  req.session.destroy(()=>{
       res.redirect('/admin')
  });
  
});


module.exports = router;