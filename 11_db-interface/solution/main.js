import { DB } from "https://deno.land/x/sqlite/mod.ts";
import { assertEquals } from "https://deno.land/std@0.224.0/assert/mod.ts";

function parseAction(input) {
    const words = input.split(" ");
    const action = words[0];
    return action;
}

Deno.test("parse action add", function () {
    const got = parseAction("add Spider Man");
    const want = "add";
    assertEquals(got, want);
});

Deno.test("parse action delete", function () {
    const got = parseAction("delete Ohiyo");
    const want = "delete";
    assertEquals(got, want);
});

Deno.test("parse action all", function () {
    const got = parseAction("all");
    const want = "all";
    assertEquals(got, want);
});

function parseMovie(input) {
    const spacePos = input.indexOf(" ");
    const title = input.substring(spacePos + 1, input.length);
    return title;
}

Deno.test("parse title no spaces", function () {
    const got = parseMovie("add Ohiyo");
    const want = "Ohiyo";
    assertEquals(got, want);
});

Deno.test("parse title with spaces", function () {
    const got = parseMovie("add Spider Man");
    const want = "Spider Man";
    assertEquals(got, want);
});

function createDatabase() {
    const db = new DB("movies.sqlite");
    db.execute(
        "CREATE TABLE IF NOT EXISTS Movies (title TEXT PRIMARY KEY)",
    );
    return db;
}

function addMovie(movieTitle, db) {
    db.queryEntries(
        "INSERT INTO Movies (title) VALUES (?)",
        [movieTitle],
    );
}

function deleteMovie(movieTitle, db) {
    db.queryEntries(
        "DELETE FROM Movies WHERE title = ?",
        [movieTitle],
    );
}

function showMovies(db) {
    const movies = db.queryEntries(
        "SELECT * FROM Movies",
    );
    let list = "";
    for (const movie of movies) list += movie.title + "\n";
    return list;
}

function main() {
    const input = prompt();
    const action = parseAction(input);
    const movie = parseMovie(input);
    const db = createDatabase();
    let output = "";
    
    if (action === "add") addMovie(movie, db);
    if (action === "delete") deleteMovie(movie, db);
    if (action === "all") output = showMovies(db);

    console.log(output);
}

main();
