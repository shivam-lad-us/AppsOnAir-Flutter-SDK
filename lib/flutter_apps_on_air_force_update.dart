import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps_on_air/flutter_apps_on_air.dart';

import 'flutter_apps_on_air_force_update_platform_interface.dart';

class FlutterAppsOnAirForceUpdate {
  static void checkForAppUpdate(
    BuildContext context, {
    Widget? Function(Map<String, dynamic>)? customWidget,
  }) {
    String appId = FlutterAppsOnAir.applicationId;
    bool showNativeUI = FlutterAppsOnAir.showNativeApplicationUI;

    if (appId.isNotEmpty && appId != "") {
      if (!showNativeUI && customWidget == null) {
        throw Exception(
          "set showNativeUI = 'true' in  setAppId()"
          " or/else return your custom widget in checkForAppUpdate() Method ",
        );
      } else if (showNativeUI && customWidget != null) {
        _printWarning(
            "set showNativeUI = 'false' to show custom ui in setAppId() or/else remove custom widget from checkForAppUpdate() method");
      }
      FlutterAppsOnAirForceUpdatePlatform.instance.initMethod(context,
          showNativeUI: showNativeUI, customWidget: customWidget);
    } else {
      _printWarning(
          "Make sure you initialized AppsOnAir by calling initialize() method");
    }
  }

  static void _printWarning(String text) {
    if (kDebugMode) {
      print('[33m$text[0m');
    }
  }
}
