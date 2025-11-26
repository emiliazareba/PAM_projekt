import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/teacher.dart';
import '../mapper.dart';
import '../services/hp_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeachersViewModel extends ChangeNotifier {
  final HpApiService api = HpApiService();

  List<Teacher> teachers = [];
  bool isLoading = false;
  String? error;

  List<dynamic> houseStudents = [];
  bool isLoadingHouse = false;
  String? houseError;

  Future<void> loadTeachers() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      try {
        final data = await api.fetchStaff();
        teachers = data.map((e) => TeacherMapper.fromJson(e)).toList();

        await saveTeachersLocally(data);

      } catch (e) {
        final cached = await loadTeachersFromCache();
        if (cached != null) {
          teachers = cached.map((e) => TeacherMapper.fromJson(e)).toList();
        } else {
          error = "Brak internetu i brak lokalnych danych.";
        }
      }

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void like(Teacher teacher) {
    teacher.likes++;
    notifyListeners();
  }

  Future<void> loadStudentsForHouse(String house) async {
    try {
      isLoadingHouse = true;
      houseError = null;
      notifyListeners();

      final students = await api.fetchStudentsByHouse(house);
      houseStudents = students;

    } catch (e) {
      houseError = e.toString();
    } finally {
      isLoadingHouse = false;
      notifyListeners();
    }
  }

  Future<void> saveTeachersLocally(List<dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("teachers_cache", jsonEncode(data));
  }

  Future<List<dynamic>?> loadTeachersFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString("teachers_cache");
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }
}
