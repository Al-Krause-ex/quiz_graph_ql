import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:quiz_graph_ql/presentation/screens/finish_screen.dart';
import 'package:quiz_graph_ql/presentation/screens/quizzes_screen.dart';

import 'data/graph_ql_object.dart';
import 'domain/quiz_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(GraphQLProvider(
    client: graphQlObject.client,
    child: CacheProvider(
      child: MyApp(quizCubit: QuizCubit()),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final QuizCubit quizCubit;

  const MyApp({Key? key, required this.quizCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => BlocProvider.value(
              value: quizCubit,
              child: TestScreen(),
            ),
        FinishScreen.routeName: (ctx) => BlocProvider.value(
              value: quizCubit,
              child: const FinishScreen(),
            ),
      },
    );
  }
}
