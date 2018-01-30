import 'dart:io';

main(List<String> arguments) async {
  final String url = 'ws://localhost:8080/ws';

  final Map<String, String> header = {"auth": "charafau"};

  final websocket = await WebSocket.connect(url, headers: header);
  websocket.listen(print);

  for (int i = 0; i < 5; i++) {
    websocket.add('hello! ' + i.toString());
  }

  print('running clinet!');
}
