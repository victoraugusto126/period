import 'package:period/data/datasources/chat_remote_datasource.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDatasource datasource;

  ChatRepositoryImpl(this.datasource);

  @override
  Future<ChatMessage> sendMessage(String input) {
    return datasource.sendMessage(input);
  }
}