import 'package:app_warframe_api/core/model/model_warframe.dart';
import 'package:app_warframe_api/core/widget/Drawer_inicio.dart';
import 'package:app_warframe_api/core/widget/widget_salir.dart';
import 'package:app_warframe_api/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_warframe_api/provider/provider_warframe_api.dart';

class WarframeScreen extends StatefulWidget {
  const WarframeScreen({super.key});

  @override
  _WarframeScreenState createState() => _WarframeScreenState();
}

class _WarframeScreenState extends State<WarframeScreen> {
  TextEditingController searchController = TextEditingController();
  List<ModelWarframe> warframes = [];

  @override
  void initState() {
    super.initState();
    cargarWarframes(' ');

    searchController.addListener(() {
      setState(() {
        cargarWarframes(searchController.text);
      });
    });
  }

  Future<void> cargarWarframes(String query) async {
    if (query.trim().isEmpty) {
      query = ' ';
    }
    final provider = Provider.of<ProviderWarframeApi>(context, listen: false);
    await provider.WarframeList(query);
    setState(() {
      warframes = provider.warframes ?? [];
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
          title: const Text('Warframes'),
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Buscar Warframe',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: warframes.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.count(
                      crossAxisCount: 2,
                      children: warframes.map((warframe) {
                        return InkWell(
                          child: Card(
                            child: Column(
                              children: [
                                Expanded(
                                  child: FadeInImage.assetNetwork(
                                    placeholder: "asset/images/gifCarga.gif",
                                    fadeInDuration: Duration(seconds: 2),
                                    image:
                                        "https://wiki.warframe.com/images/${warframe.name!.replaceAll(RegExp(r'\s+|<ARCHWING>'), '')}.png",
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return const CircularProgressIndicator();
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  "${warframe.name}",
                                  style: const TextStyle(fontSize: 30),
                                ),
                                Text("${warframe.type}")
                              ],
                            ),
                          ),
                          onTap: () => Navigator.of(context).pushNamed(
                            RoutesWarframe.detailWarframw,
                            arguments: warframe,
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
