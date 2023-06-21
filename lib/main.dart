import 'package:flutter/material.dart';
import 'package:navtoon/screens/home_screen.dart';
import 'package:navtoon/services/api_service.dart';

void main() {
  ApiService().getTodayWebtoons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
