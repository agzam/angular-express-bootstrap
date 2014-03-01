var cache, express, fs, server;

require("express");

fs = require("fs");

express = require("express");

server = express();

cache = {};

cache['app.html'] = fs.readFileSync('bin/app.html');

server.use('/static', express["static"]('bin/'));

server.get('/', function(req, res) {
  res.setHeader('Content-Type', 'text/html');
  return res.send(cache['app.html']);
});

server.listen(3000);
