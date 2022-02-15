import 'package:lolchess/model/playerStatus.dart';
import 'package:lolchess/service/httpService.dart';

class SearchResultScreenModel {
  final _service = LegendsAPI();

  Future<PlayerStatus> playerStatus(String region, String name) {
    return _service.getPlayerStats(region, name);
  }
}
