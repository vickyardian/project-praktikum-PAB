import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text('PRAKTIKUM PAB 2025', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text(
                '1462200096',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 15),
              Image.asset('assets/images/logo.png', height: 150),
              const SizedBox(height: 15),
              const Text(
                'Vicky Ardiansyah',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // aksi tombol
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[200],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
