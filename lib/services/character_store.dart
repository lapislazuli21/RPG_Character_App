import 'package:crpg/models/character.dart';
import 'package:crpg/models/vocation.dart';
import 'package:flutter/material.dart';

class CharacterStore extends ChangeNotifier {

  final List<Character> _characters = [
    Character(name: 'Ray', slogan: 'Let there be light!', vocation: Vocation.wizard, id: '1'),
    Character(name: 'Vikingr', slogan: 'Tonight, we battle!', vocation: Vocation.raider, id: '2'),
    Character(name: 'Hawks', slogan: 'Move like a butterfly, sting like a bee!', vocation: Vocation.ninja, id: '3'),
    Character(name: 'BloK', slogan: 'You shall not pass!', vocation: Vocation.tank, id: '4'),
  ];

  get characters => _characters;

  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }

}