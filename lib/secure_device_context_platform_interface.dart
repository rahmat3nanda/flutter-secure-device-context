import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'secure_device_context_method_channel.dart';

abstract class SecureDeviceContextPlatform extends PlatformInterface {
  /// Constructs a SecureDeviceContextPlatform.
  SecureDeviceContextPlatform() : super(token: _token);

  static final Object _token = Object();

  static SecureDeviceContextPlatform _instance = MethodChannelSecureDeviceContext();

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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
