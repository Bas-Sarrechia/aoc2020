import 'package:AOC2020/utility/challenge2.dart';

class Challenge2Solver {
  List<Challenge2> _passphrases = new List();

  Challenge2Solver(List<String> passwords) {
    passwords.forEach((element) {
      _passphrases.add(Challenge2(element));
    });
  }

  solveFirst() {
    int counter = 0;
    _passphrases.forEach((element) {
      if(element.isValidByOccurance()){
        counter++;
      }
    });
    print(counter);
  }

  solveSecond() {
    int counter = 0;
    _passphrases.forEach((element) {
      if(element.isValidByPosition()){
        counter++;
      }
    });
    print(counter);
  }
}
