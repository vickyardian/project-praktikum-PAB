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
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: GoogleFonts.poppins()),
        backgroundColor: Colors.green[200],
      ),
      body: ListView(
        children: [
          // Gambar makanan
          Image.asset(
            widget.image,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),

          // Nama makanan dan ikon love dalam satu baris
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isLoved ? Icons.favorite : Icons.favorite_border,
                    color: isLoved ? Colors.red : Colors.grey,
                    size: 28,
                  ),
                  onPressed: () {
                    setState(() {
                      isLoved = !isLoved;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          // Deskripsi makanan
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.description,
              style: GoogleFonts.poppins(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),

          const SizedBox(height: 20),

          // Tombol Add to Cart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: const Text('Add to Cart'),
                        content: Text(
                          '${widget.title} berhasil ditambahkan ke keranjang!',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Add to Cart'),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
