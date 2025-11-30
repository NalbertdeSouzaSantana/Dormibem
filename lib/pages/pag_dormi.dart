import 'package:flutter/material.dart';
import 'package:flutter_application_1/dream_entry.dart';
import 'package:flutter_application_1/widgets/PagRegistros/dream_diary.dart';

class PagDormi extends StatelessWidget {
  const PagDormi({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = [
      DreamEntry(
        date: "28/11/2025",
        sleepAt: "23:40",
        wakeAt: "07:30",
        quality: "Boa",
        notes: "Sonhei com paisagens estranhas.",
      ),
      DreamEntry(
        date: "27/11/2025",
        sleepAt: "01:10",
        wakeAt: "08:00",
        quality: "Regular",
        notes: "",
      ),
      DreamEntry(
        date: "26/11/2025",
        sleepAt: "00:30",
        wakeAt: "07:50",
        quality: "Ótima",
        notes: "Sem sonhos lembrados.",
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),

          const Text(
            "Diário do Sono",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF332D41),
            ),
          ),

          const SizedBox(height: 10),

          DreamDiary(entries: entries),
        ],
      ),
    );
  }
}
