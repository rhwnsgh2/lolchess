import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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

class SearchBoxState extends State<SearchBox> {
  final TextEditingController _textController = TextEditingController();

  BoxDecoration searchBoxDecoration() {
    return BoxDecoration(border: Border.all(width: 1, color: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
                  )),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  GetHttp().getPlayerStats("kr", _textController.text);
                  print(_textController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatefulWidget {
  @override
  SearchBoxState createState() => SearchBoxState();
}

class GetHttp {
  String url = "https://legendsapi.com/player-stats-all/";

  getPlayerStats(String region, String name) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    Uri requestURL = Uri(
        scheme: 'https',
        host: 'legendsapi.com',
        path: 'player-stats-all/' + region + "/" + name + "/60/60");
    print(requestURL);
    var response = await http.get(requestURL, headers: headers);
    print(response.body);
  }
}
