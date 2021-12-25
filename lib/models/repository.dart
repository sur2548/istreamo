import 'package:istreamo/core/type_defs/type_defs.dart';

class Repository {
  late String name;

  Repository({required this.name});

  Repository.fromJson(MapDynamic json) {
    name = json['name'];
  }
}
