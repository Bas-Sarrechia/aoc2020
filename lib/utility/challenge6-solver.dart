import 'aoc2020.dart';

class Challenge6Solver extends AOC2020 {
  List<String> _questionFormsData = [];

  Challenge6Solver(String questionForm) {
    if (questionForm.endsWith('\n')) {
      questionForm = questionForm.substring(0, questionForm.length - 4);
    }
    _questionFormsData = questionForm.split('\n\n');
  }

  void solveFirst() {
    int uniqueAnswers = _questionFormsData
        .map((e) => e.replaceAll('\n', ''))
        .map((e) => e.split('').toSet().length)
        .reduce((value, element) => value + element);
    print(uniqueAnswers);
  }

  void solveSecond() {
    int uniqueAnswers = _questionFormsData
        .map((element) => element
            .split('\n')[0]
            .split('')
            .map((e) =>
                e.allMatches(element).length == element.split('\n').length
                    ? 1
                    : 0)
            .reduce((x, y) => x + y))
        .reduce((x, y) => x + y);
    print(uniqueAnswers);
  }
}
