
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/models/chat_message_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class ChatRemoteDatasource {
final String apiKey = dotenv.env['API_KEY'] ?? '';

  Future<ChatMessageModel> sendMessage(String input) async {
  final uri = Uri.parse(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey',
  );

  final headers = {'Content-Type': 'application/json'};

  final body = jsonEncode({
    'contents': [
      {
        'role': 'user',
        'parts': [
          {
            'text': '''
Você é um assistente especializado em ciclo menstrual, período fértil, menstruação e gestação. 
Responda somente perguntas relacionadas a esses temas.
Se a pergunta for fora do tema, responda educadamente: 
"Desculpe, só posso ajudar com dúvidas sobre ciclo menstrual, fertilidade e gestação."
'''
          }
        ]
      },
      {
        'role': 'user',
        'parts': [
          {'text': input}
        ]
      }
    ]
  });

  final response = await http.post(uri, headers: headers, body: body);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final content = data['candidates'][0]['content']['parts'][0]['text'];
    return ChatMessageModel(role: 'ai', text: content);
  } else {
    throw Exception('Erro na API: ${response.body}');
  }
}
}