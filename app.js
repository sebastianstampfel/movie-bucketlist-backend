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

/**
 * Shuffles an array using the Fisher-Yates-Shuffle.
 * Stolen from https://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array
 * 
 * @param array 
 */
function shuffle(array) {
	var currentIndex = array.length, temporaryValue, randomIndex;

	// While there remain elements to shuffle...
	while (0 !== currentIndex) {

		// Pick a remaining element...
		randomIndex = Math.floor(Math.random() * currentIndex);
		currentIndex -= 1;

		// And swap it with the current element.
		temporaryValue = array[currentIndex];
		array[currentIndex] = array[randomIndex];
		array[randomIndex] = temporaryValue;
	}

	return array;
}

/**
 * Generates a random number between 0 and max
 * Taken from https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
 * @param {int} max Max number in random range
 */
function getRandomInt(max) {
	return Math.floor(Math.random() * Math.floor(max));
}

/**
* Setup JSON parser for parsing json request bodies
*/
app.use(express.json());

/**
* Setup CORS
*/
app.use(function(req, res, next) {
	res.header("Access-Control-Allow-Origin", "*") // Allow requests from everywhere
	res.header("Access-Control-Allow-Methods", "GET, PUT")
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
	next()
})

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
 * Gets a random unwatched movie
 * Returns a single movie
 */
app.get('/random-movie',(req, res) => {
	connection.query('SELECT * from movies WHERE Watched="0"', function (err, rows, fields){
		if (err) throw err
		//res.json(rows.length)
		var arr = rows
		shuffle(arr)
		const movieNumber = getRandomInt(arr.length)
		res.json(arr[movieNumber])
	})
})

/**
 * Gets a specific movie.
 * Returns single movie.
 */
app.get('/movie/:movieId',(req, res) => {
	const id = req.params.movieId

	connection.query(`SELECT * from movies WHERE Ranking=?`,[id], function (err, rows, fields){
		if (err) throw err
		res.json(rows[0])
	})
})

/**
 * Gets a specific movie by RID.
 * Returns single movie.
 */
app.get('/movie/rid/:movieRID',(req, res) => {
	const id = req.params.movieRID

	connection.query(`SELECT * from movies WHERE RID=?`,[id], function (err, rows, fields){
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
 * PUT REQUESTS
 */

/**
 * Sets a movie to "watched".
 * Returns single movie.
 */
app.put('/set-watched', function (req, res) {
	const movieId = req.body["movieId"]
	// UPDATE `moviebucketlist`.`movies` SET `Watched` = '0' WHERE (`Ranking` = '1');
	connection.query('UPDATE `moviebucketlist`.`movies` SET `Watched` = "1" WHERE (`Ranking` = "?")', [movieId], function (err, rows, fields){
		if (err){
			res.json(err)
		}
		connection.query('SELECT * from movies WHERE Ranking="?"', [movieId], function (err, rows, fields){
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
	connection.query('UPDATE `moviebucketlist`.`movies` SET `Watched` = "0" WHERE (`Ranking` = "?")', [movieId], function (err, rows, fields){
		if (err){
			res.json(err)
		}
		connection.query('SELECT * from movies WHERE Ranking="?"', [movieId], function (err, rows, fields){
			if (err) throw err
			res.json(rows)
		})
	})
})

app.listen(port, "0.0.0.0", ()=> {
	connection.connect()
	console.log(`Backend server listening on port ${port}`)
})
