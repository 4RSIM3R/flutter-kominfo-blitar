import 'package:flutter/material.dart';
import 'package:flutter_training/sources/session_source.dart';

class SplashPahe extends StatefulWidget {
  const SplashPahe({super.key});

  @override
  State<SplashPahe> createState() => _SplashPaheState();
}

class _SplashPaheState extends State<SplashPahe> {

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    final token = SessionSource().readToken();
    if (token != null) {
      // 
    } else {
      // 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}