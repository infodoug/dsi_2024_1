import 'package:flutter/material.dart';
import 'user.dart';
import 'listusers.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: 0.6,
        widthFactor: 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: CamposRegistration(),
          ),
        ));
  }
}

class CamposRegistration extends StatefulWidget {
  const CamposRegistration({super.key});

  @override
  State<CamposRegistration> createState() => _CamposRegistrationState();
}

class _CamposRegistrationState extends State<CamposRegistration> {
  var _isobscured = true;
  var _isobscuredconfirm = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _senhaconfirmController = TextEditingController();

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
                        height: 10,
                      ),
                      TextFormField(
                        controller: _nomeController,
                        decoration: const InputDecoration(
                          hintText: 'Nome',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Digite um nome válido";
                          }
                          if (value.length < 3) {
                            return "E-mail muito curto";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "E-mail não pode ser vazio";
                          }
                          if (value.isNotEmpty) {
                            if (value.length < 5) {
                              return "E-mail muito curto";
                            }
                          }
                          if (!value.contains("@")) {
                            return "E-mail inválido";
                          }
                          if (users.any((user) => user.email == value)) {
                            return "Este e-mail já foi cadastrado";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _senhaController,
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
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Senha não pode ficar vazia";
                          }
                          if (value.length < 6) {
                            return "A Senha precisa ter no mínimo 6 dígitos";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _senhaconfirmController,
                        decoration: InputDecoration(
                          hintText: 'Confirme sua senha',
                          prefixIcon: const Icon(Icons.lock),
                          border: const UnderlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isobscuredconfirm = !_isobscuredconfirm;
                                });
                              },
                              icon: (_isobscuredconfirm)
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.visibility_off_outlined)),
                        ),
                        obscureText: _isobscuredconfirm,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Confirmação de senha não pode ser vazia";
                          }
                          if (value != _senhaController.text) {
                            return "As senhas não coincidem";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final nome = _nomeController.text;
                          final email = _emailController.text;
                          final senha = _senhaController.text;
                          dynamic user =
                              User(nome: nome, email: email, senha: senha);
                          cadastrar(user);
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF6EB855),
                          ),
                          foregroundColor: MaterialStatePropertyAll(
                            Colors.white,
                          ),
                        ),
                        child: const Text('Criar conta'),
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
                          'Cadastre-se com o Google',
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

  void cadastrar(u) {
    if (_formKey.currentState!.validate()) {
      users.add(u);

      Future.delayed(const Duration(seconds: 1), () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Color(0xFF28730E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            content: Text(
              'Conta criada com sucesso!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      });
      Navigator.pushNamed(context, '/home');
    }
  }
}
