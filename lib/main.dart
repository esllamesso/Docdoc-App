import 'package:docdoc/presintation/screens/home_screens/home_screen.dart';
import 'package:docdoc/presintation/screens/profile_screens/profile_screen.dart';
import 'package:docdoc/presintation/screens/registration_screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/home',
      routes: {
        '/home': (_) => HomeScreen(),
        '/profile': (_) => ProfileScreen(),
      },

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
