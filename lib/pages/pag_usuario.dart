import 'package:flutter/material.dart';

class PagUsuario extends StatelessWidget {
  final String username;
  final String email;
  final int daysUsing;
  final int dreamsRegistered;

  const PagUsuario({
    super.key,
    required this.username,
    required this.email,
    required this.daysUsing,
    required this.dreamsRegistered,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E3E5B),
      appBar: AppBar(
        title: const Text("Seu Perfil"),
        backgroundColor: const Color(0xFF332D41),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_circle, size: 120, color: Colors.white),
              const SizedBox(height: 20),

              Text(
                username,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                email,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const SizedBox(height: 30),

              _infoRow("Dias usando o app:", "$daysUsing"),
              _infoRow("Sonhos registrados:", "$dreamsRegistered"),
              _infoRow("Qualidade média de sono:", "Boa"),
              _infoRow("Alarmes ativos:", "2"),

              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text("Voltar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF332D41),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
