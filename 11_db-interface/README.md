# Database interface

In teams of two, design a CLI application that allows a user to add and
delete movies they want to watch using the terminal. If a user enters
`add` followed by the title of a movie, the title should be added to the
database. If a user enters `delete` followed by the title of a movie,
the movie should be deleted from the database. If a user only enters
`all`, the application should display a list of the movies currently in
the database.

Make sure that functions which parse the user's input are separate from
fonctions that handle database queries, and don't forget to test the
latter using `assert` statements. Remember that you can use the built-in
`prompt` fonction to get a user's input.
