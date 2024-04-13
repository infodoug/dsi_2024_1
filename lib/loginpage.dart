import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.5,
        widthFactor: 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: CamposLogin(),
          ),
        ));
  }
}

class CamposLogin extends StatefulWidget {
  const CamposLogin({super.key});

  @override
  State<CamposLogin> createState() => _CamposLoginState();
}

class _CamposLoginState extends State<CamposLogin> {
  var _isobscured = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'E-mail',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        prefixIcon: const Icon(Icons.lock),
                        border: const UnderlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isobscured = !_isobscured;
                              });
                            },
                            icon: (_isobscured)
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.visibility_off_outlined)),
                      ),
                      obscureText: _isobscured,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xFF6EB855),
                        ),
                        foregroundColor: MaterialStatePropertyAll(
                          Colors.white,
                        ),
                      ),
                      child: const Text('Entrar'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
