import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:period/presentation/cubit/calendario_cubit.dart';
import 'package:period/presentation/screens/tela_calendario/calendar_screen.dart';

class BotaoContinuar extends StatelessWidget {
  final TextEditingController cicloController;
  final TextEditingController menstruacaoController;

  const BotaoContinuar({
    super.key,
    required this.cicloController,
    required this.menstruacaoController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE5645B),
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Continuar',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      onPressed: () {
        final duracao = int.tryParse(cicloController.text) ?? 28;
        final menstruacao = int.tryParse(menstruacaoController.text) ?? 5;

        context.read<CalendarioCubit>().configurarCiclo(duracao, menstruacao);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CalendarScreen()),
        );
      },
    );
  }
}
