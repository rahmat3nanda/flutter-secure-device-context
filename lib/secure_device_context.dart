
import 'secure_device_context_platform_interface.dart';

class SecureDeviceContext {
  Future<String?> getPlatformVersion() {
    return SecureDeviceContextPlatform.instance.getPlatformVersion();
  }
}
