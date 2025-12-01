import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/PagSono/new_alarm_card.dart';
import 'package:flutter_application_1/widgets/PagSono/sleep_summary_card.dart';

class PagSono extends StatelessWidget {
  const PagSono({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),

            // Primeiro Card (horas dormidas)
            SleepSummaryCard(),

            const SizedBox(height: 10),
            NewAlarmCard(), // Segundo Card (novo alarme)
          ],
        ),
      ),
    );
  }
}
