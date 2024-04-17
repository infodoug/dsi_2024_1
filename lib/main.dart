import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'registrationpage.dart';
import 'homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthenticationPage(
              title: 'AuthPage',
            ),
        '/home': (context) => const HomePage(),
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
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF28730E)),
                ),
                onPressed: () {
                  showLoginCard();
                },
                child: const Text(
                  'Fazer login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  showRegistrationCard();
                },
                child: const Text(
                  'Não tem uma conta? Cadastre-se!',
                  style: TextStyle(color: Colors.white),
                ),
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
