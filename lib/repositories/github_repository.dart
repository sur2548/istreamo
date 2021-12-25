import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:istreamo/core/providers/dio_provider.dart';
import 'package:istreamo/core/providers/path_provider.dart';
import 'package:istreamo/models/models.dart';

final githubRepositoryProvider = Provider<GithubRepository>((ref) {
  return GithubRepositoryImpl(ref.read);
});

abstract class GithubRepository {
  Future<List<Repository>> getRepository({int page = 1});
}

class GithubRepositoryImpl extends GithubRepository {
  GithubRepositoryImpl(this.read);

  final Reader read;

  @override
  Future<List<Repository>> getRepository({int page = 1}) async {
    final path = await read(pathProvider.future);
    final dio = read(dioProvider(path));

    final response =
        await dio.get('users/JakeWharton/repos?page=$page&per_page=15');
    final repositories = <Repository>[];

    for (final el in response.data) {
      repositories.add(Repository.fromJson(el));
    }

    return repositories;
  }
}
