import 'package:flutter/material.dart';

class ZenSearchBar extends StatelessWidget {
  const ZenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "Buscar som",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(Icons.search),
        fillColor: Colors.white,
      ),
    );
  }
}