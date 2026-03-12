import 'package:modul_4/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      MahasiswaAktifModel(
        nama: 'Andi Firmansyah',
        nim: '2021001',
        email: 'andi.firmansyah@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        semester: '6',
        ipk: 3.75,
      ),
      MahasiswaAktifModel(
        nama: 'Bela Safitri',
        nim: '2021002',
        email: 'bela.safitri@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        semester: '6',
        ipk: 3.82,
      ),
      MahasiswaAktifModel(
        nama: 'Cahyo Nugroho',
        nim: '2020001',
        email: 'cahyo.nugroho@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2020',
        semester: '8',
        ipk: 3.60,
      ),
      MahasiswaAktifModel(
        nama: 'Fani Oktavia',
        nim: '2022001',
        email: 'fani.oktavia@student.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2022',
        semester: '4',
        ipk: 3.90,
      ),
    ];
  }
}