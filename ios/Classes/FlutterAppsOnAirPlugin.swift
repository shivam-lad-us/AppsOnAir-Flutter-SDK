import Flutter
import UIKit
import AppsOnAir

public class FlutterAppsOnAirPlugin: NSObject, FlutterPlugin {
    
    private var appId: String = ""
    let appsOnAirService = AppsOnAirServices()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_apps_on_air", binaryMessenger: registrar.messenger())
    let instance = FlutterAppsOnAirPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if ("setAppID" == call.method) {
            if let args = call.arguments as? Dictionary<String, Any>,
                 let appId = args["AppId"] as? String, let showNativeUI  = args["showNativeUI"] as? Bool{
                      do{
                          appsOnAirService.setAppId(appId, showNativeUI)
                          print("iOS application ID \(appId) and show native UI \(showNativeUI)")
                      }catch let error {
                          print("Failed to load: \(error.localizedDescription)")
                      }
                      result(true)
                  } else {
                      result(false)
            }
    }
  }
}
