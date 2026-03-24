import 'package:secure_device_context/secure_device_context_platform_interface.dart'
    show SecureDeviceContextPlatform;
import 'package:secure_device_context/src/enums/risk_level.dart' show RiskLevel;
import 'package:secure_device_context/src/enums/secure_context.dart'
    show SecureContext;

export 'src/enums/risk_level.dart';
export 'src/enums/secure_context.dart';

class SecureDeviceContext {
  Future<bool?> get isDevMode =>
      SecureDeviceContextPlatform.instance.isDevMode();

  Future<bool?> get isJailbreak =>
      SecureDeviceContextPlatform.instance.isJailbreak();

  Future<bool?> get isEmulator =>
      SecureDeviceContextPlatform.instance.isEmulator();

  Future<bool?> get isDebugMode =>
      SecureDeviceContextPlatform.instance.isDebugMode();

  Future<Map<String, dynamic>?> get status =>
      SecureDeviceContextPlatform.instance.status();

  Future<List<SecureContext>?> get contexts =>
      SecureDeviceContextPlatform.instance.contexts();

  Future<RiskLevel?> get riskLevel =>
      SecureDeviceContextPlatform.instance.riskLevel();
}
