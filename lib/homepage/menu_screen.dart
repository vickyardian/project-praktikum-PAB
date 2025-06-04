import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, String>> extraMenuList = [
    {
      'title': 'Pecel Lele',
      'image': 'assets/images/pecellele.jpg',
      'description': 'Lele goreng renyah dengan sambal terasi khas.',
    },
    {
      'title': 'Rawon Daging',
      'image': 'assets/images/rawondaging.webp',
      'description': 'Rawon hitam khas Jawa Timur dengan daging empuk.',
    },
  ];

  final List<bool> liked = [
    false,
    false,
  ]; // Like state untuk masing-masing item

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: extraMenuList.length,
      itemBuilder: (context, index) {
        final menu = extraMenuList[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      menu['image']!,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        menu['title']!,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        liked[index] ? Icons.favorite : Icons.favorite_border,
                        color: liked[index] ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          liked[index] = !liked[index];
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  menu['description']!,
                  style: GoogleFonts.poppins(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${menu['title']} ditambahkan ke keranjang.',
                        ),
                      ),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
