import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detail_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> menuList = const [
    {
      'title': 'Nasi Goreng Spesial',
      'image': 'assets/images/menu1.png',
      'description': 'Nasi goreng dengan bumbu spesial dan topping lengkap.',
    },
    {
      'title': 'Mie Ayam Pedas',
      'image': 'assets/images/menu2.png',
      'description': 'Mie ayam dengan cita rasa pedas menggigit dan gurih.',
    },
    {
      'title': 'Sate Ayam Madura',
      'image': 'assets/images/menu3.png',
      'description': 'Sate ayam khas Madura dengan bumbu kacang yang lezat.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Makanan', style: GoogleFonts.poppins()),
        backgroundColor: Colors.green[200],
      ),
      body: ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          final menu = menuList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => DetailScreen(
                        title: menu['title']!,
                        image: menu['image']!,
                        description: menu['description']!,
                      ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      menu['image']!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      menu['title']!,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
