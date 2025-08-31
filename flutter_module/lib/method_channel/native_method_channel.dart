import 'package:flutter/services.dart';

class NativeIosMethodChannel {
  static const MethodChannel _channel = MethodChannel('page_method_channel');

  /// 禁用/启用滑动返回
  static void activePopGesture(bool canPop) {
    try {
      _channel.invokeMethod('activePopGesture', canPop);
    } on PlatformException catch (e) {
      print('❌ 调用失败: ${e.message}');
    }
  }

  /// 返回到原生页面
  static void popNativePage() {
    try {
      _channel.invokeMethod('popNativePage');
    } on PlatformException catch (e) {
      print('❌ 调用失败: ${e.message}');
    }
  }
}
