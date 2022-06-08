class GraphQlServiceTool {
  static const allQuizzesWithOptions = r'''query Test {
  quizzes {
    id
    quest    
    correct_option_id
    options {
      id
      quiz_id
      text
    }
  }
}''';
}
