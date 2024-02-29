import 'package:enamdua/pages/auth/lock/page.dart';
import 'package:enamdua/pages/main/page.dart';
import 'package:enamdua/pages/main/quick_action/page.dart';
import 'package:flutter/material.dart';

var appRoutes = <String, WidgetBuilder>{
  '/lock': (context) => const LockPage(),
  '/main': (context) => const MyHomePage(),
  '/quick-action': (context) => const QuickActionPage(),
};
