const data = {
    "Breakfast": ["Avocado Toast", "Pancakes"],
    "Lunch": ["Ceasar Salad", "Grilled Cheese"],
    "Dinner": ["Spaghetti", "Salmon"],
};

function newServer() {
    let routes = {};

    function addRoute(path, handler) {
        routes[path] = handler;
    }

    function router(request) {
        const url = new URL(request.url);
        const handler = routes[url.pathname];
        return handler(request);
    }

    function start() {
        Deno.serve(router);
    }

    return { addRoute, start };
}

function homeHandler(request) {
    const navItems = ["/", "/recipes", "/api"];
    let body = "<nav><ul>";
    for (const item of navItems) {
        body += `<li><a href="${item}">${item}</a></li>`;
    }
    body += "</ul></nav>";
    const options = { headers: { "content-type": "text/html" } };
    return new Response(body, options);
}

function recipesHandler(request) {
    let body = "<ul>";
    for (const category in data) {
        const recipes = data[category];
        body += `<li><h2>${category}</h2>`;
        body += recipesList(recipes);
        body += "</li>";
    }
    body += "</ul>";
    const options = { headers: { "content-type": "text/html" } };
    return new Response(body, options);
}

function recipesList(recipes) {
    let list = "<ul>";
    for (const recipe of recipes) {
        list += `<li>${recipe}</li>`;
    }
    list += "</ul>";
    return list;
}

function apiHandler(request) {
    const body = JSON.stringify(data);
    const options = { headers: { "content-type": "application/json" } };
    return new Response(body, options);
}

const server = newServer();
server.addRoute("/", homeHandler);
server.addRoute("/recipes", recipesHandler);
server.addRoute("/api", apiHandler);
server.start();
