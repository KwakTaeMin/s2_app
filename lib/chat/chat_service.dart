import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'chat.dart';

Future<List<Chat>> getChats() async {
  var url = 'http://127.0.0.1:9091/chat';
  final response = await http.get(Uri.parse(url));
  if(response.statusCode == 200) {
    List responseChatList = json.decode(response.body);
    return responseChatList.map((chat) => Chat.fromJson(chat)).toList();
  } else {
    throw Exception("fail get chat list!");
  }
}