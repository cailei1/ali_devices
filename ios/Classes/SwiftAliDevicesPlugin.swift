import Flutter
import UIKit

public class SwiftAliDevicesPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ali_devices", binaryMessenger: registrar.messenger())
    let instance = SwiftAliDevicesPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
      
      if(call.method == "getDeviceUUID"){
          let uuid =  UIDevice.current.identifierForVendor?.uuidString ?? ""
          if(KeyChainManager.sharedInstance.readKeyChain().isEmpty){
              KeyChainManager.sharedInstance.saveKeyChain(keyChain: uuid)
          }
          
        result(KeyChainManager.sharedInstance.readKeyChain())
          
      }
    
  }
}
