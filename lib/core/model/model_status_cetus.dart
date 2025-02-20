class ModelStatusCetus {
  String? id;
  DateTime? activation;
  DateTime? expiry;
  String? startString;
  bool? active;
  bool? isDay;
  String? state;
  String? timeLeft;
  bool? isCetus;
  String? shortString;

  ModelStatusCetus({
    this.id,
    this.activation,
    this.expiry,
    this.startString,
    this.active,
    this.isDay,
    this.state,
    this.timeLeft,
    this.isCetus,
    this.shortString,
  });

  factory ModelStatusCetus.fromJson(Map<String, dynamic> json) {
    return ModelStatusCetus(
      id: json['id'],
      activation: json['activation'] != null ? DateTime.parse(json['activation']) : null,
      expiry: json['expiry'] != null ? DateTime.parse(json['expiry']) : null,
      startString: json['startString'],
      active: json['active'],
      isDay: json['isDay'],
      state: json['state'],
      timeLeft: json['timeLeft'],
      isCetus: json['isCetus'],
      shortString: json['shortString'],
    );
  }
}
