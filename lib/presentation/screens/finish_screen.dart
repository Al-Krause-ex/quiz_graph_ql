import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_graph_ql/const/images_path.dart';

import '../../domain/quiz_cubit.dart';
import '../widgets/custom_elevated_button.dart';

class FinishScreen extends StatelessWidget {
  static const routeName = '/finish';

  const FinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerCub = BlocProvider.of<QuizCubit>(context);

    return Scaffold(
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kImgIllustration,
                    height: MediaQuery.of(context).size.height - 330.0,
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Вы завершили викторину!',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'Ваши результаты: ${state.score}/${state.lengthQuizzes}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  CustomElevatedButton(
                    width: 180.0,
                    height: 60.0,
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.blue,
                      ],
                    ),
                    onPressed: () {
                      providerCub.goAgain(context);
                    },
                    child: const Text(
                      'Начать снова',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
