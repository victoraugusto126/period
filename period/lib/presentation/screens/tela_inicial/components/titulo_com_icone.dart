import 'package:flutter/material.dart';

class TituloComIcone extends StatelessWidget {
  const TituloComIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.water_drop_outlined,
          size: 100,
          color: Color(0xFF8B2D2E),
        ),
        SizedBox(height: 8),
        Text(
          'Calendário Menstrual',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8B2D2E),
          ),
        ),
      ],
    );
  }
}
