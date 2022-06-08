import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/models/quiz.dart';
import '../presentation/screens/finish_screen.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit()
      : super(const QuizInitial(score: 0, lengthQuizzes: 0, indexQuiz: 0));

  void chosenAnswer(
    context, {
    required Quiz currQuiz,
    required String? chosenOptionId,
    required int lengthQuizzes,
    required CountDownController controller,
  }) {
    var currIndex = state.indexQuiz;
    var currScore = state.score;

    if (currQuiz.correctOptionId == chosenOptionId) {
      currScore++;
    }

    if ((currIndex + 1) < lengthQuizzes) {
      currIndex++;
      controller.restart(initialPosition: 0, duration: 20);
    } else {
      Navigator.of(context).pushReplacementNamed(FinishScreen.routeName);

      controller.pause();
    }

    emit(QuizChanged(
      indexQuiz: currIndex,
      score: currScore,
      lengthQuizzes: lengthQuizzes,
    ));
  }

  void goAgain(context) {
    emit(
      QuizInitial(indexQuiz: 0, score: 0, lengthQuizzes: state.lengthQuizzes),
    );

    Navigator.of(context).pushReplacementNamed('/');
  }
}
