import 'package:flutter/material.dart';
import '../../widgets/calendar/calendar_body.dart';
import 'package:period/presentation/screens/tela_chat/chat_screen.dart';
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFED9D1),
      appBar: AppBar(
        title: const Text('Ciclo Menstrual'),
        backgroundColor: const Color(0xFFFED9D1),
      ),
      body: const CalendarBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8B2D2E),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ChatScreen(),
          ));
        },
        child: const Icon(
          Icons.water_drop_outlined,
          color: Color(0xFFFED9D1),
        ),
      ),
    );
  }
}
