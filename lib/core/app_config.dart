import 'package:flutter/material.dart';

enum Flavor { DEV, STAG, PROD }

class FlavorValues {
  final String baseUrl;

  FlavorValues({@required this.baseUrl});
}

class AppConfig {
  static const String DEV_URL = "https://api.stackexchange.com/2.2/";
  static const String STAG_URL = "https://api.stackexchange.com/2.2/";
  static const String PROD_URL = "https://api.stackexchange.com/2.2/";

  static AppConfig _instance;

  final Flavor flavor;

  factory AppConfig({@required Flavor flavor}) {
    _instance ??= AppConfig._internal(flavor);
    return _instance;
  }

  AppConfig._internal(this.flavor);

  static AppConfig get instance => _instance;

  String appName() {
    if (flavor == Flavor.DEV) {
      return 'DEV';
    } else if (flavor == Flavor.STAG) {
      return 'STAG';
    } else {
      return 'PROD';
    }
  }

  String rootUrl() {
    switch (_instance.flavor) {
      case Flavor.DEV:
        return DEV_URL;
      case Flavor.STAG:
        return STAG_URL;
      default:
        return PROD_URL;
    }
  }
}
