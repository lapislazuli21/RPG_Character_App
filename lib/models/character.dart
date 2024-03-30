import 'package:cloud_firestore/cloud_firestore.dart';
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

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "slogan": slogan,
      "isFav": _isFav,
      "vocation": vocation.toString(), // "vocation.ninja"
      "skills": skills.map((s) => s.id).toList(),
      "stats": statsAsMap,
      "points": points,
    };
  }

  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options
  ) {
      final data = snapshot.data()!;

      Character character = Character(
        name: data['name'], slogan: data['slogan'], vocation: Vocation.values.firstWhere((voc) => voc.toString() == data['vocation']), id: snapshot.id
      );

      for (String id in data['skills']) {
        Skill skill = allSkills.firstWhere((element) => element.id == id);
        character.updateSkill(skill);
      }

      if (data['isFav']) {
        character.toggleIsFav();
      }

      character.setStats(points: data['points'], stats: data['stats']);

      return character;
  }
}

// Dummy Data

List<Character> characters = [
  Character(name: 'Ray', slogan: 'Let there be light!', vocation: Vocation.wizard, id: '1'),
  Character(name: 'Vikingr', slogan: 'Tonight, we battle!', vocation: Vocation.raider, id: '2'),
  Character(name: 'Hawks', slogan: 'Move like a butterfly, sting like a bee!', vocation: Vocation.ninja, id: '3'),
  Character(name: 'BloK', slogan: 'You shall not pass!', vocation: Vocation.tank, id: '4'),
];