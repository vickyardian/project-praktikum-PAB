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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  Future<void> simpanData() async {
    String nama = namaController.text.trim();
    String nbi = nbiController.text.trim();
    String email = emailController.text.trim();
    String alamat = alamatController.text.trim();
    String instagram = instagramController.text.trim();
    String pin = pinController.text.trim();

    // Validasi field kosong
    if (nama.isEmpty ||
        nbi.isEmpty ||
        email.isEmpty ||
        alamat.isEmpty ||
        instagram.isEmpty ||
        pin.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua field harus diisi!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validasi panjang PIN
    if (pin.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('PIN harus minimal 6 digit!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Simpan ke SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', nama);
    await prefs.setString('nbi', nbi);
    await prefs.setString('email', email);
    await prefs.setString('alamat', alamat);
    await prefs.setString('instagram', instagram);
    await prefs.setString('pin', pin); // Simpan PIN

    // Beri notifikasi dan pindah ke login
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Data berhasil disimpan')));

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/register.png', height: 100),
              const SizedBox(height: 20),
              const Text(
                'WELCOME',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Praktikum PAB 2025',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      inputField(
                        controller: namaController,
                        label: 'Nama Lengkap',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 16),
                      inputField(
                        controller: nbiController,
                        label: 'NBI',
                        icon: Icons.badge,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      inputField(
                        controller: emailController,
                        label: 'Email',
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 16),
                      inputField(
                        controller: alamatController,
                        label: 'Alamat',
                        icon: Icons.home,
                      ),
                      const SizedBox(height: 16),
                      inputField(
                        controller: instagramController,
                        label: 'Instagram',
                        icon: Icons.camera_alt,
                      ),
                      const SizedBox(height: 16),
                      inputField(
                        controller: pinController,
                        label: 'PIN (Minimal 6 digit)',
                        icon: Icons.lock,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: simpanData,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3BAF6D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: label.toLowerCase().contains('pin'), // Sembunyikan PIN
      style: const TextStyle(fontFamily: 'Poppins'),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        labelText: label,
        labelStyle: const TextStyle(fontFamily: 'Poppins'),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
