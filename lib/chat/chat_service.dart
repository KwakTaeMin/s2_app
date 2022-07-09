import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'chat.dart';

Future<Chat> getChats() async {
  var url = 'http://127.0.0.1:9091/chat';
  final response = await http.get(Uri.parse(url));
  if(response.statusCode == 200) {
    return Chat.fromJson(json.decode(response.body));
  } else {
    throw Exception("fail get chat list!");
  }
}