class Challenge4Solver {
  List<Passport> _passports = [];
  Challenge4Solver(String input) {
    this._passports = input.split('\n\n').map((e) => new Passport(e)).toList();
  }

  solveFirst() {
    int validPassports = 0;
    _passports.forEach((element) {
      if (element.isValidByPresence()) {
        validPassports++;
      }
    });
    print(validPassports);
  }

  solveSecond() {
    int validPassports = 0;
    _passports.forEach((element) {
      if (element.isValidByRules()) {
        validPassports++;
      }
    });
    print(validPassports);
  }
}

class Passport {
  Map<String, String> properties = {
    'byr': '',
    'iyr': '',
    'eyr': '',
    'hgt': '',
    'hcl': '',
    'ecl': '',
    'pid': '',
  };

  Passport(String toParse) {
    for (String key in properties.keys) {
      properties[key] = toParse.indexOf(key) == -1
          ? ''
          : parseValueFromSnippet(toParse.substring(toParse.indexOf(key)));
    }
  }

  String parseValueFromSnippet(String snippet) {
    String toParse = snippet.split('\n')[0];
    int index =
        toParse.indexOf(' ') == -1 ? toParse.length : toParse.indexOf(' ');
    return index == -1 ? '' : toParse.substring(0, index).split(':')[1];
  }

  bool isValidByPresence() {
    return properties.values
        .map((value) => value.length > 0)
        .reduce((value, element) => value && element);
  }

  bool isValidByRules() {
    return validateByr() &&
        validateIyr() &&
        validateEyr() &&
        validateHgt() &&
        validateHcl() &&
        validateEcl() &&
        validatePid();
  }

  bool validateEyr() {
    if (properties['eyr'].length == 4) {
      int eyrValue = int.parse(properties['eyr']);
      return eyrValue >= 2020 && eyrValue <= 2030;
    }
    return false;
  }

  bool validateByr() {
    if (properties['byr'].length != 0) {
      int byrValue = int.parse(properties['byr']);
      return byrValue >= 1920 && byrValue <= 2002;
    }
    return false;
  }

  bool validateIyr() {
    if (properties['iyr'].length == 4) {
      int iyrValue = int.parse(properties['iyr']);
      return iyrValue >= 2010 && iyrValue <= 2020;
    }
    return false;
  }

  bool validateHgt() {
    if (properties['hgt'].length != 0) {
      bool isCm = properties['hgt'].indexOf('cm') > -1;
      int hgtValue = int.tryParse(
          properties['hgt'].substring(0, properties['hgt'].length - 2));
      if (hgtValue == null) {
        return false;
      }
      if (isCm) {
        return hgtValue >= 150 && hgtValue <= 193;
      } else {
        return hgtValue >= 59 && hgtValue <= 76;
      }
    }
    return false;
  }

  bool validateHcl() {
    if (properties['hcl'].length != 0 &&
        properties['hcl'].substring(0, 1) == "#") {
      RegExp regExp = RegExp('[a-f0-9]');
      return properties['hcl'].length == 7 &&
          properties['hcl']
                  .substring(1, properties['hcl'].length)
                  .replaceAll(regExp, "")
                  .length ==
              0;
    }
    return false;
  }

  bool validateEcl() {
    List<String> allowed = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'];
    return allowed.contains(properties['ecl']);
  }

  bool validatePid() {
    return properties['pid'].length == 9;
  }
}
