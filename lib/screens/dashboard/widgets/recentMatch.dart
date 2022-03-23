import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lolchess/model/dashboardModel.dart';
import 'package:lolchess/model/playerStatus.dart';

class RecentMatch extends StatelessWidget {
  DashBoardModel model;
  RecentMatch({Key? key, required this.model}) : super(key: key);

  bool matchIsNull() {
    if (model.playerStatus.matches != null) {
      return false;
    }
    return true;
  }

  Widget RecentMatchContainer() {
    if (matchIsNull()) {
      return Text("랭크 게임 기록이 없습니다.");
    } else {
      return MatchGradeCardContainer(
          matches: model.playerStatus.matches as List<Matches>);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Expanded(
            child: Container(child: Text("최근 랭크 20게임")),
          ),
          Expanded(
            flex: 2,
            child: RecentMatchContainer(),
          )
        ],
      ),
    );
  }
}

class MatchGradeCardContainer extends StatelessWidget {
  List<Matches> matches;
  MatchGradeCardContainer({Key? key, required this.matches}) : super(key: key);

  List<MatchGradeCard> cardList({int start = 0}) {
    List<MatchGradeCard> list = [];
    for (var i = start; i < 10 + start; i++) {
      if (matches[i].info == null) {
        break;
      } else {
        list.add(
            MatchGradeCard(grade: matches[i + start].info?.placement as int));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: cardList(),
          ),
        ),
        Expanded(
          child: Row(
            children: cardList(start: 10),
          ),
        )
      ],
    );
  }
}

class MatchGradeCard extends StatelessWidget {
  int grade;
  MatchGradeCard({Key? key, required this.grade}) : super(key: key);

  Color colorGrade() {
    Color returnValue;
    switch (grade) {
      case 1:
        returnValue = Colors.green;
        break;
      case 5:
      case 6:
      case 7:
      case 8:
        returnValue = Colors.grey;
        break;
      default:
        returnValue = Colors.blue;
    }
    return returnValue;
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      border: Border.all(width: 3, color: colorGrade()),
      borderRadius: BorderRadius.circular(8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
        decoration: decoration(),
        child: Center(
            child: Text(grade.toString(),
                style: TextStyle(
                  color: colorGrade(),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ))),
      ),
    );
  }
}
