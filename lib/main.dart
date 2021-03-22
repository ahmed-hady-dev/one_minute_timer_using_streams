import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    title: 'Stream Demo',
  ));
}

Stream<int> _stream() {
  Duration interval = Duration(seconds: 1);

  Stream<int> stream = Stream<int>.periodic(interval, callback);
  stream = stream.take(59);
  return stream;
}

int callback(int value) {
  return value;
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream example'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _stream(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(
                '1 Minute done',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              return Text(
                '00:${snapshot.data.toString().padLeft(2, "0")}',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              );
            }
            return Text(
              'waiting for Stream',
              style: TextStyle(
                fontSize: 30.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
