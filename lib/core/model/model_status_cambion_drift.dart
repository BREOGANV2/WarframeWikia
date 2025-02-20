class ModelStatusDeimos {
    String id;
    String expiry;
    String activation;
    String state;
    String active;
    String timeLeft;

    ModelStatusDeimos({
        required this.id,
        required this.expiry,
        required this.activation,
        required this.state,
        required this.active,
        required this.timeLeft,
    });

     factory ModelStatusDeimos.fromJson(Map<String, dynamic> json) {
    return ModelStatusDeimos(
      id: json['id'] ?? '',
      expiry: json['expiry'] ?? '',
      activation: json['activation'] ?? '',
      state: json['state'] ?? '',
      active: json['active'] ?? '',
      timeLeft: json['timeLeft'] ?? '',
    );
  }

}
