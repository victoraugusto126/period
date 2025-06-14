import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String role;
  final String text;

  const ChatBubble({super.key, required this.role, required this.text});

  @override
  Widget build(BuildContext context) {
    final isUser = role == 'user';

    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUser)
          const CircleAvatar(
            backgroundColor: Colors.pink,
            child: Icon(Icons.water_drop_outlined, color: Colors.white),
          ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isUser ? Colors.pink[100] : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(width: 8),
        if (isUser)
          const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
      ],
    );
  }
}