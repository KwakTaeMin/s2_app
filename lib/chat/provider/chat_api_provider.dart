import 'package:http/http.dart' show Client;
import 'package:s2_app/chat/domain/favorite_word.dart';
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

}