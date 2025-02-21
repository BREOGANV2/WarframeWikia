import 'package:app_warframe_api/core/widget/Drawer_inicio.dart';
import 'package:app_warframe_api/core/widget/body_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Warframe Wikia',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0), 
        elevation: 10,
      ),
      drawer: MyDrawer(),
      body:   BodyWidgetNoticias(),
      
    );
  }
}
