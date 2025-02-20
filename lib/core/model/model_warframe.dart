class ModelWarframe {
  String? name;
  String? uniqueName;
  String? description;
  String? type;
  bool? tradable;
  String? category;
  String? productCategory;
  List<Component>? components;
  Introduced? introduced;
  int? shield;
  String? primePower;
  String? primeMr;
  int? primeArmor;
  String? speed;
  String? aura;
  String? primeUrl;
  int? primeHealth;
  int? power;
  String? primeAura;
  String? info;
  String? thumbnail;
  String? mr;
  int? primeShield;
  int? health;
  String? primeSpeed;
  String? url;
  String? regex;
  int? armor;
  String? location;
  String? primeConclave;

  ModelWarframe({
    this.name,
    this.uniqueName,
    this.description,
    this.type,
    this.tradable,
    this.category,
    this.productCategory,
    this.components,
    this.introduced,
    this.shield,
    this.primePower,
    this.primeMr,
    this.primeArmor,
    this.speed,
    this.aura,
    this.primeUrl,
    this.primeHealth,
    this.power,
    this.primeAura,
    this.info,
    this.thumbnail,
    this.mr,
    this.primeShield,
    this.health,
    this.primeSpeed,
    this.url,
    this.regex,
    this.armor,
    this.location,
    this.primeConclave,
  });

  factory ModelWarframe.fromJson(Map<String, dynamic> json) {
    return ModelWarframe(
      name: json['name'],
      uniqueName: json['uniqueName'],
      description: json['description'],
      type: json['type'],
      tradable: json['tradable'],
      category: json['category'],
      productCategory: json['productCategory'],
      components: json['components'] != null
          ? List<Component>.from(json['components'].map((x) => Component.fromJson(x)))
          : null,
      introduced: json['introduced'] != null ? Introduced.fromJson(json['introduced']) : null,
      shield: json['shield'],
      primePower: json['primePower'],
      primeMr: json['primeMr'],
      primeArmor: json['primeArmor'],
      speed: json['speed'],
      aura: json['aura'],
      primeUrl: json['primeUrl'],
      primeHealth: json['primeHealth'],
      power: json['power'],
      primeAura: json['primeAura'],
      info: json['info'],
      thumbnail: json['thumbnail'],
      mr: json['mr'],
      primeShield: json['primeShield'],
      health: json['health'],
      primeSpeed: json['primeSpeed'],
      url: json['url'],
      regex: json['regex'],
      armor: json['armor'],
      location: json['location'],
      primeConclave: json['primeConclave'],
    );
  }
}

class Component {
  String? name;
  String? uniqueName;
  String? description;
  String? type;
  bool? tradable;
  String? category;
  String? productCategory;

  Component({
    this.name,
    this.uniqueName,
    this.description,
    this.type,
    this.tradable,
    this.category,
    this.productCategory,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      name: json['name'],
      uniqueName: json['uniqueName'],
      description: json['description'],
      type: json['type'],
      tradable: json['tradable'],
      category: json['category'],
      productCategory: json['productCategory'],
    );
  }
}

class Introduced {
  DateTime? date;

  Introduced({
    this.date,
  });

  factory Introduced.fromJson(Map<String, dynamic> json) {
    return Introduced(
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }
}
