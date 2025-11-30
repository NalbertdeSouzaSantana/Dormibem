import 'package:flutter/material.dart';
import 'package:flutter_application_1/dream_entry.dart';
import 'package:flutter_application_1/widgets/PagRegistros/Dream_Register_Card.dart';

class DreamDiary extends StatefulWidget {
  final List<DreamEntry> entries;

  const DreamDiary({super.key, required this.entries});

  @override
  State<DreamDiary> createState() => _DreamDiaryState();
}

class _DreamDiaryState extends State<DreamDiary> {
  void _editEntry(int index) async {
    DreamEntry e = widget.entries[index];

    final dateCtrl = TextEditingController(text: e.date);
    final sleepCtrl = TextEditingController(text: e.sleepAt);
    final wakeCtrl = TextEditingController(text: e.wakeAt);
    final qualityCtrl = TextEditingController(text: e.quality);
    final notesCtrl = TextEditingController(text: e.notes ?? "");

    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Editar Registro"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: dateCtrl,
                  decoration: const InputDecoration(labelText: "Data"),
                ),
                TextField(
                  controller: sleepCtrl,
                  decoration: const InputDecoration(labelText: "Dormiu às"),
                ),
                TextField(
                  controller: wakeCtrl,
                  decoration: const InputDecoration(labelText: "Acordou às"),
                ),
                TextField(
                  controller: qualityCtrl,
                  decoration: const InputDecoration(labelText: "Qualidade"),
                ),
                TextField(
                  controller: notesCtrl,
                  decoration: const InputDecoration(labelText: "Anotações"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  e.date = dateCtrl.text;
                  e.sleepAt = sleepCtrl.text;
                  e.wakeAt = wakeCtrl.text;
                  e.quality = qualityCtrl.text;
                  e.notes = notesCtrl.text;
                });

                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.entries.length,
      itemBuilder: (context, index) {
        final e = widget.entries[index];

        return DreamRegisterCard(
          date: e.date,
          sleepAt: e.sleepAt,
          wakeAt: e.wakeAt,
          quality: e.quality,
          notes: e.notes,
          onEdit: () => _editEntry(index),
        );
      },
    );
  }
}
