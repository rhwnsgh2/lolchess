class PlayerStatus {
  List<Matches>? matches;
  PlayerInfo? playerInfo;
  List<List<dynamic>>? rankHistory;
  SeasonStats? seasonStats;
  QueueSeasonStats? queueSeasonStats;

  PlayerStatus(
      {this.matches,
      this.playerInfo,
      this.rankHistory,
      this.seasonStats,
      this.queueSeasonStats});

  PlayerStatus.fromJson(Map<String, dynamic> json) {
    matches = json["matches"] == null
        ? null
        : (json["matches"] as List).map((e) => Matches.fromJson(e)).toList();
    playerInfo = json["playerInfo"] == null
        ? null
        : PlayerInfo.fromJson(json["playerInfo"]);
    rankHistory = json["rankHistory"] == null
        ? null
        : List<List<dynamic>>.from(json["rankHistory"]);
    seasonStats = json["seasonStats"] == null
        ? null
        : SeasonStats.fromJson(json["seasonStats"]);
    queueSeasonStats = json["queueSeasonStats"] == null
        ? null
        : QueueSeasonStats.fromJson(json["queueSeasonStats"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (matches != null)
      data["matches"] = matches?.map((e) => e.toJson()).toList();
    if (playerInfo != null) data["playerInfo"] = playerInfo?.toJson();
    if (rankHistory != null) data["rankHistory"] = rankHistory;
    if (seasonStats != null) data["seasonStats"] = seasonStats?.toJson();
    if (queueSeasonStats != null)
      data["queueSeasonStats"] = queueSeasonStats?.toJson();
    return data;
  }
}

class QueueSeasonStats {
  String? season;
  int? games;
  double? avgPlace;
  int? top4;
  int? win;
  String? topCarry;
  String? lastMatchId;

  QueueSeasonStats(
      {this.season,
      this.games,
      this.avgPlace,
      this.top4,
      this.win,
      this.topCarry,
      this.lastMatchId});

  QueueSeasonStats.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      this.season = key;
      Map<String, dynamic> seasonStats = Map<String, dynamic>.from(value);
      this.games = seasonStats["games"];
      this.avgPlace = seasonStats["avgPlace"];
      this.top4 = seasonStats["top4"];
      this.win = seasonStats["win"];
      this.topCarry = seasonStats["topCarry"];
      this.lastMatchId = seasonStats["lastMatchId"];
    });
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["season"] = season;
    data["games"] = games;
    data["avgPlace"] = avgPlace;
    data["top4"] = top4;
    data["win"] = win;
    data["topCarry"] = topCarry;
    data["lastMatchId"] = lastMatchId;
    return data;
  }
}

class SeasonStats {
  int? games;
  double? avgPlace;
  int? top4;
  int? win;
  String? topCarry;
  String? lastMatchId;

  SeasonStats(
      {this.games,
      this.avgPlace,
      this.top4,
      this.win,
      this.topCarry,
      this.lastMatchId});

  SeasonStats.fromJson(Map<String, dynamic> json) {
    games = json["games"];
    avgPlace = json["avgPlace"];
    top4 = json["top4"];
    win = json["win"];
    topCarry = json["topCarry"];
    lastMatchId = json["lastMatchId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["games"] = games;
    data["avgPlace"] = avgPlace;
    data["top4"] = top4;
    data["win"] = win;
    data["topCarry"] = topCarry;
    data["lastMatchId"] = lastMatchId;
    return data;
  }
}

class PlayerInfo {
  String? tier;
  String? rank;
  int? leaguePoints;
  int? profileIconId;
  String? name;
  String? region;
  List<dynamic>? localRank;
  List<dynamic>? globalRank;
  List<dynamic>? hyperrollLeague;

  PlayerInfo(
      {this.tier,
      this.rank,
      this.leaguePoints,
      this.profileIconId,
      this.name,
      this.region,
      this.localRank,
      this.globalRank,
      this.hyperrollLeague});

  PlayerInfo.fromJson(Map<String, dynamic> json) {
    tier = json["tier"];
    rank = json["rank"];
    leaguePoints = json["leaguePoints"];
    profileIconId = json["profileIconId"];
    name = json["name"];
    region = json["region"];
    localRank = json["localRank"] == null
        ? null
        : List<dynamic>.from(json["localRank"]);
    globalRank = json["globalRank"] == null
        ? null
        : List<dynamic>.from(json["globalRank"]);
    hyperrollLeague = json["hyperrollLeague"] == null
        ? null
        : List<dynamic>.from(json["hyperrollLeague"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["tier"] = tier;
    data["rank"] = rank;
    data["leaguePoints"] = leaguePoints;
    data["profileIconId"] = profileIconId;
    data["name"] = name;
    data["region"] = region;
    if (localRank != null) data["localRank"] = localRank;
    if (globalRank != null) data["globalRank"] = globalRank;
    if (hyperrollLeague != null) data["hyperrollLeague"] = hyperrollLeague;
    return data;
  }
}

class Matches {
  String? id;
  int? dateTime;
  double? duration;
  int? patch;
  int? queueId;
  Info? info;
  List<List<dynamic>>? rankChange;
  Ratings? ratings;

  Matches(
      {this.id,
      this.dateTime,
      this.duration,
      this.patch,
      this.queueId,
      this.info,
      this.rankChange,
      this.ratings});

  Matches.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    dateTime = json["dateTime"];
    duration = json["duration"];
    patch = json["patch"];
    queueId = json["queueId"];
    info = json["info"] == null ? null : Info.fromJson(json["info"]);
    rankChange = json["rankChange"] == null
        ? null
        : List<List<dynamic>>.from(json["rankChange"]);
    ratings =
        json["ratings"] == null ? null : Ratings.fromJson(json["ratings"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["dateTime"] = dateTime;
    data["duration"] = duration;
    data["patch"] = patch;
    data["queueId"] = queueId;
    if (info != null) data["info"] = info?.toJson();
    if (rankChange != null) data["rankChange"] = rankChange;
    if (ratings != null) data["ratings"] = ratings?.toJson();
    return data;
  }
}

class Ratings {
  double? meta;
  double? econ;
  double? items;
  double? contestedRatio;
  double? contestedRatio2;
  List<TopItems>? topItems;
  List<int>? contested;
  List<List<dynamic>>? contested2;

  Ratings(
      {this.meta,
      this.econ,
      this.items,
      this.contestedRatio,
      this.contestedRatio2,
      this.topItems,
      this.contested,
      this.contested2});

  Ratings.fromJson(Map<String, dynamic> json) {
    meta = json["meta"];
    econ = json["econ"];
    items = json["items"];
    contestedRatio = json["contestedRatio"] + 0.0;
    contestedRatio2 = json["contestedRatio2"] + 0.0;
    topItems = json["topItems"] == null
        ? null
        : (json["topItems"] as List).map((e) => TopItems.fromJson(e)).toList();
    contested =
        json["contested"] == null ? null : List<int>.from(json["contested"]);
    contested2 = json["contested2"] == null
        ? null
        : List<List<dynamic>>.from(json["contested2"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["meta"] = meta;
    data["econ"] = econ;
    data["items"] = items;
    data["contestedRatio"] = contestedRatio;
    data["contestedRatio2"] = contestedRatio2;
    if (topItems != null)
      data["topItems"] = topItems?.map((e) => e.toJson()).toList();
    if (contested != null) data["contested"] = contested;
    if (contested2 != null) data["contested2"] = contested2;
    return data;
  }
}

class TopItems {
  String? unit;
  int? item;
  double? delta;

  TopItems({this.unit, this.item, this.delta});

  TopItems.fromJson(Map<String, dynamic> json) {
    unit = json["unit"];
    item = json["item"];
    delta = json["delta"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["unit"] = unit;
    data["item"] = item;
    data["delta"] = delta;
    return data;
  }
}

class Info {
  String? name;
  String? companionId;
  int? lastRound;
  int? level;
  int? placement;
  int? playersEliminated;
  int? totalDamageToPlayers;
  List<Traits>? traits;
  List<Units>? units;

  Info(
      {this.name,
      this.companionId,
      this.lastRound,
      this.level,
      this.placement,
      this.playersEliminated,
      this.totalDamageToPlayers,
      this.traits,
      this.units});

  Info.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    companionId = json["companionId"];
    lastRound = json["lastRound"];
    level = json["level"];
    placement = json["placement"];
    playersEliminated = json["playersEliminated"];
    totalDamageToPlayers = json["totalDamageToPlayers"];
    traits = json["traits"] == null
        ? null
        : (json["traits"] as List).map((e) => Traits.fromJson(e)).toList();
    units = json["units"] == null
        ? null
        : (json["units"] as List).map((e) => Units.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = name;
    data["companionId"] = companionId;
    data["lastRound"] = lastRound;
    data["level"] = level;
    data["placement"] = placement;
    data["playersEliminated"] = playersEliminated;
    data["totalDamageToPlayers"] = totalDamageToPlayers;
    if (traits != null)
      data["traits"] = traits?.map((e) => e.toJson()).toList();
    if (units != null) data["units"] = units?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Units {
  String? id;
  List<dynamic>? items;
  int? rarity;
  int? tier;

  Units({this.id, this.items, this.rarity, this.tier});

  Units.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    items = json["items"] ?? [];
    rarity = json["rarity"];
    tier = json["tier"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    if (items != null) data["items"] = items;
    data["rarity"] = rarity;
    data["tier"] = tier;
    return data;
  }
}

class Traits {
  String? name;
  int? numUnits;
  int? currentTier;

  Traits({this.name, this.numUnits, this.currentTier});

  Traits.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    numUnits = json["numUnits"];
    currentTier = json["currentTier"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = name;
    data["numUnits"] = numUnits;
    data["currentTier"] = currentTier;
    return data;
  }
}
