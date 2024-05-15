package com.shivam.flutter_apps_on_air

import androidx.annotation.NonNull
import com.appsonair.AppsOnAirServices

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterAppsOnAirPlugin */
class FlutterAppsOnAirPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_apps_on_air")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "setAppID") {
      // Retrieve the argument as a nullable Boolean
      val showNativeUI: Boolean = call.argument<Boolean>("showNativeUI") ?: false

      AppsOnAirServices.setAppId(call.argument("AppId"), showNativeUI)
      result.success(true)
    }
      else {
        result.success(false)
      }

  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
