import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool notifications = true;
    bool alarm = true;
    bool darkMode = true;

    String language = "Português";

    return Drawer(
      backgroundColor: const Color.fromARGB(255, 51, 45, 65),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              "Configurações",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            // NOTIFICAÇÕES – alternar liga/desliga
            StatefulBuilder(
              builder: (context, setState) => SwitchListTile(
                activeThumbColor: Colors.white,
                inactiveThumbColor: Colors.grey,
                title: const Text(
                  "Notificações",
                  style: TextStyle(color: Colors.white),
                ),
                value: notifications,
                onChanged: (v) => setState(() => notifications = v),
                secondary: const Icon(Icons.notifications, color: Colors.white),
              ),
            ),

            // ALARMES – alternar liga/desliga
            StatefulBuilder(
              builder: (context, setState) => SwitchListTile(
                activeThumbColor: Colors.white,
                inactiveThumbColor: Colors.grey,
                title: const Text(
                  "Alarmes",
                  style: TextStyle(color: Colors.white),
                ),
                value: alarm,
                onChanged: (v) => setState(() => alarm = v),
                secondary: const Icon(Icons.alarm, color: Colors.white),
              ),
            ),

            // TEMA – alternar tema claro/escuro
            StatefulBuilder(
              builder: (context, setState) => SwitchListTile(
                activeThumbColor: Colors.white,
                inactiveThumbColor: Colors.grey,
                title: const Text(
                  "Tema Escuro",
                  style: TextStyle(color: Colors.white),
                ),
                value: darkMode,
                onChanged: (v) => setState(() => darkMode = v),
                secondary: const Icon(Icons.palette, color: Colors.white),
              ),
            ),

            const SizedBox(height: 10),

            // IDIOMA – abre diálogo para seleção de idioma
            ListTile(
              leading: const Icon(Icons.language, color: Colors.white),
              title: const Text(
                "Idioma",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                language,
                style: const TextStyle(color: Colors.white70),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      backgroundColor: const Color.fromARGB(255, 41, 37, 53),
                      title: const Text(
                        "Selecione o idioma",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        SimpleDialogOption(
                          child: const Text(
                            "Português",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            language = "Português";
                            Navigator.pop(context);
                          },
                        ),
                        SimpleDialogOption(
                          child: const Text(
                            "English",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            language = "English";
                            Navigator.pop(context);
                          },
                        ),
                        SimpleDialogOption(
                          child: const Text(
                            "简体中文",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            language = "简体中文";
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            // PRIVACIDADE – abre configurações de privacidade
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.white),
              title: const Text(
                "Privacidade",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),

            const SizedBox(height: 10),

            // SOBRE NÓS – navega para PagSobre
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text(
                "Sobre Nós",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, "/sobre");
              },
            ),
          ],
        ),
      ),
    );
  }
}
