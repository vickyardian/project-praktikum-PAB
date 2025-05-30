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
          Image.asset(
            widget.image,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),

          // Icon Love di bawah gambar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    isLoved ? Icons.favorite : Icons.favorite_border,
                    color: isLoved ? Colors.red : Colors.grey,
                    size: 30,
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

          // Deskripsi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.description,
              style: GoogleFonts.poppins(fontSize: 16),
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
