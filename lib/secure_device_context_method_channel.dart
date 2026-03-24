import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart' show MethodChannel;
import 'package:secure_device_context/secure_device_context_platform_interface.dart'
    show RiskLevel, SecureContext, SecureDeviceContextPlatform;
import 'package:secure_device_context/src/enums/secure_device_context_method.dart'
    show SecureDeviceContextMethod;

export 'src/enums/risk_level.dart';
export 'src/enums/secure_context.dart';

/// An implementation of [SecureDeviceContextPlatform] that uses method channels.
class MethodChannelSecureDeviceContext extends SecureDeviceContextPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel(
    'secure_device_context',
  );

  @override
  Future<bool?> isDevMode() => methodChannel.invokeMethod<bool>(
    SecureDeviceContextMethod.isDevMode.value,
  );

  @override
  Future<bool?> isJailbreak() => methodChannel.invokeMethod<bool>(
    SecureDeviceContextMethod.isJailbreak.value,
  );

  @override
  Future<bool?> isEmulator() => methodChannel.invokeMethod<bool>(
    SecureDeviceContextMethod.isEmulator.value,
  );

  @override
  Future<bool?> isDebugMode() => methodChannel.invokeMethod<bool>(
    SecureDeviceContextMethod.isDebugMode.value,
  );

  @override
  Future<Map<String, dynamic>?> status() =>
      methodChannel.invokeMethod<Map<String, dynamic>>(
        SecureDeviceContextMethod.status.value,
      );

  @override
  Future<List<SecureContext>?> contexts() =>
      methodChannel.invokeMethod<List<SecureContext>>(
        SecureDeviceContextMethod.contexts.value,
      );

  @override
  Future<RiskLevel?> riskLevel() => methodChannel.invokeMethod<RiskLevel>(
    SecureDeviceContextMethod.riskLevel.value,
  );
}
