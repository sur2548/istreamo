import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:istreamo/features/home/controller/page_controller.dart';
import 'package:istreamo/features/home/state/repository_state.dart';
import 'package:istreamo/repositories/github_repository.dart';

final repositoryControllerProvider =
    StateNotifierProvider<RepositoryController, RepositoryState>((ref) {
  return RepositoryController(ref.read);
});

class RepositoryController extends StateNotifier<RepositoryState> {
  RepositoryController(this.read, {RepositoryState? state})
      : super(state ?? const RepositoryState.initial()) {
    getRepositories();
  }

  final Reader read;

  void getRepositories({int page = 1}) async {
    final repository = read(githubRepositoryProvider);

    try {
      final repositories = await repository.getRepository(page: page);

      if (page == 1) {
        state = RepositoryState.completed(repositories);
        return;
      }

      state.maybeWhen(
        orElse: () {},
        completed: (items) {
          state = RepositoryState.completed([...items, ...repositories]);
        },
      );
    } on SocketException catch (_) {
      state = const RepositoryState.networkError('Sorry! No Internet');
    } on DioError catch (_) {
      state = const RepositoryState.error('Sorry! Something went wrong');
    }
  }

  void handlePagination(double pixelPosition, double maxScrollExtent) {
    if (pixelPosition == maxScrollExtent) {
      read(pageControllerProvider.notifier).increment();
      getRepositories(page: read(pageControllerProvider));
    }
  }
}
