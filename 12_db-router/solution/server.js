import { DB } from "https://deno.land/x/sqlite/mod.ts";
import Router from "./router.js";

// Null -> Database
// Create a new movies database and return its handler.
function createDatabase() {
    const db = new DB("movies.sqlite");
    db.execute(
        "CREATE TABLE IF NOT EXISTS Movies (title TEXT PRIMARY KEY)",
    );
    return db;
}

// String, Database -> Null
// Add the given movie to the given database.
function addMovie(movieTitle, db) {
    db.queryEntries(
        "INSERT INTO Movies (title) VALUES (?)",
        [movieTitle],
    );
}

// String, Database -> Null
// Delete the given movie to the given database.
function deleteMovie(movieTitle, db) {
    db.queryEntries(
        "DELETE FROM Movies WHERE title = ?",
        [movieTitle],
    );
}

// Database -> String
// Return a list of all movies in the given database.
function showMovies(db) {
    const movies = db.queryEntries(
        "SELECT * FROM Movies",
    );
    let list = "";
    for (const movie of movies) list += movie.title + "\n";
    return list;
}

// Database -> Function
// Return the handler function for the home endpoint.
function homeHandler(db) {
    return function (req, data) {
        const body = showMovies(db);
        return new Response(body); 
    }
}

// Database -> Function
// Return the handler function for the add endpoint.
function addHandler(db) {
    return function (req, data) {
        const movie = data.title;
        addMovie(movie, db);
        return new Response("Movie added!");
    }
}

// Database -> Function
// Return the handler function for the remove endpoint.
function removeHandler(db) {
    return function (req, data) {
        const movie = data.title;
        deleteMovie(movie, db);
        return new Response("Movie deleted!");
    }
}

// Null -> Null  
// Start the server.
function main() {
    const router = new Router();
    const db = createDatabase();

    router.addRoute("/", homeHandler(db));
    router.addRoute("/add", addHandler(db));
    router.addRoute("/remove", removeHandler(db));

    router.start();
}

main();
