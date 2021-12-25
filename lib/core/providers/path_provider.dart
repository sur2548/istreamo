import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final pathProvider = FutureProvider<String>((ref) async {
  final appDocDir = await getApplicationDocumentsDirectory();

  return appDocDir.path;
});
