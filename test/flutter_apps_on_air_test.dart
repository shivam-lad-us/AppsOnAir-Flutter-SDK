/* import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_apps_on_air/flutter_apps_on_air.dart';
import 'package:flutter_apps_on_air/flutter_apps_on_air_platform_interface.dart';
import 'package:flutter_apps_on_air/flutter_apps_on_air_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAppsOnAirPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAppsOnAirPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAppsOnAirPlatform initialPlatform = FlutterAppsOnAirPlatform.instance;

  test('$MethodChannelFlutterAppsOnAir is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAppsOnAir>());
  });

  test('getPlatformVersion', () async {
    FlutterAppsOnAir flutterAppsOnAirPlugin = FlutterAppsOnAir();
    MockFlutterAppsOnAirPlatform fakePlatform = MockFlutterAppsOnAirPlatform();
    FlutterAppsOnAirPlatform.instance = fakePlatform;

    expect(await flutterAppsOnAirPlugin.getPlatformVersion(), '42');
  });
}
 */