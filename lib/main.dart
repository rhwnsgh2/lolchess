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
    return MaterialApp(
      title: 'TFT INFO',
      home: SearchScreen(),
      theme: ThemeData(
          textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black, fontSize: 30),
        bodyMedium:
            TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
        bodySmall:
            TextStyle(color: Color.fromARGB(255, 104, 104, 104), fontSize: 15),
        labelMedium:
            TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
      )),
    );
  }
}
