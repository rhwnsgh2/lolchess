import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lolchess/model/dashboardModel.dart';
import 'package:lolchess/model/playerStatus.dart';
import 'package:lolchess/model/serachResultModel.dart';
import 'package:lolchess/screens/dashboard/widgets/profileWidget.dart';
import 'package:lolchess/screens/dashboard/widgets/recentMatch.dart';
import 'package:lolchess/utils/playerStatistic.dart';

import '../../widgets/searchWidget.dart';

class DashBoardScreen extends StatefulWidget {
  String region, name;
  DashBoardScreen({Key? key, required this.region, required this.name})
      : super(key: key);

  @override
  DashBoardScreenState createState() =>
      DashBoardScreenState(region: region, name: name);
}

class DashBoardScreenState extends State<DashBoardScreen> {
  String region, name;
  final _viewModel = DashBoardModel();
  late Future<DashBoardModel> dashBoardModel;
  @override
  void initState() {
    super.initState();
    dashBoardModel = _viewModel.loadAll(region, name);
  }

  DashBoardScreenState({required this.region, required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DashBoardModel>(
          future: dashBoardModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DashBoardModel model = snapshot.data as DashBoardModel;
              return Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 245, 245, 245)),
                child: Column(children: [
                  SearchBox(),
                  Expanded(
                    flex: 1,
                    child: ProfileWidget(model: model),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: RecentMatch(
                            model: model,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text("testsadasdasdasdsadsad"),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text("test"),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text("test"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text("TEST"),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Text("TEST"),
                        )),
                        Expanded(
                          child: Container(
                            child: Text("TEST"),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("에러");
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
