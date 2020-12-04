class Challenge4Solver {
  List<Passport> _passports = [];

  Challenge4Solver(String input) {
    List<String> toParse = input.split('\n');
    String buffer = '';
    for (String line in toParse) {
      if (line.length > 0) {
        buffer = buffer + line;
      } else {
        if (buffer.length > 0) {
          _passports.add(new Passport(buffer));
        }
        buffer = '';
      }
    }
  }

  solveFirst() {
    int validPassports = 0;
    _passports.forEach((element) {
      if (element.isPresent()) {
        validPassports++;
      }
    });
    print(validPassports);
  }
}

class Passport {
  String _byr = false;
  String _iyr = false;
  String _eyr = false;
  String _hgt = false;
  String _hcl = false;
  String _ecl = false;
  String _pid = false;
  String _cid = false;

  Passport(String toParse) {
    this._byr = toParse.indexOf('byr:');
    this._iyr = toParse.indexOf('iyr:');
    this._eyr = toParse.indexOf('eyr:');
    this._hgt = toParse.indexOf('hgt:');
    this._hcl = toParse.indexOf('hcl:');
    this._ecl = toParse.indexOf('ecl:');
    this._pid = toParse.indexOf('pid:');
    this._cid = toParse.indexOf('cid:');
  }

  isPresent() {
    return this._byr &&
        this._iyr &&
        this._eyr &&
        this._hgt &&
        this._hcl &&
        this._ecl &&
        this._pid;
  }
}
