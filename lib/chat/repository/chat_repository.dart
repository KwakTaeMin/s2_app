
import 'package:s2_app/chat/domain/favorite_word.dart';
import 'package:s2_app/chat/provider/chat_api_provider.dart';

import '../domain/chat.dart';

class ChatRepository {
  final chatApiProvider = ChatApiProvider();

  Future<List<Chat>> get chats => chatApiProvider.getChats();


  Future<List<FavoriteWord>> getFavoriteWords(String? userName) {
    if(userName != null) {
      return chatApiProvider.getFavoriteWordsByUserName(userName);
    }
    return chatApiProvider.getFavoriteWords();
  }

  Future<int> getMessageCount(String? userName) {
    if(userName != null) {
      return chatApiProvider.getMessageCountByUserName(userName);
    }
    return chatApiProvider.getMessageCount();
  }




}