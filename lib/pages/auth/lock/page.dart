import 'package:enamdua/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';

class LockPage extends StatefulWidget {
  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> with WidgetsBindingObserver {
  final LocalAuthentication auth = LocalAuthentication();
  bool isAuthenticated = false;

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Enamdua uses biometic auth to protect your data',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true
        ),
      );
    } on PlatformException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? "Something went wrong",
      );
      return;
    }
    setState(() {
      isAuthenticated = authenticated;
    });

    if (authenticated) {
      Future(() {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !isAuthenticated) {
      _authenticate();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _authenticate();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#000000'),
        toolbarHeight: 0,
      ),
      body: Center(
        child: IconButton(
          onPressed: _authenticate,
          icon: const Icon(
            Icons.lock,
            size: 60,
          ),
        ),
      ),
    );
  }
}
