import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/PagZen/Zen_Search_Bar.dart';
import 'package:flutter_application_1/widgets/PagZen/Zen_Sound_List.dart';

class PagZen extends StatelessWidget {
  const PagZen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double cardWidth = screenWidth * 0.8;

    final List<String> sounds = [
      "Cachoeira Amazônica",
      "Chuva Leve",
      "Lareira Suave",
      "Rio",
      "Ruído Branco",
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barra de pesquisa
            ZenSearchBar(),
            const SizedBox(height: 24),

            // Lista de sons Zen
            ZenSoundList(sounds: sounds),
            const SizedBox(height: 24),

            // Card temporizador "Parar após"
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: cardWidth,
                  height: screenHeight * 0.235,
                  child: Column(
                    children: [
                      const Text(
                        "Parar após:",
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 45, 65),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Hora",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 80,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Minuto",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text("Cancelar"),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                51,
                                45,
                                65,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
