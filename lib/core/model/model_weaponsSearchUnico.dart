class ModelWeapon {
  final String name;
  final String uniqueName;
  final String description;
  final String type;
  final bool tradable;
  final String category;
  final String productCategory;
  final int masteryReq;
  final int rivenDisposition;
  final List<String> polarities;
  final bool vaulted;
  final String marketCost;
  final String bpCost;
  final int slot;
  final double totalDamage;
  final int ammo;
  final int magazineSize;
  final double multishot;
  final int buildPrice;
  final int buildTime;
  final int skipBuildTimePrice;
  final int buildQuantity;
  final double criticalChance;
  final double criticalMultiplier;
  final double fireRate;

  ModelWeapon({
    required this.name,
    required this.uniqueName,
    required this.description,
    required this.type,
    required this.tradable,
    required this.category,
    required this.productCategory,
    required this.masteryReq,
    required this.rivenDisposition,
    required this.polarities,
    required this.vaulted,
    required this.marketCost,
    required this.bpCost,
    required this.slot,
    required this.totalDamage,
    required this.ammo,
    required this.magazineSize,
    required this.multishot,
    required this.buildPrice,
    required this.buildTime,
    required this.skipBuildTimePrice,
    required this.buildQuantity,
    required this.criticalChance,
    required this.criticalMultiplier,
    required this.fireRate,
  });

factory ModelWeapon.fromJson(Map<String, dynamic> json) {
  return ModelWeapon(
    name: json['name'] ?? 'Desconocido',
    uniqueName: json['uniqueName'] ?? '',
    description: json['description'] ?? '',
    type: json['type'] ?? '',
    tradable: json['tradable'] ?? false,
    category: json['category'] ?? '',
    productCategory: json['productCategory'] ?? '',
    masteryReq: json['masteryReq'] ?? 0,
    rivenDisposition: json['rivenDisposition'] ?? 0,
    polarities: List<String>.from(json['polarities'] ?? []),
    vaulted: json['vaulted'] ?? false,
    marketCost: (json['marketCost'] is int) ? json['marketCost'].toString() : json['marketCost'] ?? '',
    bpCost: (json['bpCost'] is int) ? json['bpCost'].toString() : json['bpCost'] ?? '',
    slot: json['slot'] ?? 0,
    totalDamage: (json['totalDamage'] is int)
    ? (json['totalDamage'] as int).toDouble()
    : (json['totalDamage'] is double)
        ? json['totalDamage'] as double
        : 0.0,

    ammo: json['ammo'] ?? 0,
    magazineSize: json['magazineSize'] ?? 0,
    multishot: (json['multishot'] ?? 0).toDouble(),
    buildPrice: json['buildPrice'] ?? 0,
    buildTime: json['buildTime'] ?? 0,
    skipBuildTimePrice: json['skipBuildTimePrice'] ?? 0,
    buildQuantity: json['buildQuantity'] ?? 0,
    criticalChance: (json['criticalChance'] ?? 0).toDouble(),
    criticalMultiplier: (json['criticalMultiplier'] ?? 0).toDouble(),
    fireRate: (json['fireRate'] ?? 0).toDouble(),
  );
}


}
