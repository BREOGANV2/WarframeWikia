class ModelPlayer {
    AccountId accountId;
    AccountId displayName;
    int masteryRank;
    Loadout loadout;
    Intrinsics intrinsics;
    List<ChallengeProgress> challengeProgress;
    AccountId guildId;
    AccountId guildName;
    int guildTier;
    int guildXp;
    int guildClass;
    bool guildEmblem;
    AccountId allianceId;
    List<dynamic> deathMarks;
    bool harvestable;
    bool deathSquadable;
    AccountId created;
    bool migratedToConsole;
    List<Mission> missions;
    List<Syndicate> syndicate;
    Map<String, int> dailyStanding;
    int dailyFocus;
    bool unlockedOperator;
    bool unlockedAlignment;
    List<OperatorLoadout> operatorLoadouts;
    Alignment alignment;

    ModelPlayer({
        required this.accountId,
        required this.displayName,
        required this.masteryRank,
        required this.loadout,
        required this.intrinsics,
        required this.challengeProgress,
        required this.guildId,
        required this.guildName,
        required this.guildTier,
        required this.guildXp,
        required this.guildClass,
        required this.guildEmblem,
        required this.allianceId,
        required this.deathMarks,
        required this.harvestable,
        required this.deathSquadable,
        required this.created,
        required this.migratedToConsole,
        required this.missions,
        required this.syndicate,
        required this.dailyStanding,
        required this.dailyFocus,
        required this.unlockedOperator,
        required this.unlockedAlignment,
        required this.operatorLoadouts,
        required this.alignment,
    });

}

enum AccountId {
    STRING
}

class Alignment {
    int wisdom;
    int alignment;

    Alignment({
        required this.wisdom,
        required this.alignment,
    });

}

class ChallengeProgress {
    AccountId name;
    int progress;

    ChallengeProgress({
        required this.name,
        required this.progress,
    });

}

class Intrinsics {
    int railjack;
    int engineering;
    int gunnery;
    int piloting;
    int tactical;
    int command;
    int drifter;
    int riding;
    int combat;
    int opportunity;
    int endurance;

    Intrinsics({
        required this.railjack,
        required this.engineering,
        required this.gunnery,
        required this.piloting,
        required this.tactical,
        required this.command,
        required this.drifter,
        required this.riding,
        required this.combat,
        required this.opportunity,
        required this.endurance,
    });

}

class Loadout {
    List<Skin> weaponSkins;
    List<Suit> suits;
    List<Ary> secondary;
    List<Ary> primary;
    List<Melee> melee;
    List<XpInfo> xpInfo;

    Loadout({
        required this.weaponSkins,
        required this.suits,
        required this.secondary,
        required this.primary,
        required this.melee,
        required this.xpInfo,
    });

}

class Melee {
    AccountId itemId;
    AccountId uniqueName;
    AccountId name;
    AccountId nemesis;
    List<Config> configs;
    UpgradeFingerprint upgradeFingerprint;
    int features;
    int upgradeVer;
    int xp;
    int polarized;
    List<Polarity> polarity;
    MeleeItem item;

    Melee({
        required this.itemId,
        required this.uniqueName,
        required this.name,
        required this.nemesis,
        required this.configs,
        required this.upgradeFingerprint,
        required this.features,
        required this.upgradeVer,
        required this.xp,
        required this.polarized,
        required this.polarity,
        required this.item,
    });

}

class Config {
    List<Skin> skins;
    Color primaryColor;
    Color syandanaColor;

    Config({
        required this.skins,
        required this.primaryColor,
        required this.syandanaColor,
    });

}

class Color {
    SyandanaColorAccents primary;
    SyandanaColorAccents secondary;
    SyandanaColorAccents accents;
    SyandanaColorAccents tertiary;
    List<Emisssive> emisssive;
    List<Emisssive> energy;

    Color({
        required this.primary,
        required this.secondary,
        required this.accents,
        required this.tertiary,
        required this.emisssive,
        required this.energy,
    });

}

class SyandanaColorAccents {
    List<PurpleMatch> matches;
    AccountId hex;

    SyandanaColorAccents({
        required this.matches,
        required this.hex,
    });

}

class PurpleMatch {
    PaletteElement palette;
    PaletteElement position;

    PurpleMatch({
        required this.palette,
        required this.position,
    });

}

class PaletteElement {
    PaletteElement();
}

class Emisssive {
    List<PaletteElement> matches;
    AccountId hex;

    Emisssive({
        required this.matches,
        required this.hex,
    });

}

class Skin {
    AccountId uniqueName;
    ItemElement item;

    Skin({
        required this.uniqueName,
        required this.item,
    });

}

class ItemElement {
    AccountId name;
    AccountId uniqueName;
    AccountId description;
    AccountId type;
    bool tradable;
    AccountId category;
    AccountId productCategory;

    ItemElement({
        required this.name,
        required this.uniqueName,
        required this.description,
        required this.type,
        required this.tradable,
        required this.category,
        required this.productCategory,
    });

}

class MeleeItem {
    AccountId name;
    AccountId uniqueName;
    AccountId description;
    AccountId type;
    bool tradable;
    AccountId category;
    AccountId productCategory;
    List<Patchlog> patchlogs;
    List<ItemElement> components;
    Introduced introduced;
    DateTime estimatedVaultDate;
    AccountId url;
    int mr;
    int rivenDisposition;
    List<String> polarities;
    AccountId thumbnail;
    List<AccountId> tags;
    bool vaulted;
    AccountId marketCost;
    AccountId bpCost;
    List<Attack> attacks;
    int masteryReq;
    int buildPrice;
    int buildTime;
    int skipBuildTimePrice;
    int buildQuantity;
    bool consumeOnBuild;
    AccountId wikiaThumbnail;
    AccountId wikiaUrl;
    double criticalChance;
    double criticalMultiplier;
    int disposition;
    double fireRate;
    double omegaAttenuation;
    double procChance;
    double releaseDate;
    int slot;
    int totalDamage;
    DateTime vaultDate;
    int blockingAngle;
    int comboDuration;
    List<double> damagePerShot;
    double followThrough;
    int heavyAttackDamage;
    int heavySlamAttack;
    int heavySlamRadialDamage;
    int heavySlamRadius;
    double range;
    int slamAttack;
    int slamRadialDamage;
    int slamRadius;
    int slideAttack;
    String stancePolarity;
    double windUp;

    MeleeItem({
        required this.name,
        required this.uniqueName,
        required this.description,
        required this.type,
        required this.tradable,
        required this.category,
        required this.productCategory,
        required this.patchlogs,
        required this.components,
        required this.introduced,
        required this.estimatedVaultDate,
        required this.url,
        required this.mr,
        required this.rivenDisposition,
        required this.polarities,
        required this.thumbnail,
        required this.tags,
        required this.vaulted,
        required this.marketCost,
        required this.bpCost,
        required this.attacks,
        required this.masteryReq,
        required this.buildPrice,
        required this.buildTime,
        required this.skipBuildTimePrice,
        required this.buildQuantity,
        required this.consumeOnBuild,
        required this.wikiaThumbnail,
        required this.wikiaUrl,
        required this.criticalChance,
        required this.criticalMultiplier,
        required this.disposition,
        required this.fireRate,
        required this.omegaAttenuation,
        required this.procChance,
        required this.releaseDate,
        required this.slot,
        required this.totalDamage,
        required this.vaultDate,
        required this.blockingAngle,
        required this.comboDuration,
        required this.damagePerShot,
        required this.followThrough,
        required this.heavyAttackDamage,
        required this.heavySlamAttack,
        required this.heavySlamRadialDamage,
        required this.heavySlamRadius,
        required this.range,
        required this.slamAttack,
        required this.slamRadialDamage,
        required this.slamRadius,
        required this.slideAttack,
        required this.stancePolarity,
        required this.windUp,
    });

}

class Attack {
    AccountId name;
    double critChance;
    double critMult;
    double statusChance;
    double shotType;
    double shotSpeed;
    double duration;
    double radius;
    double speed;
    Pellet pellet;
    double chargeTime;
    double flight;
    Falloff falloff;
    Map<String, int> damage;
    AccountId slide;
    AccountId jump;
    AccountId wall;
    double channeling;
    Slam slam;

    Attack({
        required this.name,
        required this.critChance,
        required this.critMult,
        required this.statusChance,
        required this.shotType,
        required this.shotSpeed,
        required this.duration,
        required this.radius,
        required this.speed,
        required this.pellet,
        required this.chargeTime,
        required this.flight,
        required this.falloff,
        required this.damage,
        required this.slide,
        required this.jump,
        required this.wall,
        required this.channeling,
        required this.slam,
    });

}

class Falloff {
    double start;
    double end;
    double reduction;

    Falloff({
        required this.start,
        required this.end,
        required this.reduction,
    });

}

class Pellet {
    AccountId name;
    int count;

    Pellet({
        required this.name,
        required this.count,
    });

}

class Slam {
    double damage;
    Radial radial;

    Slam({
        required this.damage,
        required this.radial,
    });

}

class Radial {
    double damage;
    String element;
    double proc;
    double radius;

    Radial({
        required this.damage,
        required this.element,
        required this.proc,
        required this.radius,
    });

}

class Introduced {
    AccountId name;
    AccountId url;
    List<AccountId> aliases;
    AccountId parent;
    DateTime date;

    Introduced({
        required this.name,
        required this.url,
        required this.aliases,
        required this.parent,
        required this.date,
    });

}

class Patchlog {
    AccountId name;
    DateTime date;
    AccountId url;
    AccountId additions;
    AccountId changes;
    AccountId fixes;

    Patchlog({
        required this.name,
        required this.date,
        required this.url,
        required this.additions,
        required this.changes,
        required this.fixes,
    });

}

class Polarity {
    AccountId polarity;
    int slot;

    Polarity({
        required this.polarity,
        required this.slot,
    });

}

class UpgradeFingerprint {
    AccountId compat;
    List<Buff> buffs;

    UpgradeFingerprint({
        required this.compat,
        required this.buffs,
    });

}

class Buff {
    AccountId tag;
    AccountId value;

    Buff({
        required this.tag,
        required this.value,
    });

}

class Ary {
    AccountId itemId;
    AccountId uniqueName;
    AccountId name;
    AccountId nemesis;
    List<Config> configs;
    UpgradeFingerprint upgradeFingerprint;
    int features;
    int upgradeVer;
    int xp;
    int polarized;
    List<Polarity> polarity;
    PrimaryItem item;

    Ary({
        required this.itemId,
        required this.uniqueName,
        required this.name,
        required this.nemesis,
        required this.configs,
        required this.upgradeFingerprint,
        required this.features,
        required this.upgradeVer,
        required this.xp,
        required this.polarized,
        required this.polarity,
        required this.item,
    });

}

class PrimaryItem {
    AccountId name;
    AccountId uniqueName;
    AccountId description;
    AccountId type;
    bool tradable;
    AccountId category;
    AccountId productCategory;
    List<Patchlog> patchlogs;
    List<ItemElement> components;
    Introduced introduced;
    DateTime estimatedVaultDate;
    AccountId url;
    int mr;
    int rivenDisposition;
    List<String> polarities;
    AccountId thumbnail;
    List<AccountId> tags;
    bool vaulted;
    AccountId marketCost;
    AccountId bpCost;
    List<Attack> attacks;
    int masteryReq;
    int buildPrice;
    int buildTime;
    int skipBuildTimePrice;
    int buildQuantity;
    bool consumeOnBuild;
    AccountId wikiaThumbnail;
    AccountId wikiaUrl;
    double criticalChance;
    double criticalMultiplier;
    int disposition;
    double fireRate;
    double omegaAttenuation;
    double procChance;
    double releaseDate;
    int slot;
    int totalDamage;
    DateTime vaultDate;
    int? accuracy;
    int? ammo;
    int? magazineSize;
    double? multishot;
    AccountId? noise;
    AccountId? trigger;

    PrimaryItem({
        required this.name,
        required this.uniqueName,
        required this.description,
        required this.type,
        required this.tradable,
        required this.category,
        required this.productCategory,
        required this.patchlogs,
        required this.components,
        required this.introduced,
        required this.estimatedVaultDate,
        required this.url,
        required this.mr,
        required this.rivenDisposition,
        required this.polarities,
        required this.thumbnail,
        required this.tags,
        required this.vaulted,
        required this.marketCost,
        required this.bpCost,
        required this.attacks,
        required this.masteryReq,
        required this.buildPrice,
        required this.buildTime,
        required this.skipBuildTimePrice,
        required this.buildQuantity,
        required this.consumeOnBuild,
        required this.wikiaThumbnail,
        required this.wikiaUrl,
        required this.criticalChance,
        required this.criticalMultiplier,
        required this.disposition,
        required this.fireRate,
        required this.omegaAttenuation,
        required this.procChance,
        required this.releaseDate,
        required this.slot,
        required this.totalDamage,
        required this.vaultDate,
        this.accuracy,
        this.ammo,
        this.magazineSize,
        this.multishot,
        this.noise,
        this.trigger,
    });

}

class Suit {
    AccountId itemId;
    AccountId uniqueName;
    AccountId name;
    SuitItem item;
    List<Config> configs;

    Suit({
        required this.itemId,
        required this.uniqueName,
        required this.name,
        required this.item,
        required this.configs,
    });

}

class SuitItem {
    AccountId name;
    AccountId uniqueName;
    AccountId description;
    AccountId type;
    bool tradable;
    AccountId category;
    AccountId productCategory;
    List<Patchlog> patchlogs;
    List<ItemElement> components;
    Introduced introduced;
    DateTime estimatedVaultDate;
    int shield;
    List<AccountId> polarities;
    AccountId primePower;
    AccountId primeMr;
    int color;
    List<AccountId> primePolarities;
    bool conclave;
    int primeArmor;
    AccountId speed;
    AccountId aura;
    AccountId primeUrl;
    int primeHealth;
    int power;
    AccountId primeAura;
    AccountId info;
    AccountId thumbnail;
    AccountId mr;
    int primeShield;
    int health;
    AccountId primeSpeed;
    AccountId url;
    AccountId regex;
    int armor;
    AccountId location;
    AccountId primeConclave;

    SuitItem({
        required this.name,
        required this.uniqueName,
        required this.description,
        required this.type,
        required this.tradable,
        required this.category,
        required this.productCategory,
        required this.patchlogs,
        required this.components,
        required this.introduced,
        required this.estimatedVaultDate,
        required this.shield,
        required this.polarities,
        required this.primePower,
        required this.primeMr,
        required this.color,
        required this.primePolarities,
        required this.conclave,
        required this.primeArmor,
        required this.speed,
        required this.aura,
        required this.primeUrl,
        required this.primeHealth,
        required this.power,
        required this.primeAura,
        required this.info,
        required this.thumbnail,
        required this.mr,
        required this.primeShield,
        required this.health,
        required this.primeSpeed,
        required this.url,
        required this.regex,
        required this.armor,
        required this.location,
        required this.primeConclave,
    });

}

class XpInfo {
    AccountId uniqueName;
    int xp;
    PrimaryItem item;

    XpInfo({
        required this.uniqueName,
        required this.xp,
        required this.item,
    });

}

class Mission {
    AccountId node;
    AccountId nodeKey;
    AccountId missionType;
    AccountId faction;
    AccountId completes;
    dynamic tier;

    Mission({
        required this.node,
        required this.nodeKey,
        required this.missionType,
        required this.faction,
        required this.completes,
        required this.tier,
    });

}

class OperatorLoadout {
    List<dynamic> skins;
    AccountId operatorAmp;
    List<AccountId> upgrades;
    AbilityOverride abilityOverride;
    Cloth primaryColor;
    Cloth sigilColor;
    Cloth eyeColor;
    Cloth facial;
    Cloth cloth;

    OperatorLoadout({
        required this.skins,
        required this.operatorAmp,
        required this.upgrades,
        required this.abilityOverride,
        required this.primaryColor,
        required this.sigilColor,
        required this.eyeColor,
        required this.facial,
        required this.cloth,
    });

}

class AbilityOverride {
    AccountId ability;
    int index;

    AbilityOverride({
        required this.ability,
        required this.index,
    });

}

class Cloth {
    EmisssiveClass primary;
    EmisssiveClass secondary;
    EmisssiveClass accents;
    EmisssiveClass tertiary;
    List<EmisssiveClass> emisssive;
    List<EmisssiveClass> energy;

    Cloth({
        required this.primary,
        required this.secondary,
        required this.accents,
        required this.tertiary,
        required this.emisssive,
        required this.energy,
    });

}

class EmisssiveClass {
    List<EmisssiveMatch> matches;
    AccountId hex;

    EmisssiveClass({
        required this.matches,
        required this.hex,
    });

}

class EmisssiveMatch {
    PurplePalette palette;
    Position position;

    EmisssiveMatch({
        required this.palette,
        required this.position,
    });

}

class PurplePalette {
    AccountId name;
    AccountId description;

    PurplePalette({
        required this.name,
        required this.description,
    });

}

class Position {
    int row;
    int col;

    Position({
        required this.row,
        required this.col,
    });

}

class Syndicate {
    AccountId name;
    int standing;
    int title;

    Syndicate({
        required this.name,
        required this.standing,
        required this.title,
    });

}
