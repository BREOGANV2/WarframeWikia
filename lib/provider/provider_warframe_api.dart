import 'package:app_warframe_api/core/model/model_Misiones_Reliquias.dart';
import 'package:app_warframe_api/core/model/model_noticia.dart';
import 'package:app_warframe_api/core/model/model_status_cambion_drift.dart';
import 'package:app_warframe_api/core/model/model_status_cetus.dart';
import 'package:app_warframe_api/core/model/model_status_fortuna.dart';
import 'package:app_warframe_api/core/model/model_warframe.dart';

import 'package:app_warframe_api/core/model/model_weaponsSearchUnico.dart';
import 'package:app_warframe_api/services/warframe_api_service.dart';
import 'package:flutter/material.dart';

class ProviderWarframeApi with ChangeNotifier {
  List<ModelNoticia>? _noticias;
  ModelStatusDeimos? _statusDeimos;
  ModelStatusCetus? _statusCetus;
  ModelFortunaStatus? _statusFortuna;
  List<ModelMisionesReliquias>? _misionesReliquias;
  List<ModelWeapon>? _arma;
  List<ModelWarframe>? _warframes;
  ModelWeapon? _modeloWeapons;

 
  List<ModelNoticia>? get noticias => _noticias;
  ModelStatusDeimos? get statusDeimos => _statusDeimos;
  ModelStatusCetus? get statusCetus => _statusCetus;
  ModelFortunaStatus? get statusFortuna => _statusFortuna;
  List<ModelMisionesReliquias>? get misionesReliquias => _misionesReliquias;
  List<ModelWeapon>? get arma => _arma;
  List<ModelWarframe>? get warframes => _warframes;
  ModelWeapon? get modeloWeapons => _modeloWeapons;


  Future<List<ModelNoticia>> noticiasApi() async {
    _noticias = await WarframeApiService.getNoticias();
    return _noticias!;
  }

  Future<ModelStatusDeimos> StatusDeimos() async {
    _statusDeimos = await WarframeApiService.getStatusDrift();

    return _statusDeimos!;
  }

  Future<ModelStatusCetus> StatusCetus() async {
    _statusCetus = await WarframeApiService.getStatusCetus();

    return _statusCetus!;
  }

  Future<List<ModelMisionesReliquias>> MisionesReliquias() async {
    _misionesReliquias = await WarframeApiService.getMisionesReliquias();
    return _misionesReliquias!;
  }

  Future<ModelFortunaStatus> StatusFortuna() async {
    _statusFortuna = await WarframeApiService.getStatusFortuna();
    return _statusFortuna!;
  }

  Future<List<ModelWeapon>> WeaponsList(String nombre) async {
    _arma = await WarframeApiService.getWeaponByName(nombre);
    return _arma!;
  }

  Future<List<ModelWarframe>> WarframeList(String nombre) async {
    _warframes = await WarframeApiService.getWarframeByName(nombre);
    return _warframes!;
  }
}
