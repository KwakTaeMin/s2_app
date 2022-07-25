
class MessageCount {
  final DateTime messageDate;
  final int count;

  MessageCount({
    required this.messageDate,
    required this.count
  });

  factory MessageCount.fromJson(Map<String, dynamic> json) {
    return MessageCount(
        messageDate: json["messageDate"],
        count: json["count"]
    );
  }
}