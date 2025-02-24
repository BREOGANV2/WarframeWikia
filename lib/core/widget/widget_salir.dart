import 'package:flutter/material.dart';

Future<bool> mostrarDialogoSalir(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("¿Deseas salir de la aplicación?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text("No"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text("Sí"),
        ),
      ],
    ),
  ) ??
  false;
}
