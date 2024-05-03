import 'package:flutter/material.dart';
import 'package:social_media/model/register_model.dart';
import 'package:social_media/model/user_model.dart';
import 'package:social_media/service/user_service.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: UserService().userData(),
            builder: (context, AsyncSnapshot<List<UserrModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Erorrr${snapshot.error}'),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    UserrModel data = snapshot.data![index];
                    return ListTile(
                      title: Text(data.username ?? ''),
                    );
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}
