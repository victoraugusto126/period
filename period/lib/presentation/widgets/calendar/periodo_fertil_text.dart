import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:period/presentation/cubit/calendario_state.dart';

class PeriodoFertilText extends StatelessWidget {
  final CalendarioState state;

  const PeriodoFertilText({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final ultima = state.ultimaMenstruacao!;
    final ciclo = state.duracaoCiclo;

    final ovulacao = ultima.add(Duration(days: ciclo - 14));

    final inicioFertil = ovulacao.subtract(const Duration(days: 4));
    final fimFertil = ovulacao.add(const Duration(days: 2));

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blueGrey[50],
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                'Período Fértil',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Começa no dia: ${DateFormat('dd/MM/yyyy').format(inicioFertil)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                'Termina no dia: ${DateFormat('dd/MM/yyyy').format(fimFertil)}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
