import 'package:flutter/material.dart';

class CampoDuracaoMenstruacao extends StatelessWidget {
  final TextEditingController controller;

  const CampoDuracaoMenstruacao({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _boxDecoration(),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Duração da Menstruação (dias)',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      );
}
