import 'package:flutter/material.dart';
import 'package:r_p_s_game/screens/gamepage.dart';
import 'package:r_p_s_game/screens/home.dart';
import 'package:r_p_s_game/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      // home: const Home(),
      routes: {
        "/": (context) => Home(),
        Routes.homeRoute:(context) => Home(),
        Routes.gamepageRoutes:(context) => GamePage(),
      },
    );
  }
}

