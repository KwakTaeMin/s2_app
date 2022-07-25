
class UserMessageCount {
  final String userName;
  final DateTime messageDate;
  final int count;

  UserMessageCount({
    required this.userName,
    required this.messageDate,
    required this.count
  });

  factory UserMessageCount.fromJson(Map<String, dynamic> json) {
    return UserMessageCount(
        userName: json["userName"],
        messageDate: json["messageDate"],
        count: json["count"]
    );
  }
}