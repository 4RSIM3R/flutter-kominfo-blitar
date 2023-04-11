import 'package:flutter/material.dart';
import 'package:flutter_training/model/example_model.dart';

class SubmitAttendancePage extends StatelessWidget {
  const SubmitAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text(args),
            ),
          ),
        ],
      ),
    );
  }
}
