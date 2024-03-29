mixin Stats {

  // Fields
  int _points = 10;
  int _skill = 10;
  int _health = 10;
  int _defence = 10;
  int _attack = 10;

  // Getters
  int get points => _points;
  
  Map<String, int> get statsAsMap => {
    "health": _health,
    "attack": _attack,
    "defence": _defence,
    "skill": _skill,
  };

  List<Map<String, String>> get statsAsFmtList => [
    {"title": "health", 'value': _health.toString()},
    {"title": "attack", 'value': _attack.toString()},
    {"title": "defence", 'value': _defence.toString()},
    {"title": "skill", 'value': _skill.toString()},
  ];

  // Methods
  void increaseStat(String stat) {
    if (_points > 0) {
      switch (stat) {
        case 'health':
          _health++;
          break;
        case 'attack':
          _attack++;
          break;
        case 'defence':
          _defence++;
          break;
        case 'skill':
          _skill++;
          break;
      }
      _points--;
    }
  }

  void decreaseStat(String stat) {
    if (stat == 'health' && _health > 5) {
      _health--;
      _points++;
    } else if (stat == 'attack' && _attack > 5) {
      _attack--;
      _points++;
    } else if (stat == 'defence' && _defence > 5) {
      _defence--;
      _points++;
    } else if (stat == 'skill' && _skill > 5) {
      _skill--;
      _points++;
    }
  }


}