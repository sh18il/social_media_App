import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/controller/register_controller.dart';
import 'package:social_media/view/login_screen.dart';
import 'package:social_media/view/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider(create: (context) => RegisterController(),)
        //   ],
        //   child:

        MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LoginScreen(),
      // ),
    );
  }
}
