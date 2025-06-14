import 'package:flutter/material.dart';

class LegendaWidget extends StatelessWidget {
  const LegendaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendaIcon(Icons.water_drop, Colors.red, 'Menstruação'),
              const SizedBox(width: 10),
              _legendaCor(Colors.red[200]!, 'Próx. Menstruação'),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendaIcon(Icons.water_drop, Colors.green, 'Período Fértil'),
              const SizedBox(width: 10),
              _legendaIcon(Icons.favorite, Colors.yellow, 'Ovulação'),
            ],
          ),
          
        ],
      ),
    );
  }

  Widget _legendaCor(Color cor, String texto) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: cor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(texto),
      ],
    );
  }

  Widget _legendaIcon(IconData icon, Color color, String texto) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(texto),
      ],
    );
  }
}
