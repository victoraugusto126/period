import 'package:flutter/material.dart';
import 'package:period/presentation/screens/tela_inicial/components/botao_iniciar.dart';
import 'package:period/presentation/screens/tela_inicial/components/texto_boas_vindas.dart';
import 'package:period/presentation/screens/tela_inicial/components/titulo_com_icone.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    final alturaTela = MediaQuery.of(context).size.height;
    final margemTopoIcone = alturaTela * 0.1;

    return Scaffold(
      backgroundColor: const Color(0xFFFED9D1),
      appBar: AppBar(
        title: const Text('Bem-vinda'),
        backgroundColor: const Color(0xFFFED9D1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: margemTopoIcone),
              child: const TituloComIcone(),
            ),
            const SizedBox(height: 64),
            const TextoBoasVindas(),
            const SizedBox(height: 64),
            const BotaoIniciar(),
          ],
        ),
      ),
    );
  }
}
