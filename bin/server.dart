import 'dart:io';

handleMsg(msg) {
  print('Message received: $msg');
}

main() async {
  try {
    var server = await HttpServer.bind('127.0.0.1', 8080);
    await for (HttpRequest req in server) {
      if (req.uri.path == '/ws') {
        // Upgrade an HttpRequest to a WebSocket connection.
        var socket = await WebSocketTransformer.upgrade(req);
        socket.listen(handleMsg);

        print('request: ' + req.headers.toString());
      }
    }
  } catch (e) {
    print(e);
  }
}