import 'package:flutter/material.dart';
import 'screens/counter_navigation_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Module 13 Assignment',
      home: CounterNavigationApp(),
    );
  }
}