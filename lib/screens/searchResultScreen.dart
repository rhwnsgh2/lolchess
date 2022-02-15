import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lolchess/model/playerStatus.dart';
import 'package:lolchess/model/serachResultModel.dart';

class SearchResult extends StatefulWidget {
  String region, name;
  SearchResult({Key? key, required this.region, required this.name})
      : super(key: key);

  @override
  SearchResultState createState() =>
      SearchResultState(region: region, name: name);
}

class SearchResultState extends State<SearchResult> {
  final _viewModel = SearchResultScreenModel();
  String region, name;
  SearchResultState({required this.region, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<PlayerStatus>(
            future: _viewModel.playerStatus(region, name),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // var metaValue = snapshot.data?.matches.reduce(
                //     (value, element) => value + element.ratings.meta);
                print(snapshot.data?.matches?[0].ratings?.meta);
                print('this');

                return Text("데이터");
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("에러");
              } else {
                return Text("로딩중");
              }
            }));
  }
}
