import 'package:flutter/material.dart';

class TextoBoasVindas extends StatelessWidget {
  const TextoBoasVindas({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Bem-vinda ao seu APP \n de Controle Menstrual',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 22, color: Colors.grey[600]),
    );
  }
}
