import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_orientation/flutter_screen_orientation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String current = 'Unknown';

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    FlutterScreenOrientation.instance().init();
    FlutterScreenOrientation.instance().listenerOrientation((e) {
      if (e == FlutterScreenOrientation.portraitUp) {
        this.setState(() {
          current = "摄像头在上";
        });
      } else if (e == FlutterScreenOrientation.portraitDown) {
        this.setState(() {
          current = "摄像头在下";
        });
      } else if (e == FlutterScreenOrientation.landscapeLeft) {
        this.setState(() {
          current = "摄像头在左";
        });
      } else if (e == FlutterScreenOrientation.landscapeRight) {
        this.setState(() {
          current = "摄像头在右";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('当前方向: $current\n'),
        ),
      ),
    );
  }
}
