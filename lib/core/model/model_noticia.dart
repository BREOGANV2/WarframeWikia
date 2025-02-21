class ModelNoticia {
  String date;
  String imageLink;
  String eta;
  bool primeAccess;
  bool stream;
  Translations translations;
  String link;
  bool update;
  String id;
  String asString;
  String message;
  bool priority;

  ModelNoticia({
    required this.date,
    required this.imageLink,
    required this.eta,
    required this.primeAccess,
    required this.stream,
    required this.translations,
    required this.link,
    required this.update,
    required this.id,
    required this.asString,
    required this.message,
    required this.priority,
  });

  factory ModelNoticia.fromMap(Map<String, dynamic> map) {
    return ModelNoticia(
      date: map['date'] ?? '',
      imageLink: map['imageLink'] ?? '',
      eta: map['eta'] ?? '',
      primeAccess: map['primeAccess'] ?? false,
      stream: map['stream'] ?? false,
      translations: Translations.fromMap(map['translations'] ?? {}),
      link: map['link'] ?? '',
      update: map['update'] ?? false,
      id: map['id'] ?? '',
      asString: map['asString'] ?? '',
      message: map['message'] ?? '',
      priority: map['priority'] ?? false,
    );
  }
}

class Translations {
  Translations();

  factory Translations.fromMap(Map<String, dynamic> map) {
    return Translations();
  }
}
