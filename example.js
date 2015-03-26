var http = require('http');
http.createServer(function (req, res)
{
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Welcome to the Pokemon Game\n');

  .get('localhost:3000/movement/index')
  .on('response', function(response) {
    console.log(response.statusCode) // 200
    console.log(response.headers['content-type'])


}
).listen(1337, '127.0.0.1');
console.log('Pokemon server running at  port 1337');
