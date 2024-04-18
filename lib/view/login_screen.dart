import 'package:flutter/material.dart';
import 'package:social_media/model/register_model.dart';
import 'package:social_media/service/servise_register.dart';
import 'package:social_media/view/chnage_password.dart';
import 'package:social_media/view/home_screen.dart';
import 'package:social_media/view/register_screen.dart';
import 'package:social_media/view/widgets/bottom_nav.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailNameCntrl = TextEditingController();
    TextEditingController passwordCntl = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.red, Colors.blue],
        )),
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
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: emailNameCntrl,
                              decoration: InputDecoration(
                                  hintText: 'email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordCntl,
                              decoration: InputDecoration(
                                  hintText: 'password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChangePasswordScreen(),
                                    ),
                                  );
                                },
                                child: const Text('forgot password')),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  final status = await ServiceRegister().login(
                                      AuthModel(
                                          email: emailNameCntrl.text,
                                          password: passwordCntl.text,
                                          username: ''));
                                  if (status == 'success') {
                                    Navigator.pushReplacement( 
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNav(),
                                        ));
                                  } else {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  }
                                },
                                child: const Text('Login'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterScreen()));
                },
                child: const Text('Register'))
          ],
        ),
      ),
    );
  }
}
