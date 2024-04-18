import 'package:flutter/material.dart';
import 'package:social_media/model/register_model.dart';
import 'package:social_media/service/servise_register.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel?>(
        future: ServiceRegister().getLogUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final UserModel? user = snapshot.data;
            if (user != null) {
              return ListTile(
                title: Text(user.username??''),
                subtitle: Text(user.email??''),
                // Add more contact details here if needed
              );
            } else {
              return Center(child: Text('No user data available'));
            }
          }
        },
      ),
    );
  }
}