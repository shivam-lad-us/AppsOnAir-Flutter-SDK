import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_apps_on_air_method_channel.dart';

abstract class FlutterAppsOnAirPlatform extends PlatformInterface {
  /// Constructs a FlutterAppsOnAirPlatform.
  FlutterAppsOnAirPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAppsOnAirPlatform _instance = MethodChannelFlutterAppsOnAir();

  /// The default instance of [FlutterAppsOnAirPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAppsOnAir].
  static FlutterAppsOnAirPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAppsOnAirPlatform] when
  /// they register themselves.
  static set instance(FlutterAppsOnAirPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initMethod({
    required String appId,
    bool showNativeUI = true,
  }) {
    throw UnimplementedError(
        'Method has not been implemented correctly. Kindly check.');
  }
}
