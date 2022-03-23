class Companion {
  late String contentId;
  late int itemId;
  late String name;
  late String loadoutsIcon;
  late String description;
  late int level;
  late String speciesName;
  late int speciesId;
  late String rarity;
  late int rarityValue;
  late bool isDefault;
  late List<String> upgrades;
  late bool tftOnly;

  Companion(
      {required this.contentId,
      required this.itemId,
      required this.name,
      required this.loadoutsIcon,
      required this.description,
      required this.level,
      required this.speciesName,
      required this.speciesId,
      required this.rarity,
      required this.rarityValue,
      required this.isDefault,
      required this.upgrades,
      required this.tftOnly});

  Companion.fromJson(Map<String, dynamic> json) {
    if (json["contentId"] is String) this.contentId = json["contentId"];
    if (json["itemId"] is int) this.itemId = json["itemId"];
    if (json["name"] is String) this.name = json["name"];
    if (json["loadoutsIcon"] is String)
      this.loadoutsIcon = json["loadoutsIcon"];
    if (json["description"] is String) this.description = json["description"];
    if (json["level"] is int) this.level = json["level"];
    if (json["speciesName"] is String) this.speciesName = json["speciesName"];
    if (json["speciesId"] is int) this.speciesId = json["speciesId"];
    if (json["rarity"] is String) this.rarity = json["rarity"];
    if (json["rarityValue"] is int) this.rarityValue = json["rarityValue"];
    if (json["isDefault"] is bool) this.isDefault = json["isDefault"];
    if (json["upgrades"] is List)
      this.upgrades = (json["upgrades"] == null
          ? null
          : List<String>.from(json["upgrades"]))!;
    if (json["TFTOnly"] is bool) this.tftOnly = json["TFTOnly"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["contentId"] = this.contentId;
    data["itemId"] = this.itemId;
    data["name"] = this.name;
    data["loadoutsIcon"] = this.loadoutsIcon;
    data["description"] = this.description;
    data["level"] = this.level;
    data["speciesName"] = this.speciesName;
    data["speciesId"] = this.speciesId;
    data["rarity"] = this.rarity;
    data["rarityValue"] = this.rarityValue;
    data["isDefault"] = this.isDefault;
    if (this.upgrades != null) data["upgrades"] = this.upgrades;
    data["TFTOnly"] = this.tftOnly;
    return data;
  }
}
