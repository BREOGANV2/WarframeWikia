class ModelMisionesReliquias {
    String id;
    DateTime activation;
    DateTime expiry;
    String startString;
    bool active;
    String node;
    bool expired;
    String eta;
    String missionType;
    String missionKey;
    String tier;
    int tierNum;
    String enemy;
    String enemyKey;
    bool isStorm;
    bool isHard;

    ModelMisionesReliquias({
        required this.id,
        required this.activation,
        required this.expiry,
        required this.startString,
        required this.active,
        required this.node,
        required this.expired,
        required this.eta,
        required this.missionType,
        required this.missionKey,
        required this.tier,
        required this.tierNum,
        required this.enemy,
        required this.enemyKey,
        required this.isStorm,
        required this.isHard,
    });

factory ModelMisionesReliquias.fromMap(Map<String, dynamic> map) {
    return ModelMisionesReliquias(
        id: map['id'],
        activation: DateTime.parse(map['activation']),
        expiry: DateTime.parse(map['expiry']),
        startString: map['startString'],
        active: map['active'],
        node: map['node'],
        expired: map['expired'],
        eta: map['eta'],
        missionType: map['missionType'],
        missionKey: map['missionKey'],
        tier: map['tier'],
        tierNum: map['tierNum'],
        enemy: map['enemy'],
        enemyKey: map['enemyKey'],
        isStorm: map['isStorm'],
        isHard: map['isHard'],
    );
}


}
