import 'package:flutter/material.dart';
import 'package:period/presentation/screens/duracao_ciclo/components/campo_duracao_ciclo.dart';
import 'package:period/presentation/screens/duracao_ciclo/components/campo_duracao_menstruacao.dart';
import 'package:period/presentation/screens/duracao_ciclo/components/botao_continuar.dart';

class TelaDuracaoCiclo extends StatefulWidget {
  const TelaDuracaoCiclo({super.key});

  @override
  State<TelaDuracaoCiclo> createState() => _TelaDuracaoCicloState();
}

class _TelaDuracaoCicloState extends State<TelaDuracaoCiclo> {
  final TextEditingController _cicloController = TextEditingController(
    text: '28',
  );
  final TextEditingController _menstruacaoController = TextEditingController(
    text: '5',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFED9D1),
      appBar: AppBar(
        title: const Text('Duração do Ciclo'),
        backgroundColor: const Color(0xFFFED9D1),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cadastro',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Color(0xFF8B2D2E),
              ),
            ),
            const SizedBox(height: 50),
            CampoDuracaoCiclo(controller: _cicloController),
            const SizedBox(height: 20),
            CampoDuracaoMenstruacao(controller: _menstruacaoController),
            const SizedBox(height: 20),
            const Spacer(),
            Center(
              child: BotaoContinuar(
                cicloController: _cicloController,
                menstruacaoController: _menstruacaoController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
