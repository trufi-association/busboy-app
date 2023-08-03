import 'package:flutter/material.dart';
import 'package:navigator/custom_async_executor.dart';
import 'package:trufi_core/base/blocs/map_configuration/map_configuration_cubit.dart';
import 'package:trufi_core/base/blocs/map_tile_provider/map_tile_provider.dart';
import 'package:trufi_core/base/models/trufi_latlng.dart';
import 'package:trufi_core/base/utils/graphql_client/hive_init.dart';
import 'package:trufi_core/base/widgets/drawer/menu/social_media_item.dart';
import 'package:trufi_core/base/widgets/screen/lifecycle_reactor_notification.dart';
import 'package:trufi_core/default_values.dart';
import 'package:trufi_core/trufi_core.dart';
import 'package:trufi_core/trufi_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(
    TrufiApp(
      appNameTitle: 'Busboy',
      trufiLocalization: DefaultValues.trufiLocalization(
        currentLocale: const Locale("es"),
      ),
      blocProviders: [
        ...DefaultValues.blocProviders(
          otpEndpoint: "https://api.busboy.app/otp",
          otpGraphqlEndpoint: "https://api.busboy.app/otp/index/graphql",
          mapConfiguration: MapConfiguration(
            center: const TrufiLatLng(5.7157,-72.9315),
          ),
          searchAssetPath: "assets/data/search.json",
          photonUrl: "https://api.busboy.app/photon",
          mapTileProviders: [
            OSMMapLayer(
              mapTilesUrl:
                  "https://api.busboy.app/static-maps/trufi-liberty/{z}/{x}/{y}@2x.jpg",
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
          urlFeedback: 'https://api.busboy.app/feedback',
          emailContact: 'leonardo.gutierrez@trufi-association.org',
          urlShareApp: 'https://api.busboy.app/',
          urlSocialMedia: const UrlSocialMedia(
            urlFacebook: 'https://www.facebook.com/busboyaca',
          ),
          asyncExecutor: customAsyncExecutor,
          shareBaseUri: Uri(
            scheme: "https",
            host: "busboy.app",
          ),
          lifecycleReactorHandler: LifecycleReactorNotifications(
            url:
                'https://api.busboy.app/static_files/notification.json',
          ),
        ),
      ),
    ),
  );
}
