import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'registrationpage.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'OpenSans',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthenticationPage(
              title: 'AuthPage',
            ), // Rota para a tela inicial
        '/home': (context) => const HomePage(), // Rota para a tela de detalhes
      },
    );
  }
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF28730E),
              Color(0xFF6EB855),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo-1.png'),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  showLoginCard();
                },
                child: const Text('Fazer login'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  showRegistrationCard();
                },
                child: const Text('Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showLoginCard() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: LoginPage(),
          );
        });
  }

  void showRegistrationCard() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(
            child: RegistrationPage(),
          );
        });
  }
}
