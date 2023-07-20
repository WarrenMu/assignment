import 'package:assignment/views/homepage.dart';
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
        title: 'Flutter Api Demo',
        theme: ThemeData(primarySwatch: Colors.cyan),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
    );
}}