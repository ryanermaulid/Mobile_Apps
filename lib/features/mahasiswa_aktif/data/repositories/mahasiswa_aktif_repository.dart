import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_apps/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: {'Accept': 'application/json'},
    ),
  );

  /// Mendapatkan daftar mahasiswa aktif menggunakan http
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifListHttp() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // Debug
      return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data mahasiswa aktif: ${response.statusCode}');
    }
  }

  /// Mendapatkan daftar mahasiswa aktif menggunakan dio
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    try {
      final response = await _dio.get('/posts');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data); // Debug
        return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mahasiswa aktif: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      throw Exception('Gagal memuat data mahasiswa aktif: ${e.message}');
    }
  }
}