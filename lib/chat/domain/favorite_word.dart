
class FavoriteWord {
  final String word;
  final int count;

  FavoriteWord ({
    required this.word,
    required this.count
  });

  factory FavoriteWord.fromJson(Map<String, dynamic> json) {
    return FavoriteWord(
        word: json["word"],
        count: json["count"]
    );
  }


}

