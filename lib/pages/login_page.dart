import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {},
                ),
                SizedBox(height: 16),
                TextFormField(
                  obscureText: obsecurePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurePassword = !obsecurePassword;
                        });
                      },
                      icon: Icon(obsecurePassword ? Icons.visibility : Icons.visibility_off),
                    ),
                    label: Text("Password"),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {},
                ),
                // Expanded(child: Container()),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Login"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
