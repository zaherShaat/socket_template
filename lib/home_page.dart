import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_socket_template/emit_btn.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late IO.Socket socket;
  @override
  void initState() {
    // TODO: implement initState
    _connectToSocket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          EmitBtn(
            onPressed: () {
              socket.emit("newMessage", {"msg": "msg from client"});
            },
            txt: "new message emit",
          ),
        ],
      ),
    );
  }

  void _connectToSocket() {
    socket = IO.io("http://192.168.1.86:8200", <String, dynamic>{
      'autoConnect': true,
      'transports': ['websocket']
    });
    socket.connect();
    socket.onConnect((_) => debugPrint('Connection established'));
    socket.onDisconnect((_) => debugPrint('Connection Disconnection'));
    socket.onConnectError((err) => debugPrint(err.toString()));
    socket.onError((err) => debugPrint(err.toString()));
    socket.on("newMessage", (data) => debugPrint("new msg >> $data"));
    socket.on("msgReply", (data) => debugPrint("$data >> reply"));
  }
}
