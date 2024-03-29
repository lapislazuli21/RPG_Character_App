enum Vocation {
  
  raider(
    title: 'Raider',
    description: 'Proficient in attacks & has a strong defense',
    weapon: "Club",
    ability: "Swarm",
    image: "raider.jpg",
  ),
  ninja(
    title: 'Ninja',
    description: 'Proficient in attacks & very skillful',
    weapon: "Katana",
    ability: "Shadow Strike",
    image: "ninja.jpg",
  ),
  wizard(
    title: 'Wizard',
    description: 'Proficient in skills & has a strong defense',
    weapon: "Staff",
    ability: "Spell Storm",
    image: "wiz.jpg",
  ),
  tank(
    title: 'Tank',
    description: 'Proficient in defence & has massive health',
    weapon: "Fists",
    ability: "Smash",
    image: "tank.jpg",
  );

  const Vocation({
    required this.title,
    required this.image,
    required this.description,
    required this.ability,
    required this.weapon,
  });

  final String title;
  final String image;
  final String description;
  final String ability;
  final String weapon;

}