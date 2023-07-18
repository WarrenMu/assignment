import 'package:flutter/material.dart';

import 'package:assignment/api.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Title(
            child: Text("H I"),
            color: Colors.cyan,
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlinedButton(onPressed: () async{
                await callApi();
              },
              child: Text("Testing API"),)
            ],
        ),
        ),
    )
    );
  }
}

