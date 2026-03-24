import 'package:secure_device_context/secure_device_context_platform_interface.dart'
    show SecureDeviceContextPlatform;
import 'package:secure_device_context/src/enums/risk_level.dart' show RiskLevel;
import 'package:secure_device_context/src/enums/secure_context.dart'
    show SecureContext;

export 'src/enums/risk_level.dart';
export 'src/enums/secure_context.dart';

/// A Flutter plugin for retrieving the security context of the device.
///
/// This provides a simple, asynchronous API to check if the device environment is rooted, 
/// running on an emulator, has debug mode active, or developer mode enabled, giving you 
/// insight into the broader `riskLevel` of the device executing your code.
class SecureDeviceContext {
  /// Checks whether developer mode/options are actively enabled on Android.
  /// Always returns false on iOS, as Apple does not expose equivalent developer controls.
  Future<bool?> get isDevMode =>
      SecureDeviceContextPlatform.instance.isDevMode();

  /// Checks if the device environment operates as a Rooted (Android) or Jailbroken (iOS) system.
  Future<bool?> get isJailbreak =>
      SecureDeviceContextPlatform.instance.isJailbreak();

  /// Determines whether the code is being run inside a simulated environment/emulator.
  Future<bool?> get isEmulator =>
      SecureDeviceContextPlatform.instance.isEmulator();

  /// Checks if a debugger is actively attached to the current process.
  Future<bool?> get isDebugMode =>
      SecureDeviceContextPlatform.instance.isDebugMode();

  /// Returns a map of all security contexts to raw boolean values, along with your device's calculated `risk_level`.
  Future<Map<String, dynamic>?> get status =>
      SecureDeviceContextPlatform.instance.status();

  /// Returns a comprehensive list of all detected security vulnerabilities present in your current context.
  Future<List<SecureContext>?> get contexts =>
      SecureDeviceContextPlatform.instance.contexts();

  /// Analyzes the aggregated context list to evaluate the broader security classification (`secure`, `warning`, `critical`).
  Future<RiskLevel?> get riskLevel =>
      SecureDeviceContextPlatform.instance.riskLevel();
}
