class Teacher {
  final String name;
  final String image;
  final String house;
  final String actor;
  final String patronus;
  final String ancestry;
  final String species;
  final String dateOfBirth;
  final String wand;

  String subject;
  int likes;

  Teacher({
    required this.name,
    required this.image,
    required this.house,
    required this.actor,
    required this.patronus,
    required this.ancestry,
    required this.species,
    required this.dateOfBirth,
    required this.wand,
    this.subject = "",
    this.likes = 0,
  });
}
