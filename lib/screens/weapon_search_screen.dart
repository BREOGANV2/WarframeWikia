import 'package:app_warframe_api/core/widget/Drawer_inicio.dart';
import 'package:app_warframe_api/core/widget/widget_salir.dart';
import 'package:app_warframe_api/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_warframe_api/core/model/model_weaponsSearchUnico.dart';
import 'package:app_warframe_api/provider/provider_warframe_api.dart';

class WeaponsScreen extends StatefulWidget {
  const WeaponsScreen({super.key});

  @override
  _WeaponsScreenState createState() => _WeaponsScreenState();
}

class _WeaponsScreenState extends State<WeaponsScreen> {
  TextEditingController searchController = TextEditingController();
  List<ModelWeapon> weapons = [];

  @override
  void initState() {
    super.initState();
    cargarArmas(''); 

    searchController.addListener(() {
      setState(() {
        cargarArmas(searchController.text);
      });
    });
  }

  Future<void> cargarArmas(String query) async {
    if (query.trim().isEmpty) {
      query = ' '; 
    }
    final provider = context.read<ProviderWarframeApi>();
    await provider.WeaponsList(query);
    setState(() {
      weapons = provider.arma ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool salir = await mostrarDialogoSalir(context); 
        return salir;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Warframe Weapons'),
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Buscar arma',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: weapons.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.count(
                      crossAxisCount: 3,
                      children: weapons.map((weapon) {
                        return Card(
                          child: InkWell(
                            child: Column(
                              children: [
                                Expanded(
      
                                  child: 
                                  Image.network("https://wiki.warframe.com/images/${weapon.name.replaceAll(RegExp(r'\s+|<ARCHWING>'), '')}.png",
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset("asset/images/armas.jpg");
                                  },),
                                  ),
                                Center(child: Text(weapon.name)),
                                Center(child: Text(weapon.type))
                              ],
                            ),
                             onTap: () => Navigator.of(context).pushNamed(
                              RoutesWarframe.detailArma,
                              arguments: weapon,
                            )
                            ),
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
