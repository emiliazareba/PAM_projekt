import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/teacher.dart';
import '../viewmodels/teachers_viewmodel.dart';
import 'house_details_screen.dart';

class TeacherDetailsScreen extends StatelessWidget {
  final Teacher teacher;

  const TeacherDetailsScreen({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TeachersViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1C),

      appBar: AppBar(
        backgroundColor: const Color(0xFFC69C6D),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          teacher.name,
          style: const TextStyle(
            fontFamily: "Ruthie",
            fontSize: 28,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    teacher.image,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,

                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey.shade700,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },

                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade700,
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white70,
                            size: 80,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2D2D2F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    teacher.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Ruthie",
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    """
Przedmiot: ${teacher.subject}
Aktor: ${teacher.actor.isEmpty ? "-" : teacher.actor}
Patronus: ${teacher.patronus.isEmpty ? "-" : teacher.patronus}
Pochodzenie: ${teacher.ancestry.isEmpty ? "-" : teacher.ancestry}
Gatunek: ${teacher.species.isEmpty ? "-" : teacher.species}
Data urodzenia: ${teacher.dateOfBirth.isEmpty ? "-" : teacher.dateOfBirth}
Różdżka: ${teacher.wand}
                    """,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Rye",
                      fontSize: 18,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HouseDetailsScreen(
                            houseName: teacher.house,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Dom: ${teacher.house}",
                      style: const TextStyle(
                        fontFamily: "Rye",
                        fontSize: 20,
                        color: Color(0xFFD8B46A),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => vm.like(teacher),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Color(0xFFD8B46A),
                    size: 48,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "${teacher.likes}",
                  style: const TextStyle(
                    fontFamily: "IrishGrover",
                    fontSize: 32,
                    color: Color(0xFFD8B46A),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
