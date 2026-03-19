import 'package:dio/dio.dart';
import 'package:modul_4/features/dosen/data/models/dosen_model.dart';

class DosenRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: {'Accept': 'application/json'},
    ),
  );

  /// Mendapatkan daftar dosen
  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dio.get('/users');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data); // Debug: Tampilkan data yang sudah di-decode
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data dosen: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      throw Exception('Gagal memuat data dosen: ${e.message}');
    }
  }
}