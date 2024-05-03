// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:light_bottom_navigation_bar/light_bottom_navigation_bar.dart';
import 'package:social_media/view/home_screen.dart';
import 'package:social_media/view/profile_screen.dart';
import 'package:social_media/view/user_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var screensList = [
    const HomeScreen(),
    const Text('Search'),
    const UserPage(),
    const ProfilePage()
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: LightBottomNavigationBar(
        currentIndex: index,
        items: makeNavItems(),
        onSelected: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      body: Center(child: screensList[index]),
    );
  }

  List<LightBottomNavigationBarItem> makeNavItems() {
    return [
      const LightBottomNavigationBarItem(
        unSelectedIcon: Icons.home_outlined,
        selectedIcon: Icons.home_outlined,
        size: 30,
        backgroundShadowColor: Colors.red,
        borderBottomColor: Colors.red,
        borderBottomWidth: 3,
        splashColor: Colors.red,
        selectedIconColor: Colors.red,
        unSelectedIconColor: Colors.red,
      ),
      const LightBottomNavigationBarItem(
        unSelectedIcon: Icons.search_outlined,
        selectedIcon: Icons.search_outlined,
        size: 30,
        backgroundShadowColor: Colors.blue,
        borderBottomColor: Colors.blue,
        borderBottomWidth: 3,
        splashColor: Colors.blue,
        selectedIconColor: Colors.blue,
        unSelectedIconColor: Colors.blue,
      ),
      const LightBottomNavigationBarItem(
        unSelectedIcon: Icons.star_border_outlined,
        selectedIcon: Icons.star_border_outlined,
        size: 30,
        backgroundShadowColor: Colors.yellowAccent,
        borderBottomColor: Colors.yellowAccent,
        borderBottomWidth: 3,
        splashColor: Colors.yellowAccent,
        selectedIconColor: Colors.yellowAccent,
        unSelectedIconColor: Colors.yellowAccent,
      ),
      // const LightBottomNavigationBarItem(
      //   unSelectedIcon: Icons.done_outline_rounded,
      //   selectedIcon: Icons.done_outline_rounded,
      //   size: 30,
      //   backgroundShadowColor: Colors.green,
      //   borderBottomColor: Colors.green,
      //   borderBottomWidth: 3,
      //   splashColor: Colors.green,
      //   selectedIconColor: Colors.green,
      //   unSelectedIconColor: Colors.green,
      // ),
      const LightBottomNavigationBarItem(
        unSelectedIcon: Icons.person_outline,
        selectedIcon: Icons.person_outline,
        size: 30,
        backgroundShadowColor: Colors.purpleAccent,
        borderBottomColor: Colors.purpleAccent,
        borderBottomWidth: 3,
        splashColor: Colors.purpleAccent,
        selectedIconColor: Colors.purpleAccent,
        unSelectedIconColor: Colors.purpleAccent,
      ),
    ];
  }
}
