import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:enamdua/pages/main/Setting/page.dart';
import 'package:enamdua/pages/main/feeds/page.dart';
import 'package:enamdua/pages/main/home/page.dart';
import 'package:enamdua/pages/main/profile/page.dart';
import 'package:enamdua/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of first screen

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home,
    Icons.feed,
    Icons.person,
    Icons.settings,
  ];

  final body = [
    const HomePage(),
    const FeedPage(),
    const ProfilePage(),
    const SettingPage()
  ];

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#373A36'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: HexColor('#F5F7F9'),
      appBar: AppBar(
        backgroundColor: HexColor('#000000'),
        toolbarHeight: 0,
      ),
      body: body[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        shape: const CircleBorder(),
        backgroundColor: HexColor('#FFFFFF'),
        child: Icon(
          Icons.add,
          size: 35,
          color: HexColor('#BD291E'),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/quick-action');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        backgroundColor: HexColor('#FFFFFF'),
        activeIndex: _bottomNavIndex,
        activeColor: HexColor('#BD291E'),
        splashColor: HexColor('#DDDDDD'),
        inactiveColor: HexColor('#DDDDDD'),
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
