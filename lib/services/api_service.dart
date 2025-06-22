import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000', // ganti jika pakai real device
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<List<dynamic>> fetchMenu() async {
    final response = await dio.get('/menu');
    return response.data;
  }

  Future<void> addToCart(Map<String, dynamic> item) async {
    await dio.post('/cart', data: item);
  }
}
