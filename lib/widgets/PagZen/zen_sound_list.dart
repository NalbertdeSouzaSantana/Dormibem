import 'package:flutter/material.dart';

class ZenSoundList extends StatelessWidget {
  final List<String> sounds;

  const ZenSoundList({
    super.key,
    required this.sounds,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...sounds.map((sound) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.music_note,
                            color: Color.fromARGB(255, 51, 45, 65)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            sound,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 51, 45, 65),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Ícone de play/pause
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.play_arrow,
                            color: Color.fromARGB(255, 51, 45, 65)),
                      ],
                    ),

                    // Barra de som
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: 0.0,
                      color: const Color.fromARGB(255, 51, 45, 65),
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}