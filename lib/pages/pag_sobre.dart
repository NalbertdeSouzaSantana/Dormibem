import 'package:flutter/material.dart';

class PagSobre extends StatelessWidget {
  const PagSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E3E5B),
      appBar: AppBar(
        title: const Text("Sobre Nós"),
        backgroundColor: const Color.fromARGB(255, 51, 45, 65),
        foregroundColor: Colors.white,
      ),

      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.nights_stay,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 15),

              Text(
                "DormirBem",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 30),

              Text(
                "Projeto desenvolvido por:\n\n"
                "- Mickael Cedraz\n"
                "- Nalbert de Souza\n"
                "- Tiago Sângil\n\n"
                "DormirBem © 2025",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}