import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'digimon_list_item.dart'; // <-- TAMBAHKAN IMPORT INI

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});

  @override
  State<SecretPage> createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  late Future<List<dynamic>> _data;
  final Dio dio = Dio();

  final String apiUrl = 'https://digi-api.com/api/v1/digimon?page=0';
  final Map<String, String> dataKeys = {
    'image': 'image',
    'title': 'name',
    'href': 'href',
  };

  Future<List<dynamic>> fetchData() async {
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map && data.containsKey('content')) {
          return List<dynamic>.from(data['content']);
        }
        return [];
      } else {
        throw Exception('Gagal memuat data (status ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Gagal memuat data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _data = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Secret Page'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final item = items[index];
                // Penggunaan tetap sama, karena sudah di-import
                return DigimonListItem(item: item, dataKeys: dataKeys);
              },
            );
          } else {
            return const Center(child: Text('Tidak ada data ditemukan.'));
          }
        },
      ),
    );
  }
}
