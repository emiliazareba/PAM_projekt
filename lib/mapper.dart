import 'models/teacher.dart';
import 'subjects.dart';

class TeacherMapper {
  static Teacher fromJson(Map<String, dynamic> json) {
    final name = json["name"] ?? "";

    return Teacher(
      name: name,
      image: json["image"] ?? "",
      house: json["house"] ?? "",
      actor: json["actor"] ?? "",
      patronus: json["patronus"] ?? "",
      ancestry: json["ancestry"] ?? "",
      species: json["species"] ?? "",
      dateOfBirth: json["dateOfBirth"] ?? "",
      wand: _wand(json["wand"]),
      subject: subjects[name] ?? "Nieznany przedmiot",
    );
  }

  static String _wand(dynamic wand) {
    if (wand == null) return "-";
    final wood = wand["wood"] ?? "-";
    final core = wand["core"] ?? "-";
    final length = wand["length"]?.toString() ?? "-";
    return "$wood, $core, $length\"";
  }
}
