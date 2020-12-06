import 'dart:ui';

import 'package:AOC2020/atom/peach-streak.dart';
import 'package:AOC2020/utility/Challenge4-solver.dart';
import 'package:AOC2020/utility/aoc2020.dart';
import 'package:AOC2020/utility/challenge5-solver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      runApp(GetMaterialApp(home: Home()))
    };

class Home extends StatelessWidget {
  Future<void> solve() async {
    String input = await AOC2020.readFile('challenge1');
    // new Challenge1Solver(input)
    //   ..solveFirst()
    //   ..solveSecond();
    // input = await AOC2020.readFile('challenge2');
    // new Challenge2Solver(input)
    // ..solveFirst()
    // ..solveSecond();
    // input = await AOC2020.readFile('challenge3');
    // new Challenge3Solver(input)
    // ..solveFirst()
    // ..solveSecond();
    // input = await AOC2020.readFile('challenge4');
    // new Challenge4Solver(input)
    //   ..solveFirst()
    //   ..solveSecond();
    // input = await AOC2020.readFile('challenge5');
    // Challenge5Solver(input)
    // ..solveFirst()
    // ..solveSecond();
    // input = await AOC2020.readFile('challenge6');
    // Challenge6Solver(input)
    //   ..solveFirst()
    //   ..solveSecond();
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
              padding: EdgeInsets.only(right: 70, top: 90),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.white, height: 0.9),
                    children: <TextSpan>[
                      TextSpan(
                          text: '  A',
                          style: TextStyle(fontSize: 40, height: 0)),
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
          RaisedButton(
            child: Text('solve'),
            onPressed: () => solve(),
          ),
        ],
      ));
}

class Other extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(body: Center(child: Text("${1}")));
  }
}
