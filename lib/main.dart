import 'package:flutter/material.dart';
import 'package:busboy/configuration_service.dart';
import 'package:busboy/theme/theme.dart';
import 'package:trufi_core/trufi_app.dart';

import 'drawer_menu/drawer_menu.dart';
import 'map_leyers.dart';

void main() async {
  runApp(
    TrufiApp(
      configuration: setupConfiguration(),
      theme: trotroTheme,
      bottomBarTheme: bottomBarTheme,
      menuItems: menuItems,
      mapTileProviders: [
        MapLayer(MapLayerIds.streets),
        MapLayer(MapLayerIds.osm),
      ],
    ),
  );
}
