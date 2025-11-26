import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/teachers_viewmodel.dart';
import '../models/teacher.dart';
import 'teacher_details_screen.dart';
import 'ranking_screen.dart';

class TeachersListScreen extends StatefulWidget {
  const TeachersListScreen({super.key});

  @override
  State<TeachersListScreen> createState() => _TeachersListScreenState();
}

class _TeachersListScreenState extends State<TeachersListScreen> {
  String _query = "";

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TeachersViewModel>(context);

    List<Teacher> filtered = vm.teachers;
    if (_query.isNotEmpty) {
      filtered = vm.teachers
          .where((t) =>
      t.name.toLowerCase().contains(_query.toLowerCase()) ||
          t.subject.toLowerCase().contains(_query.toLowerCase()))
          .toList();
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1C),

      appBar: AppBar(
        backgroundColor: const Color(0xFFC69C6D),
        elevation: 0,
        title: const Text(
          "Harry Potter– Pracownicy",
          style: TextStyle(
            fontFamily: "RockSalt",
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RankingScreen()),
              );
            },
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF3A3A3C),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                onChanged: (value) => setState(() => _query = value),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  icon: Icon(Icons.search, color: Color(0xFFC69C6D)),
                  hintText: "Wyszukaj pracownika",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: vm.isLoading
                  ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
                  : vm.error != null
                  ? Center(
                child: Text(
                  vm.error!,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              )
                  : filtered.isEmpty
                  ? const Center(
                child: Text(
                  "Brak wyników.",
                  style: TextStyle(color: Colors.white70),
                ),
              )
                  : ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final teacher = filtered[index];

                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            TeacherDetailsScreen(teacher: teacher),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D2D2F),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                            BorderRadius.circular(12),
                            child: teacher.image.isNotEmpty
                                ? Image.network(
                              teacher.image,
                              width: 55,
                              height: 55,
                              fit: BoxFit.cover,
                              alignment:
                              Alignment.topCenter,

                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  width: 55,
                                  height: 55,
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
                                  width: 55,
                                  height: 55,
                                  color: Colors.grey.shade700,
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.white70,
                                  ),
                                );
                              },
                            )
                                : Container(
                              width: 55,
                              height: 55,
                              color: Colors.grey.shade700,
                              child: const Icon(
                                Icons.person,
                                color: Colors.white70,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Text(
                                  teacher.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: "Ruthie",
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Przedmiot: ${teacher.subject}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: "Rye",
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
