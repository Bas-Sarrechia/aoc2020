import 'package:flutter/services.dart' show rootBundle;

abstract class AOC2020 {
  static Future<String> readFile(fileName) async {
    return await rootBundle.loadString('lib/assets/challenges/$fileName');
  }

  void solveFirst();

  void solveSecond();
}
