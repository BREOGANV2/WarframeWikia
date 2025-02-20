import 'package:app_warframe_api/core/model/model_warframe.dart';
import 'package:app_warframe_api/core/widget/Drawer_inicio.dart';
import 'package:app_warframe_api/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_warframe_api/core/model/model_weaponsSearchUnico.dart';
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
      query = ' '; // Aseguramos que el valor sea al menos un espacio en blanco
    }
    final provider = context.read<ProviderWarframeApi>();
    await provider.WarframeList(query);
    setState(() {
      warframes = provider.warframes ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warframes'),
      ),
      drawer: MyDrawer(),
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
                                child: Image.network(
                                  "https://wiki.warframe.com/images/"+warframe.name!.replaceAll(RegExp(r'\s+|<ARCHWING>'), '')+".png",
                                errorBuilder: (context, error, stackTrace) {
                                  return CircularProgressIndicator();
                                },
                                fit: BoxFit.cover,),
                              ),
                              Text(
                                "${warframe.name}",
                                style: TextStyle(fontSize: 30),),
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
    );
  }
}
