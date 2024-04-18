import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/controller/register_controller.dart';
import 'package:social_media/model/register_model.dart';
import 'package:social_media/service/servise_register.dart';
import 'package:social_media/view/login_screen.dart';

UserModel? messageModel;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.blue])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Card(
                  child: Form(
                    key: formkey,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                  hintText: 'userName',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: 'email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  hintText: 'password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    ServiceRegister _authServise =
                                        ServiceRegister();

                                    await _authServise
                                        .register(AuthModel(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            username: usernameController.text))
                                        .then((value) => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen())));
                                  } else {
                                    print('empty value');
                                  }
                                },
                                child: const Text('register'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
