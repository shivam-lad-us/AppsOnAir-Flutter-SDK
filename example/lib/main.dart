import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_apps_on_air/flutter_apps_on_air.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appsOnAirCore = FlutterAppsOnAir();
  final result = await FlutterAppsOnAir.setAppId(
      "951705c2-5728-4c1f-bdf9-f3216a4de9ad",
      showNativeUI: true);
  print(
      "==> Result from main '$result' with app id '${FlutterAppsOnAir.applicationId}' and show UI '${FlutterAppsOnAir.showNativeApplicationUI}'");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running for: ${FlutterAppsOnAir.applicationId}\n'),
        ),
      ),
    );
  }
}
