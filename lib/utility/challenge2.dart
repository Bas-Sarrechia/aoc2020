class Challenge2 {
  int _minima;
  int _maxima;
  String _toValidateChar;
  String _passPhrase;

  Challenge2(String input) {
    List<String> segmentedInput = input.split(' ');
    _minima = int.tryParse(segmentedInput[0].split('-')[0]);
    _maxima = int.tryParse(segmentedInput[0].split('-')[1]);
    _toValidateChar = segmentedInput[1].substring(0, 1);
    _passPhrase = segmentedInput[2];
  }

  bool isValidByOccurance() {
    RegExp regExp = RegExp(_toValidateChar);
    int occurance = regExp.allMatches(_passPhrase).length;
    return occurance >= _minima && occurance <= _maxima;
  }

  bool isValidByPosition() {
    String firstPosition = _passPhrase.substring(_minima-1, _minima);
    String secondPosition = _passPhrase.substring(_maxima-1, _maxima);

    bool isValid = firstPosition != secondPosition && (firstPosition == _toValidateChar || secondPosition == _toValidateChar);
    return isValid;
  }
}
