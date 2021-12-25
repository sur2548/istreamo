import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:istreamo/config/env/env_config.dart';

final dioProvider = Provider.family<Dio, String?>((ref, path) {
  final dio = Dio();
  dio.options.baseUrl = EnvConfig.baseURL;

  if (path == null) return dio;

  final options = CacheOptions(
    store: HiveCacheStore(path),
    policy: CachePolicy.request,
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(days: 2),
    priority: CachePriority.high,
    cipher: null,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  );

  dio.interceptors.add(DioCacheInterceptor(options: options));

  return dio;
});
