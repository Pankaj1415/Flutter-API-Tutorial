import 'package:apitutorial/example_five.dart';
import 'package:apitutorial/example_four.dart';
import 'package:apitutorial/example_three.dart';
import 'package:apitutorial/example_two.dart';
import 'package:apitutorial/home_screen.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExampleFive(),
    );
  }
}

