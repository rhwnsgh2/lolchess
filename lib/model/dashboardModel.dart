import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lolchess/model/companion.dart';
import 'package:lolchess/model/playerStatus.dart';
import 'package:lolchess/model/serachResultModel.dart';
import 'package:lolchess/utils/playerStatistic.dart';

class DashBoardModel {
  late String region, name;
  late PlayerStatus playerStatus;
  late ClipRRect profileImage;
  late Companion companion;
  late PlayerInfo playerInfo;
  late List<Matches> matches;
  Future<DashBoardModel> loadAll(region, name) async {
    this.playerStatus =
        await SearchResultScreenModel().playerStatus(region, name);
    List<Companion> companions = await _loadCompanionAsset();

    playerInfo = playerStatus.playerInfo as PlayerInfo;
    Info lastMatchInfo = playerStatus.matches?[0].info as Info;
    this.companion = companions.firstWhere(
        (element) => element.contentId == lastMatchInfo.companionId);
    this.profileImage = getProfileImage();
    this.matches = playerStatus.matches as List<Matches>;
    return this;
    // this.companionImage = getCompanionImage(lastMatchInfo.companionId as String );
  }

  Future<List<Companion>> _loadCompanionAsset() async {
    String jsonString =
        await rootBundle.loadString('assets/json/companion.json');
    final jsonResponse = json.decode(jsonString);
    List<Companion> companions = [];
    if (jsonResponse is List) {
      jsonResponse.forEach((element) {
        companions.add(Companion.fromJson(element));
      });
    }
    return companions;
  }

  ClipRRect getProfileImage() {
    String src = companion.loadoutsIcon.toLowerCase();
    //Image image = Image.network(src);
    ExtendedImage image = ExtendedImage.network(
      src,
      scale: 2,
      fit: BoxFit.none,
    );
    ClipRRect clipRRect =
        ClipRRect(borderRadius: BorderRadius.circular(20.0), child: image);

    return clipRRect;
  }
}
