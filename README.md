# Movie bucketlist backend
A backend (kinda REST-based) express.js based service for use with Movie bucketlist frontend.
Connects to a MySQL Database filled with a list of movies and provides several endpoints for retrieving data from the databse.

Written by Sebastian Stampfel (sebastian.stampfel@gmail.com), December 2020

## Build
This is meant to run as a docker container, therefore the docker files in this repo.
Hence a simple
```
$ docker-compose run -d
```
should suffice.

A sample MySQL-Table can be found in `res/movies.sql`. Also, prior to running do not forget to
```
$ cp config-sample.js config.js
```
and edit the configuration to contain your database settings.

If you want to manually run this application, perform the following steps:
```
$ npm install
$ node app.js
```
## Endpoints
### /movies
Gets the full list of movies from the database.

### /random-movie
Gets a random (unwatched) movie from the database.

### /movie/id
Gets a specific movie from the database.

### /movie/rid/rid
Gets a movie by rid (random-id) from the database.

### /unwatched & /watched
Retrieves a list of all (un)watched movies from the db.

### /set-watched & /unset-watched
Toggles the watched state of a specific movie.

## About RID
This list is meant to be given out as small sheets of paper, each one with a movie on it.
One of those sheets is menat to be drawn and the movie drawn is then meant to be marked as watched in the application by its RID written on the paper
after the movie title. This makes the sheets of paper look nicer than just having a single-digit ID written onto it. 
