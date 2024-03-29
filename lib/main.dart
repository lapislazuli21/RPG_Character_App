import 'package:crpg/services/character_store.dart';
import 'package:crpg/theme.dart';
import 'package:flutter/material.dart';
import 'package:crpg/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: const Home(),
    ),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('Sandbox'),
    );
  }
}