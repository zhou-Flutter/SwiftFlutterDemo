import 'package:flutter/material.dart';
import 'package:flutter_module/method_channel/native_method_channel.dart';

class CustomLeading extends StatelessWidget {
  const CustomLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        final canPop = Navigator.of(context).canPop();
        if (canPop) {
          Navigator.pop(context);
        } else {
          NativeIosMethodChannel.popNativePage();
        }
      },
    );
  }
}
