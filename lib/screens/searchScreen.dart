import 'package:flutter/material.dart';
import 'package:lolchess/screens/dashboard/dashboardScreen.dart';
import 'package:lolchess/widgets/searchWidget.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SearchBox(),
      ),
    );
  }
}
