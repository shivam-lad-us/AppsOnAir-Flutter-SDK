import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flutter_apps_on_air_platform_interface.dart';

/// An implementation of [FlutterAppsOnAirPlatform] that uses method channels.
class MethodChannelFlutterAppsOnAir extends FlutterAppsOnAirPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_apps_on_air');

  @override
  Future<void> initMethod({
    required String appId,
    bool showNativeUI = false,
  }) async {
    final result = await methodChannel.invokeMethod(
        'setAppID', {"AppId": appId, "showNativeUI": showNativeUI});
    if (result == true) {
      print('Application ID set success');
    }
    return result ?? false;
  }
}
