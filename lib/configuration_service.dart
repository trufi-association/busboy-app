import 'package:flutter/material.dart';
import 'package:trufi_core/blocs/configuration/configuration.dart';
import 'package:trufi_core/blocs/configuration/models/animation_configuration.dart';
import 'package:trufi_core/blocs/configuration/models/language_configuration.dart';
import 'package:trufi_core/blocs/configuration/models/map_configuration.dart';
import 'package:trufi_core/blocs/configuration/models/url_collection.dart';

import 'package:latlong2/latlong.dart';
import 'package:trufi_core/models/definition_feedback.dart';

Configuration setupConfiguration() {
  // Urls
  final urls = UrlCollection(
    openTripPlannerUrl: "https://otp.busboy.app/otp/routers/default",
  );

  // Map
  final map = MapConfiguration(
    defaultZoom: 12.0,
    offlineMinZoom: 8.0,
    offlineMaxZoom: 14.0,
    offlineZoom: 13.0,
    onlineMinZoom: 1.0,
    onlineMaxZoom: 19.0,
    onlineZoom: 13.0,
    chooseLocationZoom: 16.0,
    center: LatLng(5.82303, -73.03762),
    southWest: LatLng(5.76259, -73.09),
    northEast: LatLng(5.86897, -72.98995),
  );

  // Languages
  final languages = [
    LanguageConfiguration("de", "DE", "Deutsch"),
    LanguageConfiguration("en", "US", "English", isDefault: true),
    LanguageConfiguration("es", "ES", "Español"),
    LanguageConfiguration("fr", "FR", "Français"),
    LanguageConfiguration("it", "IT", "Italiano"),
    LanguageConfiguration("qu", "BO", "Quechua simi"),
  ];

  final customTranslations = TrufiCustomLocalizations()
    ..title = {
      const Locale("de"): "BusBoy App",
      const Locale("en"): "BusBoy App",
      const Locale("es"): "BusBoy App",
      const Locale("fr"): "BusBoy App",
      const Locale("it"): "BusBoy App",
      const Locale("qu"): "BusBoy App",
    };

  return Configuration(
    appCity: "Colombia",
    customTranslations: customTranslations,
    supportedLanguages: languages,
    teamInformationEmail: "info@trufi.app",
    animations: AnimationConfiguration(),
    feedbackDefinition: FeedbackDefinition(
      FeedBackType.email,
      "feedback@trufi.app",
    ),
    map: map,
    urls: urls,
    showWeather: false,
  );
}
