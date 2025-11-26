import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/teachers_viewmodel.dart';

class HouseDetailsScreen extends StatefulWidget {
  final String houseName;

  const HouseDetailsScreen({super.key, required this.houseName});

  @override
  State<HouseDetailsScreen> createState() => _HouseDetailsScreenState();
}

class _HouseDetailsScreenState extends State<HouseDetailsScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<TeachersViewModel>(context, listen: false)
        .loadStudentsForHouse(widget.houseName);
  }

  static const houseDescriptions = {
    "Gryffindor":
    "Gryffindor to dom ceniący odwagę, śmiałość, honor i gotowość do poświęceń.\n"
        "Jego członkowie słyną z rycerskości, hartu ducha i determinacji.\n"
        "Założycielem domu był Godryk Gryffindor, a jego symbolem jest lew oraz barwy czerwono-złote.",
    "Slytherin":
    "Slytherin ceni ambicję, przebiegłość i spryt.\n"
        "Członkowie tego domu słyną z determinacji i dążenia do celu.\n"
        "Założycielem był Salazar Slytherin, a symbolem jest wąż.",
    "Ravenclaw":
    "Ravenclaw ceni mądrość, inteligencję i kreatywność.\n"
        "Uczniowie tego domu wyróżniają się błyskotliwością.\n"
        "Założycielką była Rowena Ravenclaw, a symbolem jest orzeł.",
    "Hufflepuff":
    "Hufflepuff ceni lojalność, uczciwość i pracowitość.\n"
        "Jego członkowie słyną z przyjaznego usposobienia.\n"
        "Założycielką była Helga Hufflepuff, a symbolem jest borsuk.",
  };

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TeachersViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.houseName,
          style: const TextStyle(
            fontFamily: "Ruthie",
            fontSize: 32,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFC19A6B),
      ),

      backgroundColor: const Color(0xFF1C1C1E),

      body: vm.isLoadingHouse
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : vm.houseError != null
          ? Center(
        child: Text(
          "Błąd: ${vm.houseError}",
          style: const TextStyle(color: Colors.white),
        ),
      )
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: const Color(0xFF2F2F31),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                houseDescriptions[widget.houseName] ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Rye",
                  fontSize: 18,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Najbardziej znani uczniowie",
              style: TextStyle(
                fontFamily: "Rye",
                color: Colors.white,
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                spacing: 20,
                runSpacing: 25,
                alignment: WrapAlignment.center,
                children: vm.houseStudents.map((student) {
                  return SizedBox(
                    width: 110,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            student["image"] ?? "",
                            width: 110,
                            height: 150,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                Container(
                                  width: 110,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius:
                                    BorderRadius.circular(16),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          student["name"] ?? "",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Rye",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
