import 'package:flutter/material.dart';

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
                      const Text(
                        'Cadastro',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Nome',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
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
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
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
                        height: 10,
                      ),
                      TextFormField(
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cadastrar();
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
                      )
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

  cadastrar() {
    if (_formKey.currentState!.validate()) {
      print("válido");
    } else {
      print("não!");
    }
  }
}
