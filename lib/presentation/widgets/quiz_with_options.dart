import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../data/models/quiz.dart';
import 'custom_elevated_button.dart';

class QuizWithOptions extends StatefulWidget {
  final Quiz quiz;

  const QuizWithOptions({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizWithOptionsState createState() => _QuizWithOptionsState();
}

class _QuizWithOptionsState extends State<QuizWithOptions> {
  final _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.quiz.quest,
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
              print('end');
            },
          ),
        ),
        const SizedBox(height: 30.0),
        SizedBox(
          height: 340.0,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 290,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (ctx, k) => CustomElevatedButton(
              width: double.infinity,
              onPressed: () {},
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red.shade300,
                ],
              ),
              child: Text(
                widget.quiz.options[k].text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
            ),
            itemCount: widget.quiz.options.length,
          ),
        ),
      ],
    );
  }
}
