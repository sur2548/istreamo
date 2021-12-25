import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istreamo/models/models.dart';

part 'repository_state.freezed.dart';

@freezed
abstract class RepositoryState with _$RepositoryState {
  const factory RepositoryState.initial() = _Initial;

  const factory RepositoryState.loading(List<Repository> repositories) = _Loading;

  const factory RepositoryState.error(String error) = _Error;

  const factory RepositoryState.networkError(String error) = _NetworkError;

  const factory RepositoryState.completed(List<Repository> repositories) =
      _Completed;
}
