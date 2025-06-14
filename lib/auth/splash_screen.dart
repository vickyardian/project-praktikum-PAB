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
    double screenWidth = MediaQuery.of(context).size.width;
    double olafWidth = 200;
    double centerX = (screenWidth / 2) - (olafWidth / 2);

    return Scaffold(
      backgroundColor: const Color(0xfff0c0a6f),
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: centerX,
            child: Image.asset('assets/images/img2.png', width: olafWidth),
          ),

          Positioned(
            bottom: 60,
            left: centerX,
            child: Image.asset('assets/images/img2.png', width: olafWidth),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
