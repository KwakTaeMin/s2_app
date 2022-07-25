import 'dart:core';
import 'package:flutter/material.dart';
import 'package:s2_app/chat/bloc/chat_bloc.dart';
import '../domain/chat.dart';

class ChatPage extends StatelessWidget{
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    chatBloc.fetchChats();
    return SizedBox(
      child: StreamBuilder<List<Chat>> (
        stream: chatBloc.chats,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                      children: [Text('${snapshot.data[index].messageDate} ${snapshot.data[index].userName} ${snapshot.data[index].message}')]
                  );
                }
            );
          }
        },
      ),
    );


  }

}