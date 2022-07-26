
import 'package:s2_app/chat/domain/favorite_word.dart';
import 'package:s2_app/chat/domain/user_message_count.dart';
import 'package:s2_app/chat/provider/chat_api_provider.dart';

import '../domain/chat.dart';
import '../domain/message_count.dart';

class ChatRepository {
  final chatApiProvider = ChatApiProvider();

  Future<List<Chat>> get chats => chatApiProvider.getChats();
  Future<List<MessageCount>> get messageCountGroupDate => chatApiProvider.getMessageCountGroupDate();
  Future<List<UserMessageCount>> get userMessageCountGroupUserNameAndDate => chatApiProvider.getMessageCountGroupUserNameAndDate();
  Future<int> get wordCount => chatApiProvider.getWordCount();

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