import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Pag_usuario.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final username = "Usuario123";
    final email = "usuario@teste.com";

    return Drawer(
      backgroundColor: const Color.fromARGB(255, 51, 45, 65),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PagUsuario(
                        username: username,
                        email: email,
                        daysUsing: 12,
                        dreamsRegistered: 5,
                      ),
                    ),
                  );
                },
                child: const Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                username,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Sair"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
