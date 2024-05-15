/* import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_apps_on_air_force_update/flutter_apps_on_air_force_update.dart';
import 'package:flutter_apps_on_air_force_update/flutter_apps_on_air_force_update_platform_interface.dart';
import 'package:flutter_apps_on_air_force_update/flutter_apps_on_air_force_update_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAppsOnAirForceUpdatePlatform
    with MockPlatformInterfaceMixin
    implements FlutterAppsOnAirForceUpdatePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAppsOnAirForceUpdatePlatform initialPlatform = FlutterAppsOnAirForceUpdatePlatform.instance;

  test('$MethodChannelFlutterAppsOnAirForceUpdate is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAppsOnAirForceUpdate>());
  });

  test('getPlatformVersion', () async {
    FlutterAppsOnAirForceUpdate flutterAppsOnAirForceUpdatePlugin = FlutterAppsOnAirForceUpdate();
    MockFlutterAppsOnAirForceUpdatePlatform fakePlatform = MockFlutterAppsOnAirForceUpdatePlatform();
    FlutterAppsOnAirForceUpdatePlatform.instance = fakePlatform;

    expect(await flutterAppsOnAirForceUpdatePlugin.getPlatformVersion(), '42');
  });
}
 */