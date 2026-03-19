import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:modul_4/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: {'Accept': 'application/json'},
    ),
  );

  /// Mendapatkan daftar mahasiswa menggunakan http
  Future<List<MahasiswaModel>> getMahasiswaListHttp() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // Debug
      return data.map((json) => MahasiswaModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
    }
  }

  /// Mendapatkan daftar mahasiswa menggunakan dio
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final response = await _dio.get('/comments');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data); // Debug
        return data.map((json) => MahasiswaModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      throw Exception('Gagal memuat data mahasiswa: ${e.message}');
    }
  }
}