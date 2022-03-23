import 'package:flutter/material.dart';
import 'package:lolchess/model/dashboardModel.dart';

class ProfileWidget extends StatefulWidget {
  DashBoardModel model;

  ProfileWidget({Key? key, required this.model}) : super(key: key);

  @override
  ProfileWidgetState createState() => ProfileWidgetState(model: model);
}

class ProfileWidgetState extends State<ProfileWidget> {
  DashBoardModel model;
  ProfileWidgetState({required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: model.profileImage,
                    ),
                    left: 10,
                    right: 10,
                    bottom: 10,
                    top: 10,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text(
                      ' ${model.playerInfo.region?.toUpperCase() as String} ',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Align(
                  child: Text(
                    model.playerInfo.name as String,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Align(
                  child: model.playerInfo.tier != null
                      ? Text(
                          '${model.playerInfo.tier} ${model.playerInfo.rank} ${model.playerInfo.leaguePoints.toString()}LP',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      : Text(
                          '랭크가 없습니다.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
