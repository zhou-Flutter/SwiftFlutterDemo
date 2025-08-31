import 'package:flutter/material.dart';
import 'package:flutter_module/common/custom_leading.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomLeading(),
        title: const Text('Flutter二级页面 页面'),
      ),
      body: Center(child: Text('二级页面 ')),
    );
  }
}
