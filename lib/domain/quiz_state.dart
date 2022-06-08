part of 'quiz_cubit.dart';

abstract class QuizState extends Equatable {
  final int indexQuiz;
  final int score;
  final int lengthQuizzes;

  const QuizState({
    required this.indexQuiz,
    required this.lengthQuizzes,
    required this.score,
  });
}

class QuizInitial extends QuizState {
  const QuizInitial({
    required int indexQuiz,
    required int score,
    required int lengthQuizzes,
  }) : super(indexQuiz: indexQuiz, lengthQuizzes: lengthQuizzes, score: score);

  @override
  List<Object> get props => [indexQuiz, score];
}

class QuizChanged extends QuizState {
  const QuizChanged({
    required int indexQuiz,
    required int score,
    required int lengthQuizzes,
  }) : super(indexQuiz: indexQuiz, lengthQuizzes: lengthQuizzes, score: score);

  @override
  List<Object> get props => [indexQuiz, score];
}
