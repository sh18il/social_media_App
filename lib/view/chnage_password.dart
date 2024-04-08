import 'package:flutter/material.dart';
import 'package:social_media/service/servise_register.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                ServiceRegister().changePassword(passwordController.text);
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }
}
