import 'package:flutter/material.dart';
import 'package:flutter_training/sources/session_source.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    final token = SessionSource().readToken();
    if (token != null) {
      Navigator.pushNamed(context, '/home');
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          "https://visitblitar.com/uploads/imgpopup/WhatsApp_Image_2022-10-06_at_12_00_18_POP_UP.jpg",
          width: 400,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
