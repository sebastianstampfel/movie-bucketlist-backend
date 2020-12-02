const config = require('./config')
const express = require('express')
const app = express()
const port = config.SERVER_PORT
// MySQL Stuff
/**
* ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '##SETPASSWORDHERE##'
* flush privileges; 
*/
var mysql = require('mysql')
var connection = mysql.createConnection({
	host: config.MYSQL_HOST,
	user: config.MYSQL_USER,
	password: config.MYSQL_PASS,
	database: config.MYSQL_DATABASE
})

app.use(express.json());

/**
 * Gets a list of all movies.
 * Returned as an array.
 */
app.get('/movies',(req, res) => {
	connection.query('SELECT * from movies', function (err, rows, fields){
		if (err) throw err
		res.json(rows)
	})
})

/**
 * Gets a specific movie.
 * Returns single movie.
 */
app.get('/movie/:movieId',(req, res) => {
	const id = req.params.movieId

	connection.query(`SELECT * from movies WHERE Ranking=${id}`, function (err, rows, fields){
		if (err) throw err
		res.json(rows[0])
	})
})

/**
 * Gets a list of all unwatched movies.
 * Returns an array.
 */
app.get('/unwatched',(req, res) => {
	connection.query('SELECT * from movies WHERE watched="0"', function (err, rows, fields){
		if (err) throw err
		res.json(rows)
	})
})

/**
 * Gets a list of all watched movies.
 * Returns an array.
 */
app.get('/watched',(req, res) => {
	connection.query('SELECT * from movies WHERE watched="1"', function (err, rows, fields){
		if (err) throw err
		res.json(rows)
	})
})

/**
 * Sets a movie to "watched".
 * Returns single movie.
 */
app.put('/set-watched', function (req, res) {
	const movieId = req.body["movieId"]
	// UPDATE `moviebucketlist`.`movies` SET `Watched` = '0' WHERE (`Ranking` = '1');
	connection.query('UPDATE `moviebucketlist`.`movies` SET `Watched` = "1" WHERE (`Ranking` = "' + movieId + '")', function (err, rows, fields){
		if (err){
			res.json(err)
		}
		connection.query('SELECT * from movies WHERE Ranking="' + movieId + '"', function (err, rows, fields){
			if (err) throw err
			res.json(rows)
		})
	})
})

/**
 * Sets a movie to "unwatched".
 * Returns single movie.
 */
app.put('/unset-watched', function (req, res) {
	const movieId = req.body["movieId"]
	// UPDATE `moviebucketlist`.`movies` SET `Watched` = '0' WHERE (`Ranking` = '1');
	connection.query('UPDATE `moviebucketlist`.`movies` SET `Watched` = "0" WHERE (`Ranking` = "' + movieId + '")', function (err, rows, fields){
		if (err){
			res.json(err)
		}
		connection.query('SELECT * from movies WHERE Ranking="' + movieId + '"', function (err, rows, fields){
			if (err) throw err
			res.json(rows)
		})
	})
})

app.listen(port, ()=> {
	connection.connect()
	console.log(`Backend server listening on port ${port}`)
})