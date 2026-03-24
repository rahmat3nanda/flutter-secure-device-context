import Flutter
import UIKit
import SecureDeviceContext

public class SecureDeviceContextPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "secure_device_context", binaryMessenger: registrar.messenger())
        let instance = SecureDeviceContextPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let secureContext = SecureDeviceContext()
        let method = SecureDeviceContextMethod(rawValue: call.method)

        switch method {
        case .isDevMode:
            result(false)
        case .isJailbreak:
            result(secureContext.isJailbreak())
        case .isEmulator:
            result(secureContext.isEmulator())
        case .isDebugMode:
            result(secureContext.isDebugMode())
        case .status:
            result(secureContext.status)
        case .contexts:
            result(secureContext.contexts.map { $0.rawValue })
        case .riskLevel:
            result(secureContext.riskLevel.rawValue)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
