import 'package:flutter/material.dart';
import 'package:practice/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch(backgroundColor: const Color(0xFFF4EDDB)),
        cardColor: const Color.fromARGB(255, 218, 41, 28),
      ),
      home: const HomeScreen(),
    );
  }
}
