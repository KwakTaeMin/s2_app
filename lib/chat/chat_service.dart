import 'package:http/http.dart' as http;
import 'package:s2_app/chat/domain/favorite_word.dart';
import 'dart:async';
import 'dart:convert';
import 'domain/chat.dart';

Future<List<Chat>> getChats() async {
  var url = 'http://127.0.0.1:9091/chat';
  final response = await http.get(Uri.parse(url));
  if(response.statusCode == 200) {

    List<Chat> responseChatList = (json.decode(response.body) as List)
        .map((chat) => Chat.fromJson(chat)).toList();
    return responseChatList;

  } else {
    throw Exception("fail get chats!");
  }
}

Future<List<FavoriteWord>> getFavoriteWords() async {
  var url = 'http://127.0.0.1:9091/chat/favorite';
  final response = await http.get(Uri.parse(url));
  if(response.statusCode == 200) {

    List<FavoriteWord> responseFavoriteWordList = (json.decode(response.body) as List)
        .map((word) => FavoriteWord.fromJson(word)).toList();
    return responseFavoriteWordList;

  } else {
    throw Exception("fail get favorite words!");
  }
}