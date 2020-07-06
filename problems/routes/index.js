var express = require('express');
var router = express.Router();
var md5 = require('mysql');

//calling database file to connect to database
var db = require('../config/config');

//function to verify if the user is logged in
var isAuthenticated = (req,res,next)=>{
  if(!req.session.authenticated) res.redirect('/admin') 
  next()
}

//function to restrict users to only priority 2 files
var admin = (args) => {
  return (req,res,next) => {
    var whitelist = args;
    if (whitelist.includes(req.session.user.priority)) return next();
        return res.redirect('/dashboard1');
    }
}


//route to render the user complaint page
router.get('/',async function(req, res, next) {
  //var cat = issue_category;
  //query to select category data for all users
  var category =await db.query("SELECT * FROM issue_category");
  res.render('complaint', { title: 'Express' ,
 cats:category
});
});

//route to render to staff portal page
router.get('/admin', function(req, res, next) {
  res.render('login', { title: 'Express' });
});

//just your every day success page
router.get('/staff_success',isAuthenticated,async function(req, res, next) {
  var username = req.session.user.name;
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  res.render('priorityTwo/staff_success', {
   title: 'Express',
   account:users
    });
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
     var auth = req.session.authenticated = true;
     if (auth){
      res.redirect('/dashboard');
     }
     else{
      res.redirect('back');
     }
     
  }else{
     res.locals.msg = "wrong credentials";
     res.redirect('/admin');
  }
  });

    //route to display dashboard pages based on user priority
router.get('/dashboard',isAuthenticated, async function(req, res, next) {
  // variable to store logged in users name
  var username = req.session.user.name;
  // variable to store logged in users priority
  var priority = req.session.user.priority;
   // variable to store staff details and print it onto page
    var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
    //count queries for the ticker
    //total count for priority two and three
    var total_count = await db.query("SELECT COUNT(*) as total FROM problems");
    //total count for priority one
    var total_count1 = await db.query("SELECT COUNT(*) as total FROM problems WHERE assigned_to=?",username);
    // counting the total number of new issues
    var issues_count =  await db.query("SELECT COUNT(*) as issues FROM problems where completed=0 AND assigned_to IS NULL");
    // counting the total number of new issues assigned to particular user
    var issues_count1 =  await db.query("SELECT COUNT(*) as issues FROM problems where completed=0 AND acknowledged is null AND assigned_to=?",username);
    var complete = 1;
  var data=[complete,username];
  //counting total number of completed cases
  var completed = await db.query("SELECT COUNT(*) as completed FROM problems where completed =?",complete);
  //counting total number of completed cases assigned to user
  var completed1 = await db.query("SELECT COUNT(*) as completed FROM problems where completed =? and assigned_to=?",data);
  //counting total number of assigned cases
  var assigned = await db.query("SELECT COUNT(*) as assigned FROM problems where assigned_to IS NOT NULL and completed=0");
  //counting total number of assigned cases to user
  var assigned1 = await db.query("SELECT COUNT(*) as assigned FROM problems where assigned_to=? and acknowledged=1 and completed=0",username);
  //query to print all problems to the page
  var problems = await db.query("SELECT * FROM problems");
  //query to print all problems assigned to a user to the page
  var problems1 = await db.query("SELECT * FROM problems WHERE assigned_to=?",username);
  //if user belongs to priority one do this
    if (priority == 1){
      res.render('priorityOne/dashboard',{
        user:req.session.user,
        //messages:dt,
        account:users,
        problem:problems1,
        total:total_count1,
        issues:issues_count1,
        complete:completed1,
        assign:assigned1
      });
    }
    //if user belongs to priority two do this
    else if (priority == 2){
      res.render('priorityTwo/dashboard',{
        user:req.session.user,
        //messages:dt,
        account:users,
        problem:problems,
        total:total_count,
        issues:issues_count,
        complete:completed,
        assign:assigned
      });
    }
    //if user belongs to priority three do this
    else if (priority == 3){
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
    }
    
    
   //res.json(dt);
  
});

//route to display the assigned page based on user priority
router.get('/assigned',isAuthenticated, async function(req, res, next) {
  //name of logged user stored here
  var username = req.session.user.name;
  //priority of logged user stored here
  var priority = req.session.user.priority;
  //variable to get logged in users details
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
//getting the problems assigned to logged in user
  var problems1 = await db.query("SELECT * FROM problems where assigned_to=? and acknowledged=1 and completed=0",username);
  //getting the problems where a staff hass been asigned
  var problems2 = await db.query("SELECT * FROM problems where assigned_to IS NOT NULL and completed=0 ORDER BY estimated_datetime desc");
  //getting all the  assigned problems
  var problems3 = await db.query("SELECT * FROM problems where assigned_to IS NOT NULL ");

   //if user belongs to priority one do this
 if (priority == 1){
  res.render('priorityOne/assigned', { 
    title: 'Express',
  account:users ,
  problem:problems1});
 }

  //if user belongs to priority two do this
 else if(priority ==2){
  res.render('priorityTwo/assigned', {
    title: 'Express',
   account:users,
 problem:problems2 });
 }

  //if user belongs to priority three do this
 else if(priority==3){
  res.render('priorityThree/assigned', { 
    title: 'Express',
  account:users ,
  problem:problems3
});
 }
  
});

//get completed1 page
router.get('/completed',isAuthenticated, async function(req, res, next) {
  //name of logged user stored here
  var username = req.session.user.name;
  //priority of logged user stored here
  var priority = req.session.user.priority;
  //getting logged in users details
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  var completed = 1;
  var data=[completed,username];
  // get all the problems that have been assigned to loggged in user and have been completed
  var problems1 = await db.query("SELECT * FROM problems where completed =? AND assigned_to =?",data);
  //get all problems that have been completed from database
  var problems2 = await db.query("SELECT * FROM problems where completed =?",completed);

   //if user belongs to priority one do this
  if(priority==1){
    res.render('priorityOne/completed', {
      title: 'Express' ,
     account:users,
     problem:problems1
   });
  }

   //if user belongs to priority two do this
  else if(priority==2){
    res.render('priorityTwo/completed', { 
      title: 'Express',
    account:users ,
    problem:problems2});
  }

   //if user belongs to priority three do this
  else if(priority==3){
  res.render('priorityThree/completed', { 
    title: 'Express',
  account:users ,
  problem:problems2
});
  }
  
});

//get issues page based on users priority
router.get('/issues',isAuthenticated,async function(req, res, next) {
  //name of logged user stored here
  var username = req.session.user.name;
    //priority of logged user stored here
  var priority = req.session.user.priority;
   //getting logged in users details
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //var completed = 1;
  var data=[username];
  var staff = await db.query("SELECT * FROM staff WHERE priority=1");
  var problems1 = await db.query("SELECT * FROM problems where assigned_to=? and acknowledged is null",data);
  var problems2 = await db.query("SELECT * FROM problems where completed =0 AND assigned_to IS NULL");

  if (priority==1){
    res.render('priorityOne/issues', { 
      title: 'Express',
    account:users ,
    problem:problems1
  });
  }
  else if(priority==2){
   
  res.render('priorityTwo/issues', { 
    title: 'Express',
  account:users ,
  problem:problems2,
  staff:staff
});
  }
  else if(priority==3){
    res.render('priorityThree/issues', { 
      title: 'Express',
    account:users ,
    problem:problems2
  });
  }
  
});




//route to insert data into problems table
router.post('/insert', function(req, res, next) {
  // getting information from form body 
  var name=req.body.name;
  var staff_student_id = req.body.staff_student_id;
  var phone = req.body.phone;
  var email = req.body.email;
  var issue = req.body.problem;
  var category = req.body.category;
  var data= [name,staff_student_id,email,phone,issue,category];
  
  //query to insert data into problems table
   db.query("INSERT INTO problems (name,staff_student_id,email,phone,issue,issue_category) VALUES(?,?,?,?,?,?)",data,function(err,rs){
    //if error exists show in console and redirect user back to complaint page
    if (err){
      console.log(err);
      res.redirect('/');
    }
    //else show success page
    else{
      res.redirect('/success',);
    }
   
   })
  
});

//get add_staff page
router.get('/add_staff',isAuthenticated,async function(req, res, next) {
  //name of logged user stored here
  var username = req.session.user.name;
   //getting logged in users details
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);

  //show add satff page
  res.render('priorityTwo/add_staff', { 
    title: 'Add Staff',
  account:users ,
});
});

//get add_staff page
router.post('/insert_staff',isAuthenticated,async function(req, res, next) {
  //name of logged user stored here
  var username = req.session.user.name;

  //storing data from form body into variables
  var name=req.body.name;
  var phone = req.body.phone;
  var email = req.body.email;
  var priority = req.body.priority;
  var password = req.body.password;
  var data= [name,email,phone,priority,password];

  //get logged in users details
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);

  // store new staff details into database
  db.query("INSERT INTO staff (name,email,phone ,priority,password) VALUES(?,?,?,?,?)",data,function(err,rs){
    //if error show error in console and redirect page to same page
    if (err){
      console.log(err);
      res.redirect('/add_staff');
    }
    //if successful redirect to success
    else{
      res.redirect('/staff_success');
    }
   
   });
  });

  

router.get('/delete/:id',isAuthenticated, async function(req,res,next){
  var id = req.params.id;
  //var status = req.query.status;

    var del = await db.query("DELETE FROM problems where id = ?",id); 
    res.redirect('/completed');
});

// router.get('/form',isAuthenticated, function(req, res, next) {
//   res.render('priorityTwo/form', { title: 'Express' });
// });

router.get('/edit_issues',isAuthenticated,async function(req,res,next){
  var id = req.query.id;
  //var name = req.params.name;
  var assign=req.body.assigned;
 //name of logged user stored here
  var username = req.session.user.name;
   //getting logged in users details
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //var status = req.query.status;
  //name);
   var sql= await db.query("SELECT * FROM staff");
   var rs = await db.query("SELECT * from problems where id = ?",id);
   res.render('priorityTwo/form',{
        details:rs[0],
        staff: sql.length > 0 ? sql : null,
        account:users
   });
    
});

router.get('/edit_request',isAuthenticated,async function(req,res,next){
  var id = req.query.id;
  //var name = req.params.name;
  var assign=req.body.assigned;
  //var data =[assign,id];
//name of logged user stored here
  var username = req.session.user.name;
  var data = [id,username];
   //getting logged in users details
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //var status = req.query.status;
  //name);
    var sql= await db.query("SELECT * FROM staff");
   var rs = await db.query("SELECT * from mis_requests where id = ? and sent_by = ?",data);
   res.render('edit_request',{
        details:rs[0],
        staff: sql.length > 0 ? sql : null,
        account:users
   });
    
});

router.post('/edit_request',isAuthenticated,async function(req,res,next){
  var message = req.body.message;
  //name of logged user stored here
  var username = req.session.user.name;
  var id = req.body.id;
  data = [message,id,username];
  db.query('UPDATE mis_requests SET message = ?, time = CURRENT_TIME() , date= CURRENT_DATE() where id = ? and sent_by = ?',data,function(err,rs){
    if(err){
      console.log(err);
    }
    res.redirect('/sent_request_table')
  });
});

// view issues sent
router.get('/view_issues',isAuthenticated,async function(req,res,next){
  var id = req.query.id;
  var name = req.params.name;
  var assign=req.body.assigned;
  var data =[assign,id];
  //name of logged user stored here
  var username = req.session.user.name;
   //getting logged in users details
  var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
  //var status = req.query.status;
  console.log(name);
  var sql= ("SELECT * FROM staff");

    db.query("SELECT * from problems where id = ?",id,function(err,rs){
      res.render('priorityTwo/view',{
        details:rs[0],
        staff:sql[0],
        account:users
      });
    }); 
    
});

// 
router.post('/edit_issues',isAuthenticated, function(req,res,next){
  //query to insert form values 
  var assigned_to = req.body.assigned_to;
  var id = req.body.id;
  var note = req.body.note;
  data = [assigned_to, note, id];
  db.query('UPDATE problems SET assigned_to = ?, note=? where id = ?',data,function(err,rs){
    if(err){
      console.log(err);
    }
    res.redirect('/issues')
  });
});

router.get('/complete/:id',isAuthenticated, async function(req,res,next){
  var id = req.params.id;
  //var status = req.query.status;

    var assign = await db.query("UPDATE problems SET completed = 1 where id = ?",id); 
    res.redirect('/completed');
});

// Acknowledgment
router.get('/acknowledge/:id',isAuthenticated, async function(req,res,next){
  var id = req.params.id;
  //var status = req.query.status;

    var assign = await db.query("UPDATE problems SET acknowledged = 1 where id = ?",id); 
    res.redirect('/assigned');
});



router.get('/success',isAuthenticated, function(req, res, next) {
  res.render('success', { title: 'Express' });
});





router.get('/request2',isAuthenticated,async function(req, res, next) {
  //name of logged user stored here 
  var username = req.session.user.name;
   //getting logged in users details
   var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
   var sql= await db.query("SELECT * FROM staff");
   //query to select staff from table
  res.render('send_request', {
   title: 'Express' ,
   account:users,
   staff:sql.length > 0 ? sql : null,});
});


router.post('/insert_message',isAuthenticated,async function(req, res, next) {
  //name of logged user stored here 
  var username = req.session.user.name;
   var staff = req.body.staff;
   var message = req.body.message;
   // var time =curdate(),curtime();
   var data= [staff, username, message];
    //getting logged in users details
   var users = await db.query("Insert into mis_requests (sent_to, sent_by, message,time,date) VALUES (?,?,?,curtime(),curdate())  ",data);
   //var sql= await db.query("SELECT * FROM staff");
   //query to select staff from table
  res.render('success', {
   title: 'Express' ,
   account:users,
   //staff:sql.length > 0 ? sql : null,
  });
});

router.post('/insert_estimated',isAuthenticated,async function(req, res, next) {
   var id = req.body.id;
   // var time = req.body.time;
   var datetime = req.body.time;
   // var time =curdate(),curtime();
   var data= [datetime, id];
   db.query("update problems set estimated_datetime=? , acknowledged = 1 WHERE id=?  ",data,function(err,rs){
    if(err){
      console.log("Nipa ay3 beans"+err);
    }
    else{
      res.redirect('back');
    }
   });
   //var sql= await db.query("SELECT * FROM staff");
   //query to select staff from table
  
});


router.get('/view_request2',isAuthenticated,async function(req, res, next) {
  //name of logged user stored here 
  var username = req.session.user.name;
   //getting logged in users details
   var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
   var sql= await db.query("SELECT * FROM mis_requests where delete_status = 0 and sent_to = ? ORDER BY ID DESC LIMIT 10",username);
   var seen= await db.query("SELECT * FROM mis_requests where seen_status = 1 and sent_by =? ORDER BY ID DESC LIMIT 10",username);
   //query to select staff from table
  res.render('view_request', {
   title: 'Express' ,
   account:users,
   view:sql.length > 0 ? sql : null,
   see:seen
  });
});

router.get('/view_request_table',isAuthenticated,async function(req, res, next) {
  //name of logged user stored here 
  var username = req.session.user.name;
   //getting logged in users details
   var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
   var sql= await db.query("SELECT * FROM mis_requests where delete_status = 0 and sent_to = ? ORDER BY ID DESC LIMIT 10",username);
   var seen= await db.query("SELECT * FROM mis_requests where seen_status = 1 and sent_by =? ORDER BY ID DESC LIMIT 10",username);
   //query to select staff from table
  res.render('view_request_table', {
   title: 'Express',
   account:users,
   view:sql,
   see:seen
  });
});

router.get('/sent_request_table',isAuthenticated,async function(req, res, next) {
  //name of logged user stored here 
  var username = req.session.user.name;
   //getting logged in users details
   var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
   var sql= await db.query("SELECT * FROM mis_requests where delete_status = 0 and sent_by = ? ORDER BY date DESC LIMIT 10",username);
   var seen= await db.query("SELECT * FROM mis_requests where seen_status = 1 and sent_by =? ORDER BY date and time DESC LIMIT 10",username);
   //query to select staff from table
  res.render('sent_request_table', {
   title: 'Express',
   account:users,
   view:sql,
   see:seen
  });
});


router.get('/reset_password',isAuthenticated,async function(req, res, next) {
  //name of logged user stored here 
  var username = req.session.user.name;
   //getting logged in users details
   var users = await db.query("SELECT * FROM staff WHERE name = ? limit 1",username);
   var sql= await db.query("SELECT * FROM mis_requests where delete_status = 0 and sent_to = ? ORDER BY ID DESC LIMIT 10",username);
   var seen= await db.query("SELECT * FROM mis_requests where seen_status = 1 and sent_by =? ORDER BY ID DESC LIMIT 10",username);
   //query to select staff from table
  res.render('reset', {
   title: 'Express' ,
   account:users,
   view:sql.length > 0 ? sql : null,
   see:seen
  });
});

router.get('/forgot_password',async function(req, res, next) {
  //var cat = issue_category;
  var category =await db.query("SELECT * FROM issue_category");
  res.render('forgot', { title: 'Express' ,
 cats:category
});
});



//route to  change message status
router.get('/status/:id',isAuthenticated, async function(req,res,next){
  var id = req.params.id;
  var status = req.query.status;

  if(status == '0'){
    var seen = await db.query("UPDATE mis_requests SET seen_status = 1 where id = ?",id); 
  }else if(status=='1'){
    var del = await db.query("UPDATE mis_requests SET delete_status ='1' where id = ?",id); 
  }
  res.redirect('back');
})

//route to logout and terminate a user session
router.get('/logout', function(req, res, next) {
  // i think this explains itself
  req.session.destroy(()=>{
       res.redirect('/admin')
  });
  
});


module.exports = router;