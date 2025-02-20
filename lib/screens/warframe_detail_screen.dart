import 'package:app_warframe_api/core/model/model_warframe.dart';
import 'package:flutter/material.dart';

class WarframeDetailScreen extends StatelessWidget {
  const WarframeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ModelWarframe warframe =
        ModalRoute.of(context)!.settings.arguments as ModelWarframe;
    final String nombre = warframe.name!.replaceAll(RegExp(r'\s+|<ARCHWING>'), '');

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 84, 194),
        title: Text(
          warframe.name!,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("asset/images/warframes.jpg"),
        fit: BoxFit.cover, 
      ),
    ),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
           
            Container(
              color: Color.fromARGB(174, 0, 0, 0),
              height: 500,
              width: double.infinity,
              child: Image.network(
                "https://wiki.warframe.com/images/"+nombre+"Full.png",
                errorBuilder: (context, error, stackTrace) {
                  return Image.network("https://wiki.warframe.com/images/"+nombre!+".png",
                  errorBuilder: (context, error, stackTrace) {
                    return CircularProgressIndicator();
                  },);             
                },
                fit: BoxFit.contain,
              ),
            ),
            containerTexto(warframe.description ?? "Sin descripción"),
            const SizedBox(height: 20),
            Container(
              
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 84, 194),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Estadísticas Base",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  texto("Categoría: ${warframe.type}"),
                  texto("Aura: ${warframe.aura}"),
                  texto("Salud: ${warframe.health}"),
                  texto("Armadura: ${warframe.armor}"),
                  texto("Energía: ${warframe.power}"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Componentes Necesarios Para la fabricacion",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...warframe.components
                          ?.map((component) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    texto("Nombre: ${component.name}"),
                                    texto(
                                        "Tradeable: ${component.tradable! ? "Sí" : "No"}"),
                                    texto(
                                        "Descripción: ${component.description ?? "Sin descripción"}"),
                                  ],
                                ),
                              ))
                          .toList() ??
                      [texto("No hay componentes disponibles")],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text texto(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, color: Colors.white),
    );
  }

  Widget containerTexto(String texto) {
    return Container(
      color:  Color.fromARGB(174, 0, 0, 0),
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        texto,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
