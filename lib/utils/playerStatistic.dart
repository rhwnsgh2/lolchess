import 'package:lolchess/model/playerStatus.dart';

class PlayerStatistic {
  PlayerStatus playerStatus;
  Average average = Average();
  PlayerStatistic({required this.playerStatus}) {
    int totalDamage = 0;
    List<Matches>? matches = playerStatus.matches?.sublist(0, 50);
    int matchCount = matches?.length as int;
    matches?.forEach((element) {
      int damage = element.info?.totalDamageToPlayers as int;
      totalDamage = totalDamage + damage;
    });
    print(totalDamage);
    print(matchCount);
    average.setDamage(toAverage(totalDamage, matchCount));
    print(average.damage);
  }

  double toAverage(num i, num count) {
    return i / count;
  }
}

class Average {
  double? damage;
  Average({double damage = 0.0});

  setDamage(double damage) {
    this.damage = damage;
  }
}
