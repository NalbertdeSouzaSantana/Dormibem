import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/pag_sono.dart';
import 'package:flutter_application_1/pages/pag_zen.dart';
import 'package:flutter_application_1/pages/pag_dormi.dart';
import 'package:flutter_application_1/widgets/open_drawer.dart';
import 'package:flutter_application_1/widgets/settings_drawer.dart';
import 'package:flutter_application_1/widgets/user_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PagSono(),
    const PagDormi(),
    const PagZen(),
  ];

  @override
  Widget build(BuildContext context) {
    // 🔥 Impede acesso sem login (NÃO muda nada no seu layout)
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, "/login"));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.nights_stay, color: Colors.white, size: 26),
            SizedBox(width: 8),
            Text("DormirBem"),
          ],
        ),

        leading: const OpenDrawerIcon(),
        actions: const [OpenEndDrawerIcon()],

        backgroundColor: Color.fromARGB(255, 51, 45, 65),
        foregroundColor: Colors.white,
      ),

      drawer: const SettingsDrawer(),
      endDrawer: const UserDrawer(),

      backgroundColor: const Color.fromARGB(255, 62, 62, 91),
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Alarme"),
          BottomNavigationBarItem(icon: Icon(Icons.adjust), label: "Registros"),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: "Canto Zen",
          ),
        ],
      ),
    );
  }
}
