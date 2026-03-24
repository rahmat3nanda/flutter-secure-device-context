import Flutter
import UIKit
import SecureDeviceContext

/// The main bridge responsible for fielding Flutter's method channel requests into iOS's `SecureDeviceContext`.
/// Because Apple does not emit `dev_mode` statuses, those natively resolve to `false` when hit on an iOS device.
public class SecureDeviceContextPlugin: NSObject, FlutterPlugin {
    /// Registers the method channel so the underlying Flutter engine can communicate asynchronously.
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
