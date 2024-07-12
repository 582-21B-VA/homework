# Homework 12

This homework assignment builds on the previous one. The application you
designed last class allowed a user to add, remove and list movies to
watch using a command-line interface. This week, you must modify the
application so that users can use it by sending HTTP requests to a REST
server. Each feature should have its own endpoint: `/` to see all the
movies, `/add` to add a new movie, and `/delete` to remove a movie from
the database. Use the following curl commands to test your server.

```sh
curl localhost:8000/
curl localhost:8000/add -d "title=Tampopo"
curl localhost:8000/delete -d "title=Tampopo"
```

A router is provided; you do not have to build it yourself. You can
import the router in your server, granted you copy the hereby included
`router.js` file in the same directory as your source file.

```js
import Router from "./router.js";

const router = new Router();
```

A `Router` object has two methods. The `addRoute` method takes a path as
its first argument, and a handler function as its second. The `start`
method starts the server, and listens for incoming requests at the
address `localhost:8000`.

Handler functions may have two parameters, and must return a `Response`
object. The first parameter represents the request currently being
handled. The second one represents POST data, if any. The data is an
object whose keys correspond to the names of form controls (for
instance, `title`). 

```js
function exampleHandler(request, data) {
    const movie = data.title;
    return new Response("...");
}
```
