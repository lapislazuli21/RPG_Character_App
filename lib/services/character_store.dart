import 'dart:async';

import 'package:crpg/models/character.dart';
import 'package:crpg/services/firestore_service.dart';
import 'package:flutter/material.dart';

class CharacterStore extends ChangeNotifier {

  final List<Character> _characters = [];

  get characters => _characters;

  void addCharacter(Character character) {

    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  void fetchCharactersOnce() async{
    if (characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }

  Future<void> saveCharacter(Character character) async{
    await FirestoreService.updateCharacter(character);
    return;
  }

  void removeCharacter(Character character) async{
    await FirestoreService.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }

}