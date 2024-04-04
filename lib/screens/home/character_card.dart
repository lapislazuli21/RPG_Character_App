import 'package:crpg/models/character.dart';
import 'package:crpg/screens/profile/profile.dart';
import 'package:crpg/shared/styled_text.dart';
import 'package:crpg/theme.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Hero(
              tag: character.id.toString(),
              child: Image.asset('assets/imgs/vocations/${character.vocation.image}', width: 80,)
            ),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeadline(character.name),
                StyledText(character.vocation.title),
              ],
            ),
            const Expanded(child: SizedBox(),),
            IconButton(onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => Profile(character: character))
              );
            }, icon: Icon(Icons.arrow_forward_rounded, color: AppColors.textColor,))
          ],
        ),
      ),
    );
  }
}