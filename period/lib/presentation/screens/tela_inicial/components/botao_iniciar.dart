import 'package:flutter/material.dart';
import 'package:period/presentation/screens/duracao_ciclo/tela_duracao_ciclo.dart';

class BotaoIniciar extends StatelessWidget {
  const BotaoIniciar({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE5645B),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'Iniciar',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TelaDuracaoCiclo()),
        );
      },
    );
  }
}
