import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'secure_device_context_platform_interface.dart';

/// An implementation of [SecureDeviceContextPlatform] that uses method channels.
class MethodChannelSecureDeviceContext extends SecureDeviceContextPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('secure_device_context');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
