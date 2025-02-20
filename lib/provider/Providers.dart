import 'package:app_warframe_api/miMaterial.dart';
import 'package:app_warframe_api/provider/provider_warframe_api.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Providers extends StatelessWidget {
const Providers({ super.key });

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (context) => ProviderWarframeApi(),)
      ],
      child: const MiMaterial(),
      );
  }
}