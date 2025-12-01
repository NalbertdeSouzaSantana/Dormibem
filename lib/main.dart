import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter_application_1/pages/pag_login.dart';
import 'package:flutter_application_1/pages/pag_registros.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/pag_sobre.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login", // <--- agora começa no login
      routes: {
        "/home": (context) => const HomePage(),
        "/login": (context) => const PagLogin(),
        "/cadastro": (context) => const PagCadastro(),
        "/sobre": (context) => const PagSobre(),
      },
    );
  }
}
