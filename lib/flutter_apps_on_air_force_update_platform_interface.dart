import 'package:flutter/material.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_apps_on_air_force_update_method_channel.dart';

abstract class FlutterAppsOnAirForceUpdatePlatform extends PlatformInterface {
  /// Constructs a FlutterAppsOnAirForceUpdatePlatform.
  FlutterAppsOnAirForceUpdatePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAppsOnAirForceUpdatePlatform _instance =
      MethodChannelFlutterAppsOnAirForceUpdate();

  /// The default instance of [FlutterAppsOnAirForceUpdatePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAppsOnAirForceUpdate].
  static FlutterAppsOnAirForceUpdatePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAppsOnAirForceUpdatePlatform] when
  /// they register themselves.
  static set instance(FlutterAppsOnAirForceUpdatePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initMethod(
    BuildContext context, {
    bool showNativeUI = true,
    Widget? Function(Map<String, dynamic>)? customWidget,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
