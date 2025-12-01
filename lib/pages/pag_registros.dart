import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PagCadastro extends StatefulWidget {
  const PagCadastro({super.key});
  @override
  State<PagCadastro> createState() => _PagCadastroState();
}

class _PagCadastroState extends State<PagCadastro> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarController = TextEditingController();
  bool loading = false;
  Future<void> registrar() async {
    if (senhaController.text.trim() != confirmarController.text.trim()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("As senhas não coincidem!")));
      return;
    }
    setState(() => loading = true);
    try {
      if (!emailController.text.contains("@")) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Email inválido")));
        return;
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: senhaController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Conta criada com sucesso!")),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String msg = switch (e.code) {
        "weak-password" => "A senha deve ter pelo menos 6 caracteres.",
        "email-already-in-use" => "Este email já está em uso.",
        _ => "Erro: ${e.code}",
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(Icons.nightlight_round, size: 80, color: Colors.white),
              const SizedBox(height: 10),
              const Text(
                "DormirBem",
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
              const SizedBox(height: 40),
              _buildCampo(emailController, "Email"),
              const SizedBox(height: 15),
              _buildCampo(senhaController, "Senha", isSenha: true),
              const SizedBox(height: 15),
              _buildCampo(
                confirmarController,
                "Confirmar Senha",
                isSenha: true,
              ),
              const SizedBox(height: 25),
              loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : _buildBotao("Cadastrar", registrar),
            ],
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

  Widget _buildBotao(String texto, VoidCallback onPressed) {
    return SizedBox(
      width: 180,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF6C63FF),
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
