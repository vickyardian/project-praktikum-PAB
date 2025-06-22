import 'package:flutter/material.dart';

class DigimonListItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final Map<String, String> dataKeys;

  const DigimonListItem({
    super.key,
    required this.item,
    required this.dataKeys,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di sekeliling konten
        child: Column(
          // Mengganti Row menjadi Column
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Agar text bisa di-center
          children: [
            // 1. GAMBAR
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item[dataKeys['image']] ?? '',
                height: 150, // Mungkin perlu menambah tinggi gambar
                fit:
                    BoxFit
                        .contain, // Gunakan 'contain' agar gambar tidak terpotong
                errorBuilder:
                    (ctx, e, s) => const SizedBox(
                      height: 150,
                      child: Icon(Icons.broken_image, size: 50),
                    ),
              ),
            ),
            const SizedBox(height: 12), // Jarak antara gambar dan teks
            // 2. NAMA/TITLE
            Text(
              item[dataKeys['title']] ?? 'No Title',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18, // Mungkin perbesar sedikit font size
              ),
              textAlign: TextAlign.center, // Teks menjadi di tengah
            ),
            const SizedBox(height: 6), // Jarak antara judul dan URL
            // 3. URL
            Text(
              'URL: ${item[dataKeys['href']] ?? 'N/A'}',
              textAlign: TextAlign.center, // Teks menjadi di tengah
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
