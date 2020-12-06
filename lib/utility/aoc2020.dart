import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class AOC2020 {
  static Future<String> readFile(fileName) async {
    WidgetsFlutterBinding.ensureInitialized();
    String input =
        await rootBundle.loadString('lib/assets/challenges/$fileName.txt');
    return input;
  }

  dynamic solveFirst();

  dynamic solveSecond();
}
