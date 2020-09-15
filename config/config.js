const util = require('util')
const mysql = require('mysql')
const pool = mysql.createPool({
  //connectionLimit: 10,
  host     : '127.0.0.1',
	user     : 'root',
	password : '@exiled21',
	database : 'mssa'
})
// var connection = mysql.createConnection({s
// 	host     : 'localhost',
// 	user     : 'root',
// 	password : '@Exiled21',
// 	database : 'nodelogin'
// });


//Ping database to check for common exception errors.
pool.getConnection((err, connection) => {
  if (err) {
    if (err.code === 'PROTOCOL_CONNECTION_LOST') {
      console.error('Database connection was closed.')
    }
    if (err.code === 'ER_CON_COUNT_ERROR') {
      console.error('Database has too many connections.')
    }
    if (err.code === 'ECONNREFUSED') {
      console.error('Database connection was refused.')
    }
  }
console.log("Connected");
  if (connection) connection.release()

  return
})


//Promisify for Node.js async/await.
pool.query = util.promisify(pool.query)

// connection.connect(function(err){
//     if(!err) {
//         console.log("Database is connected ... nn");
//     } else {
//         console.log("Error connecting database ... nn");
//     }
//     });
module.exports = pool;