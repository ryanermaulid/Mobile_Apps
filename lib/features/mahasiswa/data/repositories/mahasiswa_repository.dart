import 'package:modul_4/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaModel(
        nama: 'Andi Firmansyah',
        nim: '2021001',
        email: 'andi.firmansyah@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Bela Safitri',
        nim: '2021002',
        email: 'bela.safitri@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Cahyo Nugroho',
        nim: '2020001',
        email: 'cahyo.nugroho@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2020',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Dewi Permata',
        nim: '2020002',
        email: 'dewi.permata@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2020',
        status: 'Lulus',
      ),
      MahasiswaModel(
        nama: 'Eko Prasetyo',
        nim: '2019001',
        email: 'eko.prasetyo@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2019',
        status: 'Lulus',
      ),
      MahasiswaModel(
        nama: 'Fani Oktavia',
        nim: '2022001',
        email: 'fani.oktavia@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2022',
        status: 'Aktif',
      ),
    ];
  }
}