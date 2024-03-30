import 'package:crpg/screens/profile/skill_list.dart';
import 'package:crpg/screens/profile/stats_table.dart';
import 'package:crpg/services/character_store.dart';
import 'package:crpg/shared/styled_button.dart';
import 'package:crpg/shared/styled_text.dart';
import 'package:crpg/theme.dart';
import 'package:flutter/material.dart';
import 'package:crpg/models/character.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset('assets/imgs/vocations/${character.vocation.image}', width: 140, height: 140,),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeadline(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20,),

            Center(
              child: Icon(Icons.code, color: AppColors.primaryColor,),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeadline('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(height: 10,),
                    const StyledHeadline('Weapon'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10,),
                    const StyledHeadline('Special Ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character,),
                  SkillList(character),
                ],
              ),
            ),

            StyledButton(onPressed: (){

              Provider.of<CharacterStore>(context, listen: false).saveCharacter(character);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const StyledHeadline('Character Updated'),
                showCloseIcon: true,
                duration: const Duration(seconds: 2),
                backgroundColor: AppColors.secondaryColor,
              ));
            }, child: const StyledHeadline('Save Character')),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}