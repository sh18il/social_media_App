import 'package:flutter/material.dart';
import 'package:social_media/service/servise_register.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                ServiceRegister().changePassword(passwordController.text);
              },
              child: const Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
