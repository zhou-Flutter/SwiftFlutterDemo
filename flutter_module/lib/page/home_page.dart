import 'package:flutter/material.dart';
import 'package:flutter_module/common/custom_leading.dart';
import 'package:flutter_module/page/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomLeading(), title: const Text('Flutter 页面')),
      body: Center(
        child: GestureDetector(
          child: Text('Flutter 跳转二级页面'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage()),
            );
          },
        ),
      ),
    );
  }
}
