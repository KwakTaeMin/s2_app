import 'dart:core';
import 'package:flutter/material.dart';
import 'chat.dart';
import 'chat_service.dart' as chat_service;

class ChatPage extends StatefulWidget{
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatPageState();

}

class _ChatPageState extends State<ChatPage> {
  List<Chat> chats = [];

  @override
  void initState() {
    super.initState();
    chats = getChats();
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
          height: 100,
          width: 200,
          child : Row(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ListTile(
                    title: Text(chat.userName),
                    subtitle: Text(chat.message),
                    trailing: Text(chat.messageDate,  style: const TextStyle(color: Colors.green),),
                  );
                },
               // separatorBuilder: (context, index) => const Divider(),
                itemCount: chats.length,
                scrollDirection: Axis.horizontal,
              ),
            ],
          ),

          );
  }

  Widget buildColumnList(List<Chat>? chats) {
    if(chats == null){
      return const Text("chat is null");
    } else {
      return Column(
        children: chats.map((chat) => buildRow(chat)).toList(),
      );
    }
  }
// todo list column
  Widget buildRow(chat) {
    return Row(
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