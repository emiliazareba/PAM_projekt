import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/teachers_viewmodel.dart';
import '../models/teacher.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TeachersViewModel>(context);

    final ranked = [...vm.teachers];
    ranked.sort((a, b) => b.likes.compareTo(a.likes));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC19A6B),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Nauczyciele ranking",
          style: TextStyle(
            fontFamily: "RockSalt",
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF1A1A1C),
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: ranked.length,
          itemBuilder: (context, index) {
            final teacher = ranked[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2D),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: teacher.image.isNotEmpty
                        ? Image.network(
                      teacher.image,
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    )
                        : Container(
                      width: 55,
                      height: 55,
                      color: Colors.grey.shade700,
                      child: const Icon(
                        Icons.person,
                        color: Colors.white70,
                        size: 30,
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${index + 1}.  ${teacher.name}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Rye",
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Serduszka: ${teacher.likes}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "IrishGrover",
                            fontSize: 24,
                            color: Color(0xFFD0D0D0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
