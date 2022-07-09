import 'package:flutter/material.dart';

import 'chat.dart';
import 'chat_service.dart' as chat_service;

class ChatPage extends StatefulWidget{
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatPageState();

}

class _ChatPageState extends State<ChatPage> {
  Future<Chat>? chats;

  @override
  void initState() {
    super.initState();
    chats = chat_service.getChats();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: FutureBuilder<Chat>(
          //통신데이터 가져오기
          future: chats,
          builder: (context, chat) {
        if (chat.hasData) {
          return buildColumn(chat);
        } else if (chat.hasError) {
          return Text("${chat.error}에러!!", textDirection: TextDirection.ltr);
        }
        return const CircularProgressIndicator();
      },
    ));
  }

  Widget buildColumn(chat) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(chat.data!.messageDate.toString(),
            style: const TextStyle(fontSize: 20), textDirection: TextDirection.ltr),
        Text(chat.data!.userName.toString(),
            style: const TextStyle(fontSize: 20), textDirection: TextDirection.ltr),
        Text(chat.data!.message.toString(),
            style: const TextStyle(fontSize: 20), textDirection: TextDirection.ltr),
      ],
    );
  }

}