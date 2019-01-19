var server = require('http').Server();

var io = require('socket.io')(server);

var Redis = require('ioredis');
var redis = new Redis(6379, 'redis');

redis.subscribe('*', function () {
    console.log('Subscription successful');
});

redis.on('message', function(channel, message) {
    console.log(channel, message);
    io.emit(channel, message);
});

server.listen(3000);
