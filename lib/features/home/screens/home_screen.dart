import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:istreamo/config/env/env_config.dart';
import 'package:istreamo/features/home/controller/repository_controller.dart';
import 'package:istreamo/features/home/state/repository_state.dart';
import 'package:istreamo/models/models.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositoryController = ref.watch(repositoryControllerProvider);

    ref.listen(repositoryControllerProvider, (previous, next) {
      if (next == RepositoryState.networkError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.toString())),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text(EnvConfig.appName)),
      body: repositoryController.whenOrNull(
        initial: () => const Center(child: CircularProgressIndicator()),
        completed: (repositories) => _RepoList(repositories: repositories),
        error: (error) => Text(error),
      ),
    );
  }
}

class _RepoList extends HookConsumerWidget {
  const _RepoList({Key? key, required this.repositories}) : super(key: key);

  final List<Repository> repositories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        ref.read(repositoryControllerProvider.notifier).handlePagination(
            scrollController.position.pixels,
            scrollController.position.maxScrollExtent);
      });
      return () => scrollController.removeListener(() {});
    }, [scrollController]);

    return ListView.builder(
      controller: scrollController,
      itemCount: repositories.length,
      itemBuilder: (_, int index) {
        return ListTile(title: Text(repositories[index].name));
      },
    );
  }
}
