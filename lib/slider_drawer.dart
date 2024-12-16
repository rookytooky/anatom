import 'package:flutter/material.dart';

// مكون قائمة الهامبرغر الجانبية
class SliderDrawer extends StatelessWidget {
  final Function(Locale)? setLocale;

  const SliderDrawer({super.key, this.setLocale});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 50, 84),
                  Color.fromARGB(255, 255, 33, 44)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              ' Main menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.orangeAccent,
            ),
            title: const Text(' Home page'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.orangeAccent,
            ),
            title: const Text(' Logout'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.orangeAccent,
            ),
            title: const Text('About the app '),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: '  Human Body Education App ',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(
                  Icons.info,
                  color: Colors.orangeAccent,
                ),
                children: [
                  const Text(
                      'This app helps children learn about the human body and its organs in an interactive and fun way.'),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.accessibility_new,
              color: Colors.orangeAccent,
            ),
            title: const Text('  Sections of the human body'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/Sectionspage');
            },
          ),
          // إضافة خيار التقييم هنا
          ListTile(
            leading: const Icon(
              Icons.star_rate,
              color: Colors.orangeAccent,
            ),
            title: const Text('Rate the app'),
            onTap: () {
              Navigator.pushNamed(context, '/ratingPage');
            },
          ),
        ],
      ),
    );
  }
}
