import 'package:http/http.dart' show Client;
import 'package:s2_app/chat/domain/favorite_word.dart';
import 'package:s2_app/chat/domain/message_count.dart';
import 'package:s2_app/chat/domain/user_message_count.dart';
import 'dart:async';
import 'dart:convert';
import '../domain/chat.dart';


class ChatApiProvider {

  final baseUrl = 'http://127.0.0.1:9091';

  Future<List<Chat>> getChats() async {
    Client client = Client();
    var url = '$baseUrl/chat';

    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Chat> responseChatList = (json.decode(
          utf8.decode(response.bodyBytes)) as List)
          .map((chat) => Chat.fromJson(chat)).toList();
      return responseChatList;
    } else {
      throw Exception("fail get chats!");
    }
  }

  Future<List<FavoriteWord>> getFavoriteWords() async {
    Client client = Client();
    var url = '$baseUrl/chat/favorite';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<FavoriteWord> responseFavoriteWordList = (json.decode(
          utf8.decode(response.bodyBytes)) as List)
          .map((word) => FavoriteWord.fromJson(word)).toList();
      return responseFavoriteWordList;
    } else {
      throw Exception("fail get favorite words!");
    }
  }

  Future<List<FavoriteWord>> getFavoriteWordsByUserName(String username) async {
    Client client = Client();
    var url = '$baseUrl/chat/favorite/$username';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<FavoriteWord> responseFavoriteWordList = (json.decode(
          utf8.decode(response.bodyBytes)) as List)
          .map((word) => FavoriteWord.fromJson(word)).toList();
      return responseFavoriteWordList;
    } else {
      throw Exception("fail get favorite words!");
    }
  }

  Future<int> getWordCount() async {
    Client client = Client();
    var url = '$baseUrl/word/count';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      int wordCount = response.body as int;
      return wordCount;
    } else {
      throw Exception("fail get word count!");
    }
  }

  Future<int> getMessageCount() async {
    Client client = Client();
    var url = '$baseUrl/message/count';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      int messageCount = response.body as int;
      return messageCount;
    } else {
      throw Exception("fail get word count!");
    }
  }

  Future<int> getMessageCountByUserName(String username) async {
    Client client = Client();
    var url = '$baseUrl/message/count/$username';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      int messageCount = response.body as int;
      return messageCount;
    } else {
      throw Exception("fail get word count!");
    }
  }

  Future<List<MessageCount>> getMessageCountGroupDate() async {
    Client client = Client();
    var url = '$baseUrl/message/count/group/date';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<MessageCount> responseMessageCounts = (json.decode(
          utf8.decode(response.bodyBytes)) as List)
          .map((word) => MessageCount.fromJson(word)).toList();
      return responseMessageCounts;
    } else {
      throw Exception("fail get group date message count!");
    }
  }

  Future<List<UserMessageCount>> getMessageCountGroupUserNameAndDate() async {
    Client client = Client();
    var url = '$baseUrl/message/count/group/user-date';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<UserMessageCount> responseUserMessageCounts = (json.decode(
          utf8.decode(response.bodyBytes)) as List)
          .map((word) => UserMessageCount.fromJson(word)).toList();
      return responseUserMessageCounts;
    } else {
      throw Exception("fail get group user and date message count!");
    }
  }

}