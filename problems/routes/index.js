var express = require('express');
var router = express.Router();

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


module.exports = router;
