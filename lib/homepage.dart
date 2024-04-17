import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF28730E),
        actions: [
          ElevatedButton.icon(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Color(0xFFF2B596),
              ),
              label: const Text(
                'Desconectar',
                style: TextStyle(color: Color(0xFFF2B596)),
              ))
        ],
      ),
    );
  }
}
