import 'package:app_warframe_api/routes/routes.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30),
            color: Colors.blue,
            child: const Text(
              'Warframe Wikia',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDrawerOption('Planets',"escogerPlanetas", Icons.sunny, context),
                _buildDrawerOption('Incursiones del Vacio',RoutesWarframe.reliquias, Icons.adjust_rounded, context),
                _buildDrawerOption('Warframes',RoutesWarframe.warframe, Icons.accessibility_outlined, context),
                _buildDrawerOption('Weapons',RoutesWarframe.weapon, Icons.gps_fixed_outlined, context)
              ],
            ),
          ),
          _buildDrawerOption('Exit',"home", Icons.exit_to_app, context, isExit: true),
        ],
      ),
    );
  }

  Widget _buildDrawerOption(String title,String ruta ,IconData icon, BuildContext context, {bool isExit = false}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(ruta);
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
         
        ),
      ),
    );
  }
}
