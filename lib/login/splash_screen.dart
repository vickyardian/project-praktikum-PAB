import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isRegistered =
        prefs.containsKey('nama') &&
        prefs.containsKey('nbi') &&
        prefs.containsKey('kelas');

    await Future.delayed(const Duration(seconds: 3)); // splash 3 detik

    if (isRegistered) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/virus.png', width: 150)),
    );
  }
}
