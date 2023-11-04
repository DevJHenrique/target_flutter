import 'package:flutter/material.dart';
import 'package:target_flutter/src/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Material(
      child: Container(
        height: size.height,
        padding: const EdgeInsets.fromLTRB(64, 32, 64, 32),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1c4d5d),
              Color(0xFF31948b),
            ],
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4, left: 8),
                  child: Text(
                    'Usuário',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              TextFormField(
                validator: controller.userValidator(),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 32),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4, left: 8),
                  child: Text(
                    'Senha',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              TextFormField(
                obscureText: true,
                validator: controller.passwordValidator(),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 168,
                height: 40,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF44bd6e))),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, '/notes');
                    }
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: controller.openUrl,
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Política de Privacidade',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}