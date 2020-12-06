import 'dart:math' as math;

class Challenge5Solver {
  List<String> _seatings;

  Challenge5Solver(String input) {
    input = input.endsWith('\n') ? input.substring(0, input.length - 1) : input;
    this._seatings = input.split('\n');
  }

  solveFirst() {
    int seatId = 0;
    _seatings.forEach((element) {
      int row =
          getPosition(0, 127, 'F', element.substring(0, element.length - 3));
      int column = getPosition(
          0, 7, 'L', element.substring(element.length - 3, element.length));
      seatId = math.max(seatId, row * 8 + column);
    });
    print(seatId);
  }

  solveSecond() {
    List<int> ids = [];
    _seatings.forEach((element) {
      int row =
          getPosition(0, 127, 'F', element.substring(0, element.length - 3));
      int column = getPosition(
          0, 7, 'L', element.substring(element.length - 3, element.length));
      ids.add(row * 8 + column);
    });
    ids..sort();
    for (int i = 0; i < ids.length - 1; i++) {
      if (ids[i] + 1 != ids[i + 1]) {
        print(ids[i] + 1);
      }
    }
  }

  int getPosition(int min, int max, String higherBinary, String binarySnippet) {
    int positionMin = min;
    int positionMax = max;
    for (String parsed = binarySnippet;
        parsed.length > 0;
        parsed = parsed.substring(1, parsed.length)) {
      if (parsed.substring(0, 1) == higherBinary) {
        positionMax = ((positionMax - positionMin) / 2).floor() + positionMin;
      } else {
        positionMin = ((positionMin + positionMax) / 2).round();
      }
    }
    return positionMax;
  }
}
