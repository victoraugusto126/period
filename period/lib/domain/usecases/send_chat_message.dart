import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class SendChatMessage {
  final ChatRepository repository;

  SendChatMessage(this.repository);

  Future<ChatMessage> call(String input) {
    return repository.sendMessage(input);
  }
}