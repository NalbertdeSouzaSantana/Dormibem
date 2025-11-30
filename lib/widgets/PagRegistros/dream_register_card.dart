import 'package:flutter/material.dart';

class DreamRegisterCard extends StatelessWidget {
  final String date;
  final String sleepAt;
  final String wakeAt;
  final String quality;
  final String? notes;
  final VoidCallback? onEdit;

  const DreamRegisterCard({
    super.key,
    required this.date,
    required this.sleepAt,
    required this.wakeAt,
    required this.quality,
    this.notes,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title("Registro de Sono - $date"),

            const SizedBox(height: 12),
            _row("Dormiu às:", sleepAt),
            _row("Acordou às:", wakeAt),
            _row("Qualidade do Sono:", quality),

            if (notes != null && notes!.trim().isNotEmpty) ...[
              const SizedBox(height: 12),
              const Text(
                "Anotações:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF332D41),
                ),
              ),
              Text(notes!),
            ],

            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onEdit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF332D41),
                ),
                child: const Text("Editar"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF332D41),
            ),
          ),
          const SizedBox(width: 6),
          Text(value),
        ],
      ),
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF332D41),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}