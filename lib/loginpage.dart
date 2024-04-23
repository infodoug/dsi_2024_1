import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'listusers.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginemailController = TextEditingController();
  final TextEditingController _loginsenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
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
                      Image.asset('assets/images/logo.png'),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _loginemailController,
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Digite seu e-mail";
                          }
                          if (value.isNotEmpty) {
                            if (value.length < 5) {
                              return "Digite um e-mail válido";
                            }
                          }
                          if (!value.contains("@")) {
                            return "Digite um e-mail válido";
                          }
                          if (!users.any((user) =>
                              user.email == _loginemailController.text)) {
                            return "E-mail não cadastrado";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                          controller: _loginsenhaController,
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
                                    : const Icon(
                                        Icons.visibility_off_outlined)),
                          ),
                          obscureText: _isobscured,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Digite sua senha";
                            }
                            if (value.length < 6) {
                              return "Senha incorreta";
                            }
                            dynamic _usuarioEncontrado = users.firstWhereOrNull(
                                (user) =>
                                    user.email == _loginemailController.text);
                            if (_usuarioEncontrado.senha ==
                                _loginsenhaController.text) {
                            } else {
                              return "Senha incorreta";
                            }
                            return null;
                          }),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Color(0xFF6EB855),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF28730E),
                          ),
                          foregroundColor: MaterialStatePropertyAll(
                            Colors.white,
                          ),
                        ),
                        child: const Text('Entrar'),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/google.svg',
                          height: 20,
                          width: 20,
                        ),
                        label: const Text(
                          'Login com o Google',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home');
    }
  }
}
