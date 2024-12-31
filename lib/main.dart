import 'package:flutter/material.dart';
import 'package:flutter_dbstech_course/base/Widgets/bottom_nav.dart';

void main() {
  runApp(const MyApp());

  int x = 12;
  x == 10 ? print("He is a kid") : print("He is not a kid");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
