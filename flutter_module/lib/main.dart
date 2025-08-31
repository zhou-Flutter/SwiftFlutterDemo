import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/method_channel/native_method_channel.dart';
import 'package:flutter_module/page/detail_page.dart';
import 'package:flutter_module/page/home_page.dart';
import 'package:flutter_module/router/custom_navigator_observer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var methodChannel = MethodChannel('page_method_channel');

  Widget page = RootPage();

  @override
  void initState() {
    super.initState();
    canPopNotifier.addListener(() {
      NativeIosMethodChannel.activePopGesture(canPopNotifier.value);
    });

    registerMethodChannel();
  }

  registerMethodChannel() {
    methodChannel.setMethodCallHandler((call) async {
      print('📲 收到 Flutter 调用: $call');

      if (call.method == 'settingRoute') {
        final route = call.arguments as String?;

        if (route == '/') {
          setState(() {
            page = RootPage();
          });
        }

        if (route == '/home') {
          setState(() {
            page = HomePage();
          });
        }

        if (route == '/detail') {
          setState(() {
            page = DetailPage();
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      navigatorObservers: [RouteObserverService()],
      home: page,
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white);
  }
}
