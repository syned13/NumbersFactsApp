import 'package:flutter/material.dart';
import 'package:numbers_facts_app/src/ui/home_screen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Numbers Facts App',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          secondaryHeaderColor: Colors.grey
        ),
        home: HomeScreen()
    );
  }
}