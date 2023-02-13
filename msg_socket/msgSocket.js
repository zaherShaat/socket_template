
//////////////

module.exports = function (io) {
    io.sockets.on("connection", (socket) => {
        console.log(" connected from msgs route");
        socket.on('newMessage', (newMessage) => {
            console.log(newMessage);
            socket.emit("msgReply", { reply: newMessage.msg + ' was served' })
        });
        // when server disconnects from user
        socket.on('disconnect', () => {
            console.log('disconnected from client');
        });
    });
}


//////////////
