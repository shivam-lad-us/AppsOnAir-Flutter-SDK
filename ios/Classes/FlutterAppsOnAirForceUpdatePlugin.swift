import Flutter
import UIKit
import AppsOnAir

public class FlutterAppsOnAirForceUpdatePlugin: NSObject, FlutterPlugin {
    
    private var appId: String = ""
    private var window: UIWindow?
    let appsOnAirService = AppsOnAirServices()
    static var channel : FlutterMethodChannel = FlutterMethodChannel()
    
    public override init() {
            super.init()
            NotificationCenter.default.addObserver(self, selector: #selector(self.onViewVisibilityChanged(_:)), name: .visibilityChanges, object: nil)
            
        }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_apps_on_air_force_update", binaryMessenger: registrar.messenger())
    let instance = FlutterAppsOnAirForceUpdatePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if("isUpdateAvailable" == call.method){
                  appsOnAirService.checkForAppUpdate { (appUpdateData) in
                      result(appUpdateData)
                  }
              }else{
                  result({})
              }
  }
    
    @objc public func onViewVisibilityChanged(_ notification: NSNotification) {
            if let isPresented = notification.userInfo?["isPresented"] as? Bool {
                if(isPresented == true) {
                    FlutterAppsOnAirForceUpdatePlugin.channel.invokeMethod("openDialog", arguments:true)
                } else {
                    FlutterAppsOnAirForceUpdatePlugin.channel.invokeMethod("closeDialog", arguments:true)
                }
            }
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self, name: .visibilityChanges, object: nil)
        }
}

extension Notification.Name {
 static let visibilityChanges = NSNotification.Name("visibilityChanges")
}
