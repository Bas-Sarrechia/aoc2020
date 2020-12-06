class Challenge3Solver {
  List<String> _map = [];

  Challenge3Solver(String map) {
    map = map.endsWith('\n')
        ? map.substring(0, map.length - 2)
        : map;
    _map = map.split('\n');
  }

  void solveFirst() {
    print(_traverse(1, 3));
  }

  solveSecond() {
    List<List<int>> slopes = [
      [1, 1],
      [3, 1],
      [5, 1],
      [7, 1],
      [1, 2]
    ];
    int encounters = 1;
    for (List<int> slope in slopes) {
      encounters = encounters * _traverse(slope[1], slope[0]);
    }
    print(encounters);
  }

  int _traverse(int down, int right) {
    int encounters = 0;
    for (int i = 0; i * down < _map.length; i++) {
      if (this.doesEncounterWhenTraversing(down * i, right * i)) {
        encounters++;
      }
    }
    return encounters;
  }

  bool doesEncounterWhenTraversing(int down, int right) {
    return this
            ._map[down]
            .substring(right % _map[0].length, right % _map[0].length + 1) ==
        '#';
  }
}
