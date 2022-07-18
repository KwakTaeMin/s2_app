
class Chat {
  final int id;
  final String messageDate;
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
                messageDate: json["messageDate"],
                userName: json["userName"],
                message: json["message"]
    );
  }
}

