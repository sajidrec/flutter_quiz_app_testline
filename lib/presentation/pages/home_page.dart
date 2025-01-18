import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_testline/presentation/widgets/app_exit_dialog_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          AppExitDialogWidget().showDialog(context);
        },
        child: Scaffold(
          body: Column(),
        ),
      ),
    );
  }
}
