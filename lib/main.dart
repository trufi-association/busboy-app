import 'package:flutter/material.dart';
import 'package:navigator/custom_async_executor.dart';
import 'package:trufi_core/base/blocs/map_configuration/map_configuration_cubit.dart';
import 'package:trufi_core/base/blocs/map_tile_provider/map_tile_provider.dart';
import 'package:trufi_core/base/utils/graphql_client/hive_init.dart';
import 'package:trufi_core/base/widgets/drawer/menu/social_media_item.dart';
import 'package:trufi_core/default_values.dart';
import 'package:trufi_core/trufi_core.dart';
import 'package:trufi_core/trufi_router.dart';
import 'package:latlong2/latlong.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(
    TrufiApp(
      appNameTitle: 'Busboy',
      blocProviders: [
        ...DefaultValues.blocProviders(
          otpEndpoint: "https://otp.busboy.app/otp/routers/default",
          otpGraphqlEndpoint: "https://cbba.trufi.dev/otp/index/graphql",
          mapConfiguration: MapConfiguration(
            center: LatLng(5.82303, -73.03762),
          ),
          searchAssetPath: "assets/data/search.json",
          photonUrl: "https://example/photonUrl",
          mapTileProviders: [
            OSMMapLayer(
              mapTilesUrl:
                  'https://otp.busboy.app/maps/osm-bright/{z}/{x}/{y}@2x.jpg',
            )
          ],
        ),
      ],
      trufiRouter: TrufiRouter(
        routerDelegate: DefaultValues.routerDelegate(
          appName: 'Busboy',
          cityName: 'Duitama',
          countryName: 'Colombia',
          backgroundImageBuilder: (_) {
            return Image.asset(
              'assets/images/drawer-bg.jpg',
              fit: BoxFit.cover,
            );
          },
          urlFeedback:
              'https://trufifeedback.z15.web.core.windows.net/route.html',
          emailContact: 'feedback@trufi.app',
          urlShareApp: 'https://example/share',
          urlSocialMedia: const UrlSocialMedia(
            urlFacebook: 'https://www.facebook.com/trufiapp/',
          ),
          asyncExecutor: customAsyncExecutor,
        ),
      ),
    ),
  );
}
