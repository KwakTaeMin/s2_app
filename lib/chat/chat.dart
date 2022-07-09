
class Chat {
  final int id;
  final DateTime messageDate;
  final String userName;
  final String message;

  Chat({
    required this.id,
    required this.messageDate,
    required this.userName,
    required this.message
  });
  // todo : factory가 뭔지 알고가자
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(id: json["id"],
                messageDate: json["message_date"],
                userName: json["user_name"],
                message: json["message"]
    );
  }

/*  factory List<Chat>.fromJson(List<Map<String, dynamic>> json) {
    return new List ->
  }*/
}