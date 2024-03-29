import 'package:crpg/models/character.dart';
import 'package:crpg/models/vocation.dart';
import 'package:crpg/screens/create/vocation_card.dart';
import 'package:crpg/screens/home/home.dart';
import 'package:crpg/services/character_store.dart';
import 'package:crpg/shared/styled_button.dart';
import 'package:crpg/shared/styled_text.dart';
import 'package:crpg/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateState();
}

class _CreateState extends State<CreateScreen> {

  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  Vocation selectedVocation = Vocation.tank;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {

      showDialog(
        context: context, builder: (ctx) {
          return AlertDialog(
            title: const StyledHeadline('Missing character name!'),
            content: const StyledText('Try again'),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                }, 
                child: const StyledText('Close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        }
      );
      return;
    }

    if (_sloganController.text.trim().isEmpty) {
      showDialog(
        context: context, builder: (ctx) {
          return AlertDialog(
            title: const StyledHeadline('Missing slogan!'),
            content: const StyledText('Try again'),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                }, 
                child: const StyledText('Close'),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        }
      );
      return;
    }

  Provider.of<CharacterStore>(context, listen: false).addCharacter(
    Character(name: _nameController.text.trim(), slogan: _sloganController.text.trim(), vocation: selectedVocation, id: uuid.v4())
  );

    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) => const Home(),
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.code, color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeadline('Welcome'),
              ),
              const Center(
                child: StyledText('Pick a name & slogan'),
              ),
              const SizedBox(height: 30,),
          
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character Name')
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character Slogan')
                ),
              ),
              const SizedBox(height: 30,),
          
              Center(
                child: Icon(
                  Icons.code, color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeadline('Choose vocation'),
              ),
              const Center(
                child: StyledText('Determines available skills'),
              ),
              const SizedBox(height: 30,),
          
              VocationCard(
                onTap: updateVocation,
                selected: selectedVocation == Vocation.tank,
                vocation: Vocation.tank
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider
              ),

              Center(
                child: Icon(
                  Icons.code, color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeadline('Good Luck!'),
              ),
              const Center(
                child: StyledText('Enjoy the journey...'),
              ),
              const SizedBox(height: 30,),
          
              Center(
                child: StyledButton(
                  onPressed: handleSubmit, child: const StyledHeadline('Create'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}