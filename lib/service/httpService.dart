import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lolchess/model/playerStatus.dart';

class LegendsAPI {
  String url = "legendsapi.com";
  String scheme = "https";
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<PlayerStatus> getPlayerStats(String region, String name) async {
    Uri requestURL = Uri(
        scheme: scheme,
        host: url,
        path: 'player-stats-all/' + region + "/" + name + "/60/60");

    var response = await http.get(requestURL, headers: headers);
    var statusCode = response.statusCode;

    String responseBody = utf8.decode(response.bodyBytes);
    var json = jsonDecode(responseBody);
    if (statusCode == 200) {
      return PlayerStatus.fromJson(json);
    } else {
      return Future.error(json["detail"]);
    }
  }
}
