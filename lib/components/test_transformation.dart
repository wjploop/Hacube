import 'dart:math';
import 'package:flutter/scheduler.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {

  AnimationController _controller;

  var angle = 0.0;

  Ticker ticker;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 6), upperBound: 2 * pi);
    _controller
      ..addListener(() {
        setState(() {
          angle = _controller.value;
        });
      });
    // _controller.forward();
    ticker ??= Ticker((Duration duraction){
      setState(() {
        print('$duraction');
        angle += 0.1;
      });
    });
    ticker.start();

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey,
        width: 100,
        height: 100,
        child: Transform(
          transform:Matrix4.identity()..rotate(Vector3(1, 1, 0), angle),
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            color: Colors.blue,

            child: Text(
              "Text",
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ),
    );
  }
}
