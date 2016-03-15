var koa = require('koa');
var serve = require('koa-static');
var app = koa();

// static file serve
app.use(serve(__dirname + '/src'));

app.listen(process.env.PORT || 4000);
console.log('running on http://localhost:' + (process.env.PORT || 4000) + '/')
