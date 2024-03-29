var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
var bodyPaser = require('body-parser');
var http=require("http");
var socketio=require("socket.io");


var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');


var app = express();


// Create the http server 
const server = require('http').createServer(app); 
  
// Create the Socket IO server on  
// the top of http server 
const io = socketio(server); 
  

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//setting up the session
app.use(session({
  secret:'secret',
  resave:true,
  saveUninitialized:true,
  cookie  : { maxAge  : 60 * 10000 * 30}
}));
app.use(bodyPaser.urlencoded({extended:true}));
app.use(bodyPaser.json());


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
  //res.render('404.ejs');
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('404.ejs');
});

module.exports = { app: app, server: server }; 
