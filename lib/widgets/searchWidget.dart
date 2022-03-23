import 'package:flutter/material.dart';
import 'package:lolchess/screens/dashboard/dashboardScreen.dart';

class SearchBoxState extends State<SearchBox> {
  final TextEditingController _textController = TextEditingController();
  BoxDecoration searchBoxDecoration() {
    return BoxDecoration(border: Border.all(width: 1, color: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: searchBoxDecoration(),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextField(
              textAlign: TextAlign.center,
              controller: _textController,
              decoration: const InputDecoration(
                hintText: "소환사 검색",
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
              )),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return DashBoardScreen(
                    region: 'kr', name: _textController.text);
              }));
            },
          ),
        ],
      ),
    );
  }
}

class SearchBox extends StatefulWidget {
  @override
  SearchBoxState createState() => SearchBoxState();
}
