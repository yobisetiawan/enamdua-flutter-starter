import 'package:enamdua/utils/helper.dart';
import 'package:flutter/material.dart';

class LockPage extends StatefulWidget {
  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  @override
  void initState() {
    Future(() {
      Navigator.pushReplacementNamed(context, '/main');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#000000'),
        toolbarHeight: 0,
      ),
      body: const Center(
        child: Icon(
          Icons.lock,
          size: 60,
        ),
      ),
    );
  }
}
