import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Beranda', style: GoogleFonts.poppins()),
        backgroundColor: Colors.green[200],
      ),
      body: Center(
        child: Text(
          'Selamat Datang di Halaman Beranda!',
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
