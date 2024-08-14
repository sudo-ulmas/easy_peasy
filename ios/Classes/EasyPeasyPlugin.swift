import Flutter
import UIKit
import MyIDNative

public class EasyPeasyPlugin: NSObject, FlutterPlugin, HelloDelegate {
     var  flResult: FlutterResult?
    public func onSuccess(code: String) {
        if let result = flResult {
            result(code)
        }
    }
    
    
    public func onError(exception: String) {
        if let result = flResult {
            result(exception)
        }
    }
    
    public func onUserExited() {
        
        if let result = flResult {
            result("usha gap")
        }
    }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "easy_peasy", binaryMessenger: registrar.messenger())
    let instance = EasyPeasyPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult)  {
    switch call.method  {
    case "getPlatformVersion":
        flResult = result
        let hello = Hello()
        hello.delegate = self
        hello.startMyIdjon()
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
