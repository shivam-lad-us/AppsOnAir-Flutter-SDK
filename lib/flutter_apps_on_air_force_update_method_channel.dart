import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apps_on_air/flutter_apps_on_air.dart';

import 'flutter_apps_on_air_force_update_platform_interface.dart';

/// An implementation of [FlutterAppsOnAirForceUpdatePlatform] that uses method channels.
class MethodChannelFlutterAppsOnAirForceUpdate
    extends FlutterAppsOnAirForceUpdatePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_apps_on_air_force_update');

  late BuildContext context;
  bool _dialogOpen = false;

  @override
  Future<void> initMethod(
    BuildContext context, {
    bool showNativeUI = false,
    Widget? Function(Map<String, dynamic> response)? customWidget,
  }) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      this.context = context;
      String appId = FlutterAppsOnAir.applicationId;
      if (appId.isNotEmpty && appId != "") {
        _listenToNativeMethod();
        final appUpdateResponse = await _check();
        if (customWidget != null) {
          final widget = customWidget.call(appUpdateResponse);

          ///custom ui dialog
          if (!showNativeUI && widget != null) {
            _alertDialog(widget);
          }
        }
      }
    });
  }

  void _listenToNativeMethod() {
    if (Platform.isIOS) {
      methodChannel.setMethodCallHandler((call) {
        switch (call.method) {
          case "openDialog":
            _showIgnorePointerDialog();
            break;
          case "closeDialog":
            if (_dialogOpen) {
              _dialogOpen = false;
              _closeDialog();
            }
        }
        return Future.sync(() => _dialogOpen);
      });
    }
  }

  // while native dialog is open (in IOS), Flutter ui is still accessible
  // This dialog is solution for to prevent flutter ui access
  void _showIgnorePointerDialog() {
    if (!_dialogOpen) {
      _dialogOpen = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        useSafeArea: false,
        barrierColor: Colors.transparent,
        builder: (context) => Container(
          color: Colors.transparent,
        ),
      );
    }
  }

  void _closeDialog() => Navigator.pop(context);

  void _alertDialog(Widget widget) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            content: widget,
          ),
        );
      },
    );
  }

  Future<Map<String, dynamic>> _check() async {
    String updateCheck = '';
    try {
      final result = await methodChannel.invokeMethod(
        'isUpdateAvailable',
      );
      if (result != null && result is String) {
        return Map<String, dynamic>.from(json.decode(result));
      }
      return Map<String, dynamic>.from(((result ?? {}) as Map));
    } on PlatformException catch (e) {
      updateCheck = "Failed to check for update: '${e.message}'.";
    }
    if (kDebugMode) {
      print(updateCheck);
    }
    return {"exception": updateCheck};
  }
}
