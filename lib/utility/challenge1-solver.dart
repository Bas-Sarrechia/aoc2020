import 'aoc2020.dart';

class Challenge1Solver extends AOC2020 {
  List<int> _expenses = [];

  Challenge1Solver(String input) {
    input = input.endsWith('\n') ? input.substring(0, input.length - 2) : input;
    _expenses = input.split('\n').map((e) => int.parse(e)).toList();
  }

  void solveFirst() {
    for (int i = 0; i < _expenses.length; i++) {
      for (int j = i; j < _expenses.length; j++) {
        int sum = _expenses[i] + _expenses[j];
        if (sum == 2020) {
          print(_expenses[i] * _expenses[j]);
        }
      }
    }
  }

  void solveSecond() {
    for (int i = 0; i < _expenses.length; i++) {
      for (int j = i; j < _expenses.length; j++) {
        int sumOfTwo = _expenses[i] + _expenses[j];
        if (sumOfTwo < 2020) {
          for (int k = j; k < _expenses.length; k++) {
            int sumOfThree = sumOfTwo + _expenses[k];
            if (2020 == sumOfThree) {
              print(_expenses[i] * _expenses[j] * _expenses[k]);
            }
          }
        }
      }
    }
  }
}
