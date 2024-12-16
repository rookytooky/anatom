import 'package:flutter/material.dart';
import 'package:flutter_application_1/RatingPage.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'image_swap_page.dart';
import 'sections_page.dart';

String language = 'EN';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق تعليم جسم الإنسان',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
          primary: Colors.teal,
          onPrimary: Colors.white,
          secondary: Colors.orangeAccent,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
          titleLarge: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal),
          headlineSmall: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.orangeAccent),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 10,
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          shadowColor: Colors.black.withOpacity(0.3),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => HomePage(
            userName:
                ModalRoute.of(context)?.settings.arguments as String? ?? 'ضيف'),
        '/imageSwap': (context) => const ImageSwapPage(),
        '/Sectionspage': (context) => const SectionsPage(),
        '/ratingPage': (context) => const RatingPage(),
      },
    );
  }
}
