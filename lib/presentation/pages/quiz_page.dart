import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/presentation/widgets/quiz_exit_dialog_widget.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          QuizExitDialogWidget().showDialog();
        },
        child: Scaffold(
          body: Text("Quiz Page"),
        ),
      ),
    );
  }
}
