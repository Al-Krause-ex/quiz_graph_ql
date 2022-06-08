import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_graph_ql/const/images_path.dart';

import '../../data/models/quiz.dart';
import '../../data/services/graph_ql_service.dart';
import '../../domain/quiz_cubit.dart';
import '../widgets/custom_elevated_button.dart';

class TestScreen extends StatelessWidget {
  TestScreen({Key? key}) : super(key: key);

  final _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Query(
          options: QueryOptions(
            document: gql(GraphQlServiceTool.allQuizzesWithOptions),
          ),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Center(
                child: Column(
                  children: [
                    Image.asset(
                      kImgError,
                      height: MediaQuery.of(context).size.height - 430.0,
                    ),
                    const SizedBox(height: 30.0),
                    const Text(
                      'Упс. Возникли проблемы...',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (result.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final quizzesJson = result.data?['quizzes'];
            List<Quiz> quizzes = [];

            for (var quizJson in quizzesJson) {
              quizzes.add(Quiz.fromJson(quizJson));
            }

            var providerCub = BlocProvider.of<QuizCubit>(context);

            return BlocBuilder<QuizCubit, QuizState>(
              builder: (context, state) {
                print(state);
                return Stack(
                  children: [
                    Positioned(
                      top: 140.0,
                      right: 20.0,
                      child: Image.asset(kImgLamp, height: 70.0),
                    ),
                    Positioned(
                      bottom: 10.0,
                      right: 130.0,
                      child: Image.asset(kImgScience, height: 80.0),
                    ),
                    Positioned(
                      top: 285.0,
                      left: 20.0,
                      child: Image.asset(kImgMath, height: 60.0),
                    ),
                    Positioned(
                      top: 270.0,
                      right: 30.0,
                      child: Image.asset(kImgQuestion, height: 60.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 5.0),
                            Text(
                              '${state.indexQuiz + 1}/${quizzes.length}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.0,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            LinearProgressIndicator(
                              value: (state.indexQuiz + 1) / quizzes.length,
                              minHeight: 10.0,
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              quizzes[state.indexQuiz].quest,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                  color: Colors.blueAccent),
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              height: 130,
                              width: 130,
                              child: CountDownProgressIndicator(
                                controller: _controller,
                                valueColor: Colors.red,
                                backgroundColor: Colors.blue,
                                initialPosition: 0,
                                duration: 20,
                                timeTextStyle: const TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                                strokeWidth: 14.0,
                                onComplete: () {
                                  providerCub.chosenAnswer(
                                    context,
                                    currQuiz: quizzes[state.indexQuiz],
                                    chosenOptionId: null,
                                    lengthQuizzes: quizzes.length,
                                    controller: _controller,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            SizedBox(
                              height: 340.0,
                              child: Center(
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    mainAxisExtent: 150,
                                  ),
                                  itemBuilder: (ctx, k) => CustomElevatedButton(
                                    width: double.infinity,
                                    onPressed: () {
                                      providerCub.chosenAnswer(
                                        context,
                                        currQuiz: quizzes[state.indexQuiz],
                                        chosenOptionId: quizzes[state.indexQuiz]
                                            .options[k]
                                            .id,
                                        lengthQuizzes: quizzes.length,
                                        controller: _controller,
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.blue,
                                        Colors.red.shade300,
                                      ],
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        quizzes[state.indexQuiz]
                                            .options[k]
                                            .text,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount:
                                      quizzes[state.indexQuiz].options.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
