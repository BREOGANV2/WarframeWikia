import 'package:app_warframe_api/core/model/model_weaponsSearchUnico.dart';
import 'package:flutter/material.dart';

class WeaponDetailScreen extends StatelessWidget {
  const WeaponDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ModelWeapon arma =
        ModalRoute.of(context)!.settings.arguments as ModelWeapon;
    final String nombre = arma.name.replaceAll(RegExp(r'\s+|<ARCHWING>'), '');
    print(nombre);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          child: Text(
            arma.name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            width: 100,
            height: 350,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2), // Línea azul
            ),
            child: Image.network(
              "https://wiki.warframe.com/images/${nombre.trim()}.png",
              errorBuilder: (context, error, stackTrace) {
                return Image.asset("asset/images/armas.jpg");
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              texto(arma.type),
              texto(": "),
              texto(arma.name),
            ],
          ),
          containerTexto(arma.description),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue,
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
                texto(
                    "Cadencia de disparo: ${(arma.fireRate).toStringAsFixed(2)} Balas/Segundo"),
                texto("Polaridad: ${arma.polarities}"),
                texto("Multidisparo: ${arma.multishot}"),
                texto("Maestia Requerida: ${arma.masteryReq}"),
                texto("Tamaño del Cargador: ${arma.magazineSize}"),
                texto("Multiplicador de Critico: ${arma.criticalMultiplier}"),
                texto(
                    "Critical Chance: ${(arma.criticalChance * 100).toStringAsFixed(2)}%"),
              ],
            ),
          ),
          texto(arma.vaulted
              ? "El arma esta en el Vault"
              : "El arma no esta en Vault"),
          texto("Coste de Platinos: ${(arma.marketCost).isEmpty
                  ? "No se puede comprar con "
                  : arma.marketCost} Platinos"),
        ],
      ),
    );
  }
}

Text texto(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 20, color: Colors.white),
  );
}

Widget containerTexto(String texto) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      texto,
      textAlign: TextAlign.justify,
      style: const TextStyle(fontSize: 18),
    ),
  );
}
