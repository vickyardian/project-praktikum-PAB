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
    bool isRegistered = prefs.containsKey('nama') && prefs.containsKey('nbi');

    await Future.delayed(const Duration(seconds: 3));

    if (isRegistered) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0c0a6f),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Image.asset('assets/images/img2.png', width: 150)],
          ),
          const SizedBox(height: 30),

          Image.asset('assets/images/img1.png', width: 200),

          const SizedBox(height: 20),

          const Text(
            'PRAKTIKUM PAB 2025',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Image.asset('assets/images/img2.png', width: 150)],
          ),
        ],
      ),
    );
  }
}
