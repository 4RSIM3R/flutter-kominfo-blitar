import 'package:flutter/material.dart';
import 'package:flutter_training/pages/home_page.dart';
import 'package:flutter_training/pages/info/info_page.dart';
import 'package:flutter_training/pages/info/reactive_info_page.dart';
import 'package:flutter_training/pages/list_attendance_page.dart';
import 'package:flutter_training/pages/login_page.dart';
import 'package:flutter_training/pages/splash_page.dart';
import 'package:flutter_training/pages/submit_attendance_page.dart';

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
        '/': (context) => const SplashPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/info': (context) => ReactiveInfoPage(),
        '/list-attendance': (context) => ListAttendancePage(),
        '/submit-attendance': (context) => SubmitAttendancePage(),
      },
    );
  }
}
