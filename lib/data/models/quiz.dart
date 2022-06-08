import 'option.dart';

class Quiz {
  final String id;
  final String quest;
  final String correctOptionId;
  final List<Option> options;

  Quiz({
    required this.id,
    required this.quest,
    required this.correctOptionId,
    required this.options,
  });

  factory Quiz.fromJson(Map json) {
    List<Option> options = [];

    for (var optJson in json['options']) {
      options.add(Option.fromJson(optJson));
    }

    return Quiz(
      id: json['id'],
      quest: json['quest'],
      correctOptionId: json['correct_option_id'],
      options: options,
    );
  }
}
