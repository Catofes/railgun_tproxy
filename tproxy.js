var net = require('net')
var set = require('./build/Release/setsockopt');

var server = net.createServer(function (socket) {
		//set.setsockopt(socket._handle.fd)
		console.log(">> Request to " + socket.localAddress + ":" + socket.localPort);
		var dst = net.Socket();
		dst.connect(socket.localPort, socket.localAddress);
		dst.on('connect', function() {
			console.log(">> Connected to " + socket.localAddress + ":" + socket.localPort);
			dst.pipe(socket);
			socket.pipe(dst);
			dst.on('end', function() {
				socket.end();
				});
			socket.on('end', function() {
				dst.end();
				});
			socket.on('close', function() {
				dst.destroy();
				});
			socket.on('error', function() {
				dst.destroy();
				});
			});
		dst.on('timeout', function() {
				console.log("Connection Timeout");
				socket.destroy();
				});
		dst.on('close', function() {
				console.log("Connection Closed");
				socket.destroy();
				});
		dst.on('error', function() {
				console.log("Connection Error");
				socket.destroy()
				});
});

server.listen(4000, '0.0.0.0', function(){
		console.log(set.setsockopt(server._handle.fd));
		//console.log(server)
		});

//console.log("Tproxy Listen at 127.0.0.1 on port 4000");
