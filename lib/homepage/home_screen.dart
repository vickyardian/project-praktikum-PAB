import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detail_menu.dart';
import 'menu_screen.dart';
import 'profile_screen.dart';
import 'package:project_praktikum/auth/pin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> homeMenuList = const [
    {
      'title': 'Menu Nasi Goreng',
      'image': 'assets/images/menu1.png',
      'description': 'Nasi goreng dengan bumbu spesial dan topping lengkap',
    },
    {
      'title': 'Menu Mie',
      'image': 'assets/images/menu2.png',
      'description': 'Mie ayam dengan cita rasa pedas menggigit dan gurih',
    },
    {
      'title': 'Menu Sate',
      'image': 'assets/images/menu3.png',
      'description': 'Sate ayam khas Madura dengan bumbu kacang yang lezat',
    },
    {
      'title': 'Menu Bakso',
      'image': 'assets/images/bakso.webp',
      'description': 'Bakso isi telur dan bakso kecil-kecil yang menggoda',
    },
    {
      'title': 'Menu Ayam',
      'image': 'assets/images/ayamgeprek.jpg',
      'description': 'Ayam geprek super pedas dengan sambal bawang',
    },
    {
      'title': 'Menu Tahu Tek',
      'image': 'assets/images/tahutek.jpg',
      'description': 'Tahu tek khas Surabaya dengan lontong dan petis',
    },
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> appBarTitles = [
      'Beranda',
      'Daftar Menu',
      'PIN',
      'Profile',
    ];

    Widget bodyContent;
    switch (_selectedIndex) {
      case 0:
        bodyContent = _buildGrid(homeMenuList);
        break;
      case 1:
        bodyContent = const MenuScreen();
        break;
      case 2:
        bodyContent = const PinScreen();
        break;
      case 3:
        bodyContent = const ProfileScreen();
        break;
      default:
        bodyContent = _buildGrid(homeMenuList);
    }

    return Scaffold(
      appBar:
          _selectedIndex == 3
              ? null
              : AppBar(
                title: Text(
                  appBarTitles[_selectedIndex],
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                backgroundColor: const Color.fromARGB(255, 42, 136, 18),
              ),
      body:
          _selectedIndex == 3
              ? bodyContent
              : Padding(padding: const EdgeInsets.all(8.0), child: bodyContent),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
        selectedItemColor: Colors.green[700],
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.lock), label: 'PIN'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildGrid(List<Map<String, String>> menuList) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children:
          menuList.map((menu) {
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(menu['image']!, fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        menu['title']!,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}
