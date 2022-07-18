import 'dart:core';
import 'package:flutter/material.dart';
import 'domain/chat.dart';
import 'chat_service.dart' as chat_service;

class ChatPage extends StatefulWidget{
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatPageState();

}

class _ChatPageState extends State<ChatPage> {
  List<Chat> _chats = [];


  @override
  void initState() {
    super.initState();
    _chats = getChats();
  }

  List<Chat> getChats() {
    Future<List<Chat>> fChats = chat_service.getChats();

    fChats.then((value) {
      return value;
    });
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 500,
          width: 500,
          child : Scrollbar(
            child: ListView.builder(
              //shrinkWrap: true,
              itemBuilder: (context, index) {
                final chat = _chats[index];
                print(chat.messageDate);
                return ListTile(
                  title: Text(chat.userName),
                  subtitle: Text(chat.message),
                  trailing: Text(chat.messageDate,  style: const TextStyle(color: Colors.green),),
                );
              },
              itemCount: _chats.length,
              scrollDirection: Axis.horizontal,
            ),
          ),

          );
  }

}