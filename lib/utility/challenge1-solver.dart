class Challenge1Solver {
  int solveFirst(List<int> expenses) {
    for (int i = 0; i < expenses.length; i++) {
      for (int j = i; j < expenses.length; j++) {
        int sum = expenses[i] + expenses[j];
        if (sum == 2020) {
          print(expenses[i] * expenses[j]);
          return expenses[i] * expenses[j];
        }
      }
    }
    return 0;
  }

  int getValidInput(List<int> expenses, Function predicate) {
    for (int i = 0; i < expenses.length; i++) {
      for (int j = i; j < expenses.length; j++) {
        int sum = expenses[i] + expenses[j];
        predicate(sum);
        if (sum == 2020) {
          print(expenses[i] * expenses[j]);
          return expenses[i] * expenses[j];
        }
      }
    }
    return 0;
  }

  int solveSecond(List<int> expenses) {
    for (int i = 0; i < expenses.length; i++) {
      for (int j = i; j < expenses.length; j++) {
        int sumOfTwo = expenses[i] + expenses[j];
        if (sumOfTwo < 2020) {
          for (int k = j; k < expenses.length; k++) {
            int sumOfThree = sumOfTwo + expenses[k];
            if (2020 == sumOfThree) {
              print(expenses[i] * expenses[j] * expenses[k]);
              return expenses[i] * expenses[j] * expenses[k];
            }
          }
        }
      }
    }
    return 0;
  }

}
