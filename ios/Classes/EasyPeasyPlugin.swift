import Flutter
import UIKit
import MyIDNative

public class EasyPeasyPlugin: NSObject, FlutterPlugin, HelloDelegate {
    public func onSuccess(code: String) {
        <#code#>
    }
    
    
    public func onError(exception: String) {
        <#code#>
    }
    
    public func onUserExited() {
        <#code#>
    }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "easy_peasy", binaryMessenger: registrar.messenger())
    let instance = EasyPeasyPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult)  {
    switch call.method  {
    case "getPlatformVersion":
        let hello = Hello()
        hello.delegate = self
        hello.startMyIdjon()
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
