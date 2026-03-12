import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modul_4/core/constants/constants.dart';
import 'package:modul_4/core/widgets/widgets.dart';
import 'package:modul_4/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';
import 'package:modul_4/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Mahasiswa'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(mahasiswaNotifierProvider),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: mahasiswaState.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data: ${error.toString()}',
          onRetry: () {
            ref.read(mahasiswaNotifierProvider.notifier).refresh();
          },
        ),
        data: (mahasiswaList) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(mahasiswaNotifierProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              itemCount: mahasiswaList.length,
              itemBuilder: (context, index) {
                final mahasiswa = mahasiswaList[index];
                final gradientColors = AppConstants.dashboardGradients[
                    index % AppConstants.dashboardGradients.length];
                return MahasiswaCard(
                  mahasiswa: mahasiswa,
                  gradientColors: gradientColors,
                );
              },
            ),
          );
        },
      ),
    );
  }
}