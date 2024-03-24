import 'package:hive/hive.dart';

class HiveTokens {
  static Box<String>? tokenBox;
  static Future<void> initHiveTokens() async {
    HiveTokens.tokenBox = await Hive.openBox('tokens');
  }
}
