import 'package:crpg/models/skill.dart';
import 'package:crpg/models/stats.dart';
import 'package:crpg/models/vocation.dart';

class Character with Stats {

  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });
  
  //Fields
  final Set<Skill> skills = {};
  final String name;
  final String slogan;
  final String id;
  final Vocation vocation;
  bool _isFav = false;

  // Getters
  bool get isFav => _isFav;

  // Methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

// Dummy Data

List<Character> characters = [
  Character(name: 'Ray', slogan: 'Let there be light!', vocation: Vocation.wizard, id: '1'),
  Character(name: 'Vikingr', slogan: 'Tonight, we battle!', vocation: Vocation.raider, id: '2'),
  Character(name: 'Hawks', slogan: 'Move like a butterfly, sting like a bee!', vocation: Vocation.ninja, id: '3'),
  Character(name: 'BloK', slogan: 'You shall not pass!', vocation: Vocation.tank, id: '4'),
];