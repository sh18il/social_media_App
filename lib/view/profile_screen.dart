// import 'package:flutter/material.dart';
// import 'package:social_media/model/register_model.dart';
// import 'package:social_media/service/servise_register.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<UserModel?>(
//         future: ServiceRegister().getLogUser(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final UserModel? user = snapshot.data;
//             if (user != null) {
//               return ListTile(
//                 title: Text(user.username??''),
//                 subtitle: Text(user.email??''),
//                 // Add more contact details here if needed
//               );
//             } else {
//               return Center(child: Text('No user data available'));
//             }
//           }
//         },
//       ),
//     );
//   }
// }
// ignore_for_file: avoid_print


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:social_media/model/register_model.dart';
import 'package:social_media/service/servise_register.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: ServiceRegister().getLogUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final UserModel? user = snapshot.data;

          if (user != null) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                  user.username ?? 'Unknown User',
                  style: const TextStyle(fontSize: 22),
                ),
                actions: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: const Icon(Icons.menu_rounded,
                            color: Colors.black, size: 30),
                      );
                    },
                  )
                ],
              ),
              endDrawer: drawer(),
              body: DefaultTabController(
                length: 3,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Gap(20),
                            SizedBox(
                                height: 100,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(45),
                                    child: const CircleAvatar(
                                      minRadius: 40,
                                      backgroundColor: Colors.blueAccent,
                                    ))),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                blacktext(
                                    user.following!.length.toString(), 20),
                                greytext('Followers')
                              ],
                            ),
                            const SizedBox(width: 15),
                            Column(
                              children: [
                                blacktext(
                                    user.followers!.length.toString(), 20),
                                greytext('Following')
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 100)
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            print('User data is null');
            return const Text('User data is null');
          }
        }
      },
    );
  }
}

Drawer drawer() {
  var icons = [
    Icons.edit,
    Icons.password_outlined,
    Icons.settings,
    // CupertinoIcons.gift,
    // Icons.star,
    // CupertinoIcons.question_circle,
    // Icons.share,
    // Icons.settings
  ];
  var titletxt = [
    'Edit profile',
    'Change PassWord',
    'Settings',
    // 'Refer a friend',
    // 'wishlist',
    // 'Help',
    // 'Share my profile',
    // 'Settings'
  ];

  return Drawer(
    width: 280,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text('Settings', style: TextStyle(fontSize: 22)),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: titletxt.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(titletxt[index]),
                leading: Icon(
                  icons[index],
                  color: Colors.black,
                ),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    ),
  );
}

// void navigateToPage(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const SettingsPage()),
//       );
//       break;
//     case 1:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => PasswordChangeScreen()),
//       );
//       break;
//     case 2:
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const SettingsPage()),
//       );
//       break;
//   }
// }

Text blacktext(String txt, double? size) {
  return Text(
    txt,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: size, color: Colors.black),
  );
}

Text greytext(String txt) => Text(
      txt,
      style: const TextStyle(color: Colors.black54),
    );
