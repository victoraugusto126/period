import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:period/presentation/cubit/chat_state.dart';
import 'package:period/presentation/cubit/chat_cubit.dart';
import 'package:period/presentation/components/chat_bubble.dart';


class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Period IA')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final msg = state.messages[index];
                    return ChatBubble(role: msg.role, text: msg.text);
                  },
                );
              },
            ),
          ),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Digitando...'),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Digite sua pergunta...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final text = _controller.text;
                    if (text.trim().isNotEmpty) {
                      context.read<ChatCubit>().enviarMensagem(text);
                      _controller.clear();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}