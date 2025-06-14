import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:period/domain/usecases/send_chat_message.dart';
import 'package:period/domain/entities/chat_message.dart';
import 'chat_state.dart';


class ChatCubit extends Cubit<ChatState> {
  final SendChatMessage sendChatMessage;

  ChatCubit(this.sendChatMessage)
      : super(ChatState(messages: [], isLoading: false)) {
    _mensagemBoasVindas();
  }

  void _mensagemBoasVindas() {
    emit(state.copyWith(messages: [
      ChatMessage(role: 'ai', text: 'Olá, no que posso ajudar em relação ao seu ciclo menstrual?')
    ]));
  }

  Future<void> enviarMensagem(String input) async {
    emit(state.copyWith(
        messages: [...state.messages, ChatMessage(role: 'user', text: input)],
        isLoading: true));

    try {
      final resposta = await sendChatMessage(input);
      emit(state.copyWith(
        messages: [...state.messages, resposta],
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        messages: [
          ...state.messages,
          ChatMessage(role: 'ai', text: 'Erro: $e')
        ],
        isLoading: false,
      ));
    }
  }
}
