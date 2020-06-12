var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});


//function to verify if the user is logged in
var isAuthenticated = (req,res,next)=>{
  if(!req.session.authenticated) res.redirect('/') 
  next()
}


//get completed page
router.get('/complaint', function(req, res, next) {
  res.send('respond with a resource');
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
