import 'package:flutter/material.dart';

class SleepSummaryCard extends StatelessWidget {
  const SleepSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width * 0.6;
    final h = MediaQuery.of(context).size.height * 0.3;

    return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: SizedBox(
    width: w,
    height: h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        const Text(
          "Bem-vindo de volta!",
          style: TextStyle(
            color: Color(0xFF332D41),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        // Sleep info
        Column(
          children: const [
            Text(
              "Seu sono de ontem",
              style: TextStyle(
                color: Color(0xFF332D41),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "7h45m de sono",
              style: TextStyle(
                color: Color(0xFF332D41),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Qualidade de sono: regular",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ],
    ),
  ),
);

  }
}