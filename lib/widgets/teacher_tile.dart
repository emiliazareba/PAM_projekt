import 'package:flutter/material.dart';
import '../models/teacher.dart';
import '../screens/teacher_details_screen.dart';

class TeacherTile extends StatelessWidget {
  final Teacher teacher;

  const TeacherTile({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TeacherDetailsScreen(teacher: teacher),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2D),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                teacher.image,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Container(
                    width: 55,
                    height: 55,
                    color: Colors.grey.shade800,
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
                    width: 55,
                    height: 55,
                    color: Colors.grey.shade700,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white70,
                      size: 30,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    teacher.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Ruthie",
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Przedmiot: ${teacher.subject}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Rye",
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
