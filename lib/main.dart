import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lolchess/screens/searchScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'TFT INFO', home: SearchBox());
  }
}
