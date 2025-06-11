import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nbiController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

  Future<void> simpanData() async {
    String nama = namaController.text.trim();
    String nbi = nbiController.text.trim();
    String kelas = kelasController.text.trim();

    if (nama.isEmpty || nbi.isEmpty || kelas.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua field harus diisi!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', namaController.text);
    await prefs.setString('nbi', nbiController.text);
    await prefs.setString('kelas', kelasController.text);

    // Navigasi ke halaman login setelah daftar
    Navigator.pushReplacementNamed(context, '/login');

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Data berhasil disimpan')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Image.asset('assets/images/register.png', scale: 4, height: 100),
              const SizedBox(height: 10),
              const Text(
                'WELCOME',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text('Praktikum PAB 2025', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 32),
              TextField(
                controller: namaController,
                decoration: inputDecoration('Masukan Nama'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nbiController,
                decoration: inputDecoration('Masukan NBI'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: kelasController,
                decoration: inputDecoration('Kelas Praktikum'),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: simpanData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
