import 'package:flutnu/screens/cardspage.dart';
import 'package:flutter/material.dart';

void main() => runApp(FlutNuApp());

class FlutNuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.deepPurple.withAlpha(125)
      ),
      home: CardsPage(title: "FlutNu")
    );
  }
}
