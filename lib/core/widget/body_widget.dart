import 'package:app_warframe_api/provider/provider_warframe_api.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class BodyWidgetNoticias extends StatelessWidget {
  const BodyWidgetNoticias({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderWarframeApi>(
      builder: (context, providerApi, child) {
        return FutureBuilder(
          future: providerApi.noticiasApi(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Error al Recoger Noticias");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No hay noticias disponibles.'));
            }

            if (snapshot.hasData) {
              final noticias = snapshot.data;
              return ListView.builder(
                itemCount: noticias!.length,
                itemBuilder: (context, index) {
                  final noticia = noticias[index];
                  return InkWell(
                    onDoubleTap: () async {
                      
                    },
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: (MediaQuery.of(context).size.height)*0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 3,
                            ),
                          ),
                          child: noticia.imageLink == "https://cdn.warframestat.us/genesis/img/news-placeholder.png"
                              ? Image.asset("asset/images/warframe-noticia.png", fit: BoxFit.cover)
                              : Image.network(
                                  noticia.imageLink,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                                  (loadingProgress.expectedTotalBytes ?? 1)
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(Icons.error, color: Colors.red),
                                    );
                                  },
                                ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            noticia.message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Text("Algo falló");
          },
        );
      },
    );
  }
}



