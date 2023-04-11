import 'package:flutter/material.dart';
import 'package:flutter_training/home_page.dart';
import 'package:flutter_training/list_attendance_page.dart';
import 'package:flutter_training/submit_attendance_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Training',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/list-attendance': (context) => ListAttendancePage(),
        '/submit-attendance': (context) => SubmitAttendancePage(),
      },
    );
  }
}
