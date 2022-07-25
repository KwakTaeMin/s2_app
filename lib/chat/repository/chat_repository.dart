
import 'package:s2_app/chat/provider/chat_api_provider.dart';

import '../domain/chat.dart';

class ChatRepository {
  final chatApiProvider = ChatApiProvider();

  Future<List<Chat>> get chats => chatApiProvider.getChats();
}