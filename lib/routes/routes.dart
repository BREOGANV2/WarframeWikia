import 'package:app_warframe_api/screens/ChooserPlanetas_screen.dart';
import 'package:app_warframe_api/screens/home_screen.dart';
import 'package:app_warframe_api/screens/misiones_reliquias_screen.dart';
import 'package:app_warframe_api/screens/warframe_detail_screen.dart';
import 'package:app_warframe_api/screens/warframe_search_screen.dart';
import 'package:app_warframe_api/screens/weapon_Detail_screen.dart';
import 'package:app_warframe_api/screens/weapon_search_screen.dart';
import 'package:flutter/material.dart';

class RoutesWarframe {
  static const  home = "home";
  static const  noticia="noticia";
  static const  escogerPlanetas="escogerPlanetas";
  static const  reliquias="misiones";
  static const  weapon="armas";
  static const  detailArma="detailArma";
  static const  detailWarframw="detailWarframe";
  static const  warframe="warframe";
   static  Map<String,WidgetBuilder>get Routes => {
    "home" : (_) => const HomeScreen(),
    "escogerPlanetas": (_) => const ChooserPlanetasScreen(),
    "misiones": (_) =>  MisionesReliquiasScreen(),
    "armas": (_) => WeaponsScreen(),
    "detailArma": (_) => const WeaponDetailScreen(),
    "detailWarframe": (_) => const WarframeDetailScreen(),
    "warframe": (_) => WarframeScreen()
  };
}