class ModelFortunaStatus {
    String? id;
    String? expiry;
    String? timeLeft;
    bool? isWarm;

    ModelFortunaStatus({
         this.id,
         this.expiry,
         this.timeLeft,
         this.isWarm,
    });

    
factory ModelFortunaStatus.fromJson(Map<String, dynamic> json) {
  return ModelFortunaStatus(
    id: json['id'] as String?,
    expiry: json['expiry'] as String?,
    timeLeft: json['timeLeft'] as String?,
    isWarm: json['isWarm'] as bool? ?? false, // Si es null, asigna false
  );
}


}
