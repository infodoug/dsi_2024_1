import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Login(title: 'Flutter Demo Home Page'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF28730E),
            Color(0xFF6EB855),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: const Center(child: LoginBox()),
      ),
    );
  }
}

class LoginBox extends StatefulWidget {
  const LoginBox({super.key});

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  bool buttonclicked = false;
  @override
  Widget build(BuildContext context) {
    return (!buttonclicked)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonclicked = true;
                      });
                    },
                    child: const Text('Try Login with Google'))
              ],
            ),
          )
        : Container(
            color: Colors.white,
            height: 100,
            width: 80,
          );
  }
}
