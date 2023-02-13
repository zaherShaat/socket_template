const express = require('express');
const app = express();
const socketIO = require('socket.io');
const http = require('http')
const server = http.createServer(app);
const io = socketIO(server);
////
const port = process.env.PORT || 8200
////////////
app.get("/", (req, res) => {
    res.send("Home");
});
require('./msg_socket/msgSocket')(io)

///////
// io.on('connection', (socket) => {
//     console.log('a user connected '+ socket);
// });
///////

server.listen(port, () => {
    console.log('http://localhost:' + port);
});
const socketIoObject = io;
module.exports.ioObject = socketIoObject;
