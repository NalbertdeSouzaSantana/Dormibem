import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PagLogin extends StatefulWidget {
  const PagLogin({super.key});

  @override
  State<PagLogin> createState() => _PagLoginState();
}

class _PagLoginState extends State<PagLogin> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  bool loading = false;

  Future<void> login() async {
    setState(() => loading = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: senhaController.text.trim(),
      );
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, "/home");
    } on FirebaseAuthException catch (e) {
      String msg = switch (e.code) {
        "user-not-found" => "Usuário não encontrado.",
        "wrong-password" => "Senha incorreta.",
        "invalid-email" => "Email inválido.",
        _ => "Erro inesperado: ${e.code}",
      };
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B3A63),
      resizeToAvoidBottomInset: true, // 👈 IMPORTANTE
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.nightlight_round,
                  size: 80,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                const Text(
                  "DormirBem",
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
                const SizedBox(height: 40),

                _buildCampo(emailController, "Email"),
                const SizedBox(height: 15),

                _buildCampo(senhaController, "Senha", isSenha: true),
                const SizedBox(height: 20),

                loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : _buildBotao("Entrar", login),

                const SizedBox(height: 10),

                _buildBotao(
                  "Registrar",
                  () => Navigator.pushNamed(context, "/cadastro"),
                  invertido: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCampo(
    TextEditingController ctrl,
    String label, {
    bool isSenha = false,
  }) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: ctrl,
        obscureText: isSenha,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }

  Widget _buildBotao(
    String texto,
    VoidCallback onPressed, {
    bool invertido = false,
  }) {
    return SizedBox(
      width: 160,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: invertido ? Colors.white : const Color(0xFF6C63FF),
          foregroundColor: invertido ? const Color(0xFF6C63FF) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(texto),
      ),
    );
  }
}
