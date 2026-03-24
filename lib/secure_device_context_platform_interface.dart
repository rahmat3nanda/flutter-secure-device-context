import 'package:plugin_platform_interface/plugin_platform_interface.dart'
    show PlatformInterface;
import 'package:secure_device_context/secure_device_context_method_channel.dart'
    show MethodChannelSecureDeviceContext;
import 'package:secure_device_context/src/enums/risk_level.dart' show RiskLevel;
import 'package:secure_device_context/src/enums/secure_context.dart'
    show SecureContext;

export 'src/enums/risk_level.dart';
export 'src/enums/secure_context.dart';

abstract class SecureDeviceContextPlatform extends PlatformInterface {
  /// Constructs a SecureDeviceContextPlatform.
  SecureDeviceContextPlatform() : super(token: _token);

  static final Object _token = Object();

  static SecureDeviceContextPlatform _instance =
      MethodChannelSecureDeviceContext();

  /// The default instance of [SecureDeviceContextPlatform] to use.
  ///
  /// Defaults to [MethodChannelSecureDeviceContext].
  static SecureDeviceContextPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SecureDeviceContextPlatform] when
  /// they register themselves.
  static set instance(SecureDeviceContextPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> isDevMode() {
    throw UnimplementedError('isDevMode() has not been implemented.');
  }

  Future<bool?> isJailbreak() {
    throw UnimplementedError('isJailbreak() has not been implemented.');
  }

  Future<bool?> isEmulator() {
    throw UnimplementedError('isEmulator() has not been implemented.');
  }

  Future<bool?> isDebugMode() {
    throw UnimplementedError('isDebugMode() has not been implemented.');
  }

  Future<Map<String, dynamic>?> status() {
    throw UnimplementedError('status() has not been implemented.');
  }

  Future<List<SecureContext>?> contexts() {
    throw UnimplementedError('contexts() has not been implemented.');
  }

  Future<RiskLevel?> riskLevel() {
    throw UnimplementedError('riskLevel() has not been implemented.');
  }
}
