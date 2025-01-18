import 'package:flutter/material.dart';
import 'package:instagram_clone/screen/Main_screen.dart';
import 'package:instagram_clone/screen/home_screen.dart';
import 'package:instagram_clone/screen/logic_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}