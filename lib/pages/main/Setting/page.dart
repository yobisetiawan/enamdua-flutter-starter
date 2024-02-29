import 'package:enamdua/utils/helper.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#000000'),
        toolbarHeight: 0,
      ),
      body: const Center(
        child: Text(
          'Setting',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
