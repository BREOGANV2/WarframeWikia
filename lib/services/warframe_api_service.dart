import 'package:app_warframe_api/core/model/model_Misiones_Reliquias.dart';
import 'package:app_warframe_api/core/model/model_noticia.dart';
import 'package:app_warframe_api/core/model/model_status_cambion_drift.dart';
import 'package:app_warframe_api/core/model/model_status_cetus.dart';
import 'package:app_warframe_api/core/model/model_status_fortuna.dart';
import 'package:app_warframe_api/core/model/model_warframe.dart';
import 'package:app_warframe_api/core/model/model_weaponsSearchUnico.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WarframeApiService {
  static const __urlPrincipal = "api.warframestat.us";
  static const _pathNoticias = "/pc/news";
  static const _language = {"language": "es"};
  static const _pathCambionDrift = "/pc/cambionCycle";
  static const _pathCetusStatus = "/pc/cetusCycle";
  static const _pathWeapons = "/weapons/search/"; 
    static const _pathWarframes = "/warframes/search/"; 
  static const _pathMisionesReliquias="/pc/fissures";
  static const _pathStatusFortuna="/pc/vallisCycle";

  static Future<List<ModelNoticia>> getNoticias() async {
    var url = Uri.https(__urlPrincipal, _pathNoticias, _language);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ModelNoticia.fromMap(json)).toList();
    } else {
      throw Exception('Error al cargar las noticias');
    }
  }

  static Future<ModelStatusDeimos> getStatusDrift() async {
    var url = Uri.https(__urlPrincipal, _pathCambionDrift);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return ModelStatusDeimos.fromJson(data);
    } else {
      throw Exception('Error al cargar el estado de Cambion Drift');
    }
  }

  static Future<ModelStatusCetus> getStatusCetus() async {
    var url = Uri.https(__urlPrincipal, _pathCetusStatus);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return ModelStatusCetus.fromJson(data);
    } else {
      throw Exception('Error al cargar el estado de Cetus');
    }
  }

  
  static Future<List<ModelMisionesReliquias>> getMisionesReliquias() async {
    var url = Uri.https(__urlPrincipal, _pathMisionesReliquias, _language);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ModelMisionesReliquias.fromMap(json)).toList();
    } else {
      throw Exception('Error al cargar las noticias');
    }
  }

  static Future<ModelFortunaStatus> getStatusFortuna() async {
    var url = Uri.https(__urlPrincipal, _pathStatusFortuna,);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return ModelFortunaStatus.fromJson(data);
    } else {
      throw Exception('Error al cargar el estado de Fortuna');
    }
  }

static Future<List<ModelWeapon>> getWeaponByName(String nombre) async {
  var url = Uri.https(__urlPrincipal, _pathWeapons +nombre, _language);
  final response = await http.get(url);
  
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => ModelWeapon.fromJson(json)).toList();
  } else {
    throw Exception('Error al cargar las armas');
  }
}


static Future<List<ModelWarframe>> getWarframeByName(String nombre) async {
  var url = Uri.https(__urlPrincipal, _pathWarframes + nombre, _language);
  final response = await http.get(url);
  
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => ModelWarframe.fromJson(json)).toList();
  } else {
    throw Exception('Error al cargar las armas');
  }
}


  
}
