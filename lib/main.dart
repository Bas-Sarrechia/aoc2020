import 'dart:ui';

import 'package:AOC2020/atom/peach-streak.dart';
import 'package:AOC2020/utility/Challenge4-solver.dart';
import 'package:AOC2020/utility/challenge1-solver.dart';
import 'package:AOC2020/utility/challenge2-solver.dart';
import 'package:AOC2020/utility/challenge3-solver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      runApp(GetMaterialApp(home: Home()))
    };

class Home extends StatelessWidget {

  Future<void> solve() async {
    String fileText =
        await rootBundle.loadString('lib/assets/challenges/challenge4.txt');
      //  List<String> input = fileText.split('-----');
      // input.removeWhere((element) => element == null || element == "");
    // Challenge1Solver challenge1solver = new Challenge1Solver();
    // List<int> input = fileText.split('\n').map((e) => int.tryParse(e)).toList()
    //   ..removeWhere((element) => element == null);
    // challenge1solver.solveSecond(input);
    // Challenge3Solver challenge3solver = new Challenge3Solver(input);
    // challenge3solver.solveSecond();
    Challenge4Solver challenge4Solver = new Challenge4Solver(fileText);
    challenge4Solver.solveFirst();
  }

  @override
  Widget build(context) => Scaffold(
          body: Stack(
        children: [

          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PeachStreak()),
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(right: 70,top:90),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.white, height: 0.9),
                    children: <TextSpan>[
                      TextSpan(
                          text: '  A', style: TextStyle(fontSize: 40, height: 0)),
                      TextSpan(
                        text: 'dvent',
                      ),
                      TextSpan(
                          text: ' \n     O',
                          style: TextStyle(fontSize: 20, height: 1)),
                      TextSpan(text: 'f', style: TextStyle(height: 1.7)),
                      TextSpan(
                          text: '\nC',
                          style: TextStyle(fontSize: 120, height: 0.12)),
                      TextSpan(
                          text: '\n                  ode',
                          style: TextStyle(height: 0)),
                    ]),
              ),
            ),
          ),
          RaisedButton(child: Text('solve'), onPressed: () => solve(),),],
      ));
}

class Other extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("${1}")));
  }
}
