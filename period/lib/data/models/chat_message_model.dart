import '../../domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  ChatMessageModel({required super.role, required super.text});

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      role: json['role'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() => {
        'role': role,
        'text': text,
      };
}
