import 'package:flutter/services.dart';
import 'package:flutter_screen_orientation/flutter_screen_orientation_interface.dart';

class FlutterScreenOrientationIosService
    extends FlutterScreenOrientationService {
  MethodChannel _channel = const MethodChannel('flutter_screen_orientation');

  @override
  Future<void> init() async {
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == "orientationCallback" &&
          mOrientationCallback != null) {
        mOrientationCallback(int.parse(call.arguments));
      }
    });
    await _channel.invokeMethod('init');
  }
}
