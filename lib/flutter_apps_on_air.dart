import 'package:flutter/foundation.dart';

import 'flutter_apps_on_air_platform_interface.dart';

class FlutterAppsOnAir {
  static String applicationId = '';

  static bool showNativeApplicationUI = false;

  static setAppId(String appId, {bool showNativeUI = false}) async {
    applicationId = appId;
    showNativeApplicationUI = showNativeUI;
    if (applicationId.isNotEmpty && applicationId != "") {
      try {
        await FlutterAppsOnAirPlatform.instance.initMethod(
            appId: applicationId, showNativeUI: showNativeApplicationUI);
      } catch (e) {
        _printWarning(e.toString());
      }
    } else {
      throw UnimplementedError('Cannot set Application ID');
    }
    return showNativeUI;
  }

  static void _printWarning(String text) {
    if (kDebugMode) {
      print('[33m$text[0m');
    }
  }
}
