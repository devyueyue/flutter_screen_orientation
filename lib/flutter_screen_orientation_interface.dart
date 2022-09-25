import 'package:flutter/cupertino.dart';

abstract class FlutterScreenOrientationService {
  //方向回调
  late Function mOrientationCallback;

  void setOrientationCallback(Function orientationCallback) {
    this.mOrientationCallback = orientationCallback;
  }

  //初始化
  @protected
  Future<void> init();
}
