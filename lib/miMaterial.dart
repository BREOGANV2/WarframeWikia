import 'package:app_warframe_api/routes/routes.dart';
import 'package:flutter/material.dart';

class MiMaterial extends StatelessWidget {
const MiMaterial({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes: RoutesWarframe.Routes,
      initialRoute: RoutesWarframe.home,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}