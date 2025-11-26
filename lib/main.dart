import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/teachers_viewmodel.dart';
import 'screens/teachers_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TeachersViewModel()..loadTeachers(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harry Potter – Nauczyciele',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
      ),
      home: const TeachersListScreen(),
    );
  }
}
