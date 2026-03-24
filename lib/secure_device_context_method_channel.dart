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

  Future<T?> _invoke<T>(SecureDeviceContextMethod method) async {
    try {
      return await methodChannel.invokeMethod<T>(method.value);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool?> isDevMode() =>
      _invoke<bool>(SecureDeviceContextMethod.isDevMode);

  @override
  Future<bool?> isJailbreak() =>
      _invoke<bool>(SecureDeviceContextMethod.isJailbreak);

  @override
  Future<bool?> isEmulator() =>
      _invoke<bool>(SecureDeviceContextMethod.isEmulator);

  @override
  Future<bool?> isDebugMode() =>
      _invoke<bool>(SecureDeviceContextMethod.isDebugMode);

  @override
  Future<Map<String, dynamic>?> status() async {
    final Map<Object?, Object?>? result = await _invoke<Map<Object?, Object?>>(
      SecureDeviceContextMethod.status,
    );
    return result?.map(
      (Object? key, Object? value) =>
          MapEntry<String, dynamic>(key.toString(), value),
    );
  }

  @override
  Future<List<SecureContext>?> contexts() async {
    final List<dynamic>? result = await _invoke<List<dynamic>>(
      SecureDeviceContextMethod.contexts,
    );
    return result
        ?.map((dynamic e) => SecureContext.fromValue(e.toString()))
        .whereType<SecureContext>()
        .toList();
  }

  @override
  Future<RiskLevel?> riskLevel() async {
    final String? result = await _invoke<String>(
      SecureDeviceContextMethod.riskLevel,
    );
    if (result != null) {
      return RiskLevel.fromValue(result);
    }
    return null;
  }
}
