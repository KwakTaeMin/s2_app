import 'package:rxdart/rxdart.dart';
import 'package:s2_app/chat/repository/chat_repository.dart';

import '../domain/chat.dart';

class ChatBloc {
  final _chatRepository = ChatRepository();
  final _chatsFetcher = PublishSubject<List<Chat>>();

  Stream<List<Chat>> get chats => _chatsFetcher.stream;

  fetchChats() async {
    List<Chat> chats = await _chatRepository.chats;
    _chatsFetcher.sink.add(chats);
  }

  dispose() {
    _chatsFetcher.close();
  }

}

final chatBloc = ChatBloc();