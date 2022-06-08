class Option {
  final String id;
  final String quizId;
  final String text;

  Option({
    required this.id,
    required this.quizId,
    required this.text,
  });

  Option.fromJson(Map json)
      : id = json['id'],
        quizId = json['quiz_id'],
        text = json['text'];
}
