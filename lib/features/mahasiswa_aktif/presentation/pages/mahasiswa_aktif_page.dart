import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modul_4/core/constants/constants.dart';
import 'package:modul_4/core/widgets/widgets.dart';
import 'package:modul_4/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_provider.dart';
import 'package:modul_4/features/mahasiswa_aktif/presentation/widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa Aktif'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(mahasiswaAktifNotifierProvider),
          ),
        ],
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data: ${error.toString()}',
          onRetry: () {
            ref.read(mahasiswaAktifNotifierProvider.notifier).refresh();
          },
        ),
        data: (list) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(mahasiswaAktifNotifierProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final colors = AppConstants.dashboardGradients[
                    index % AppConstants.dashboardGradients.length];
                return MahasiswaAktifCard(
                  mahasiswa: list[index],
                  gradientColors: colors,
                );
              },
            ),
          );
        },
      ),
    );
  }
}