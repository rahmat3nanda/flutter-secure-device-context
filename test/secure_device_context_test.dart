import 'package:flutter_test/flutter_test.dart';
import 'package:secure_device_context/secure_device_context.dart';
import 'package:secure_device_context/secure_device_context_platform_interface.dart';
import 'package:secure_device_context/secure_device_context_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSecureDeviceContextPlatform
    with MockPlatformInterfaceMixin
    implements SecureDeviceContextPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SecureDeviceContextPlatform initialPlatform = SecureDeviceContextPlatform.instance;

  test('$MethodChannelSecureDeviceContext is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSecureDeviceContext>());
  });

  test('getPlatformVersion', () async {
    SecureDeviceContext secureDeviceContextPlugin = SecureDeviceContext();
    MockSecureDeviceContextPlatform fakePlatform = MockSecureDeviceContextPlatform();
    SecureDeviceContextPlatform.instance = fakePlatform;

    expect(await secureDeviceContextPlugin.getPlatformVersion(), '42');
  });
}
