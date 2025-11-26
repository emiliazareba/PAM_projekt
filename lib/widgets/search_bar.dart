import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(fontFamily: "Inter", color: Colors.white),
      decoration: InputDecoration(
        hintText: "Wyszukaj pracownika",
        hintStyle: const TextStyle(
          fontFamily: "Inter",
          fontSize: 22,
          color: Colors.grey,
        ),
        prefixIcon: const Icon(Icons.search, color: Color(0xFFC19A6B)),
        filled: true,
        fillColor: const Color(0xFF2F2F31),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
