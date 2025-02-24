import 'package:app_warframe_api/core/model/model_Misiones_Reliquias.dart';
import 'package:app_warframe_api/core/widget/Drawer_inicio.dart';
import 'package:app_warframe_api/core/widget/widget_salir.dart';
import 'package:app_warframe_api/provider/provider_warframe_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MisionesReliquiasScreen extends StatefulWidget {
  const MisionesReliquiasScreen({super.key});

  @override
  _MisionesReliquiasScreenState createState() =>
      _MisionesReliquiasScreenState();
}

class _MisionesReliquiasScreenState extends State<MisionesReliquiasScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    const rutaAxi =
        "https://static.wikia.nocookie.net/warframe/images/0/0e/VoidProjectionsGoldD.png/revision/latest/thumbnail/width/360/height/450?cb=20161204211754&path-prefix=es";
    const rutaNeo =
        "https://static.wikia.nocookie.net/warframe/images/c/c5/VoidProjectionsSilverD.png/revision/latest?cb=20161204211754&path-prefix=es";
    const rutaMeso =
        "https://static.wikia.nocookie.net/warframe/images/1/12/VoidProjectionsBronzeD.png/revision/latest/thumbnail/width/360/height/360?cb=20161204211754&path-prefix=es";
    const rutaLith =
        "https://static.wikia.nocookie.net/warframe/images/a/ae/VoidProjectionsIronD.png/revision/latest?cb=20161204211754&path-prefix=es";

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asset/images/fondo.png"), 
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Incursiones del Vacio"),
        ),
        drawer: const MyDrawer(),
        backgroundColor: Colors.transparent, 
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            generarApartado("Lith", rutaLith),
            generarApartado("Meso", rutaMeso),
            generarApartado("Neo", rutaNeo),
            generarApartado("Axi", rutaAxi),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          selectedFontSize: 30,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
                icon: Image.network(rutaLith),
                label: 'Lith'),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
                icon: Image.network(rutaMeso),
                label: 'Meso'),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
                icon: Image.network(rutaNeo),
                label: 'Neo'),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
                icon: Image.network(rutaAxi),
                label: 'Axi'),
          ],
        ),
      ),
    );
  }

  Widget generarApartado(String relic, String ruta) {
    return WillPopScope(
      onWillPop: () async {
        bool salir = await mostrarDialogoSalir(context); 
        return salir;
      },
      child: Consumer<ProviderWarframeApi>(
        builder: (context, providerWarframe, child) {
          return FutureBuilder(
            future: providerWarframe.MisionesReliquias(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Hay un error",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                );
              } else if (snapshot.hasData) {
                List<ModelMisionesReliquias> misiones = snapshot.data!;
                return ListView(
                  children: misiones.map((e) {
                    if (e.tier == relic) {
                      return Container(
                        height: 140,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 89, 29, 230), width: 2),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.75),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(15),
                          title: Text(
                            e.missionType,
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            e.node,
                            style: const TextStyle(fontSize: 20, color: Colors.white70),
                          ),
                          leading: Image.network(ruta, width: 60, height: 60),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }).toList(),
                );
              }
              return const Center(
                child: Text(
                  "Cargando datos...",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
