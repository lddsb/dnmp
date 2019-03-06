'use strict';

var http = require('http');
var handleRequest = function (request, response) {
  console.log('Received Request for URL: ' + request.url);
  response.writeHead(200);
  response.end('Welcome to Node world!');
};
var www = http.createServer(handleRequest);
www.listen(8080);