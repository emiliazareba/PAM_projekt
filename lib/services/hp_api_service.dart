import 'dart:convert';
import 'package:http/http.dart' as http;

class HpApiService {
  final String staffUrl = "https://hp-api.onrender.com/api/characters/staff";

  Future<List<dynamic>> fetchStaff() async {
    final response = await http.get(Uri.parse(staffUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Błąd pobierania listy nauczycieli");
    }
  }

  Future<Map<String, dynamic>> fetchTeacherByName(String name) async {
    final encodedName = Uri.encodeComponent(name);
    final url = "https://hp-api.onrender.com/api/character/$encodedName";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      if (decoded is List && decoded.isNotEmpty) {
        return decoded[0];
      } else {
        throw Exception("Brak danych szczegółowych");
      }
    } else {
      throw Exception("Błąd pobierania szczegółów nauczyciela");
    }
  }

  Future<List<dynamic>> fetchStudentsByHouse(String house) async {
    final url = Uri.parse(
      "https://hp-api.onrender.com/api/characters/house/${house.toLowerCase()}",
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Błąd pobierania uczniów domu $house");
    }

    return jsonDecode(response.body);
  }
}

