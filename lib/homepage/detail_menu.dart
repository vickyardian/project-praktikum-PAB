import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String image;
  final String description;

  const DetailScreen({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<bool> isLovedList = [];
  late List<Map<String, String>> currentMenu;

  // Data menu berdasarkan kategori
  final Map<String, List<Map<String, String>>> allMenus = {
    'Menu Nasi Goreng': [
      {
        'title': 'Nasigoreng Original',
        'image': 'assets/images/menu1.png',
        'description':
            'Nasigoreng dengan rasa original yang lezat dan gurih. Dibuat dengan bumbu tradisional yang khas.',
        'price': 'Rp 15.000',
      },
      {
        'title': 'Nasigoreng Pedas',
        'image': 'assets/images/menu1.png',
        'description':
            'Nasigoreng dengan tingkat kepedasan yang menggugah selera. Cocok untuk pecinta makanan pedas.',
        'price': 'Rp 17.000',
      },
      {
        'title': 'Nasigoreng Manis',
        'image': 'assets/images/menu1.png',
        'description':
            'Nasigoreng dengan cita rasa manis yang unik. Perpaduan sempurna antara manis dan gurih.',
        'price': 'Rp 16.000',
      },
      {
        'title': 'Nasigoreng Spesial',
        'image': 'assets/images/menu1.png',
        'description':
            'Nasigoreng dengan resep spesial rumah. Menggunakan bahan-bahan pilihan berkualitas tinggi.',
        'price': 'Rp 20.000',
      },
      {
        'title': 'Nasigoreng Jumbo',
        'image': 'assets/images/menu1.jpg',
        'description':
            'Nasigoreng berukuran jumbo untuk yang lapar besar. Porsi melimpah dengan rasa yang tak terlupakan.',
        'price': 'Rp 25.000',
      },
    ],
    'Menu Mie': [
      {
        'title': 'Mie Ayam Original',
        'image': 'assets/images/menu2.png',
        'description':
            'Mie ayam dengan kuah kaldu yang gurih dan daging ayam yang lembut.',
        'price': 'Rp 12.000',
      },
      {
        'title': 'Mie Ayam Pedas',
        'image': 'assets/images/menu2.png',
        'description':
            'Mie ayam dengan sambal pedas yang menggigit. Cocok untuk pecinta pedas.',
        'price': 'Rp 14.000',
      },
      {
        'title': 'Mie Ayam Bakso',
        'image': 'assets/images/menu2.png',
        'description':
            'Mie ayam dengan tambahan bakso sapi yang kenyal dan gurih.',
        'price': 'Rp 16.000',
      },
      {
        'title': 'Mie Ayam Spesial',
        'image': 'assets/images/menu2.png',
        'description':
            'Mie ayam dengan topping lengkap: pangsit, bakso, dan sayuran.',
        'price': 'Rp 18.000',
      },
    ],
    'Menu Sate': [
      {
        'title': 'Sate Ayam',
        'image': 'assets/images/menu3.png',
        'description':
            'Sate ayam khas Madura dengan bumbu kacang yang legit dan gurih.',
        'price': 'Rp 20.000',
      },
      {
        'title': 'Sate Kambing',
        'image': 'assets/images/menu3.png',
        'description':
            'Sate kambing dengan daging empuk dan bumbu kacang spesial.',
        'price': 'Rp 25.000',
      },
      {
        'title': 'Sate Padang',
        'image': 'assets/images/menu3.png',
        'description': 'Sate dengan kuah gulai khas Padang yang kaya rempah.',
        'price': 'Rp 22.000',
      },
      {
        'title': 'Sate Maranggi',
        'image': 'assets/images/menu3.png',
        'description':
            'Sate daging sapi dengan bumbu maranggi yang khas dan lezat.',
        'price': 'Rp 28.000',
      },
    ],
    'Menu Bakso': [
      {
        'title': 'Bakso Biasa',
        'image': 'assets/images/bakso.webp',
        'description':
            'Bakso sapi dengan kuah kaldu yang hangat dan mie kuning.',
        'price': 'Rp 10.000',
      },
      {
        'title': 'Bakso Urat',
        'image': 'assets/images/bakso.webp',
        'description': 'Bakso dengan urat sapi yang kenyal dan gurih.',
        'price': 'Rp 13.000',
      },
      {
        'title': 'Bakso Telur',
        'image': 'assets/images/bakso.webp',
        'description': 'Bakso isi telur dengan kuah kaldu yang lezat.',
        'price': 'Rp 15.000',
      },
      {
        'title': 'Bakso Jumbo',
        'image': 'assets/images/bakso.webp',
        'description':
            'Bakso berukuran jumbo dengan isian daging yang melimpah.',
        'price': 'Rp 18.000',
      },
    ],
    'Menu Ayam': [
      {
        'title': 'Ayam Geprek Original',
        'image': 'assets/images/ayamgeprek.jpg',
        'description':
            'Ayam geprek dengan sambal bawang level 1 yang pas di lidah.',
        'price': 'Rp 15.000',
      },
      {
        'title': 'Ayam Geprek Pedas',
        'image': 'assets/images/ayamgeprek.jpg',
        'description':
            'Ayam geprek super pedas level 10 untuk tantangan lidah.',
        'price': 'Rp 16.000',
      },
      {
        'title': 'Ayam Geprek Keju',
        'image': 'assets/images/ayamgeprek.jpg',
        'description':
            'Ayam geprek dengan topping keju mozarella yang meleleh.',
        'price': 'Rp 18.000',
      },
      {
        'title': 'Ayam Geprek Jumbo',
        'image': 'assets/images/ayamgeprek.jpg',
        'description': 'Ayam geprek berukuran jumbo dengan nasi yang banyak.',
        'price': 'Rp 20.000',
      },
    ],
    'Menu Tahu Tek': [
      {
        'title': 'Tahu Tek Original',
        'image': 'assets/images/tahutek.jpg',
        'description':
            'Tahu tek khas Surabaya dengan lontong, ketupat, dan petis.',
        'price': 'Rp 8.000',
      },
      {
        'title': 'Tahu Tek Telur',
        'image': 'assets/images/tahutek.jpg',
        'description': 'Tahu tek dengan tambahan telur rebus dan kerupuk.',
        'price': 'Rp 10.000',
      },
      {
        'title': 'Tahu Tek Spesial',
        'image': 'assets/images/tahutek.jpg',
        'description':
            'Tahu tek dengan topping lengkap dan sambal petis ekstra.',
        'price': 'Rp 12.000',
      },
      {
        'title': 'Tahu Tek Jumbo',
        'image': 'assets/images/tahutek.jpg',
        'description':
            'Tahu tek porsi jumbo dengan lontong dan ketupat berlimpah.',
        'price': 'Rp 15.000',
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    // Ambil menu berdasarkan title yang dikirim dari HomeScreen
    currentMenu = allMenus[widget.title] ?? [];
    // Inisialisasi list isLoved untuk setiap menu
    isLovedList = List.filled(currentMenu.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 42, 136, 18),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body:
          currentMenu.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant_menu,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Menu belum tersedia',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: currentMenu.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(12),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar makanan
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            currentMenu[index]['image']!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                height: 200,
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),

                        // Nama makanan, harga, dan ikon love dalam satu baris
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentMenu[index]['title']!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      currentMenu[index]['price']!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  isLovedList[index]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      isLovedList[index]
                                          ? Colors.red
                                          : Colors.grey,
                                  size: 28,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isLovedList[index] = !isLovedList[index];
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                        // Deskripsi makanan
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            currentMenu[index]['description']!,
                            style: GoogleFonts.poppins(fontSize: 14),
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Tombol Add to Cart
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder:
                                      (_) => AlertDialog(
                                        title: const Text('Add to Cart'),
                                        content: Text(
                                          '${currentMenu[index]['title']} berhasil ditambahkan ke keranjang!',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed:
                                                () => Navigator.pop(context),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[400],
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Add to Cart - ${currentMenu[index]['price']}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
