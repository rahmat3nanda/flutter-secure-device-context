import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:secure_device_context/secure_device_context.dart';
import 'package:secure_device_context/secure_device_context_method_channel.dart';
import 'package:secure_device_context/secure_device_context_platform_interface.dart';

class MockSecureDeviceContextPlatform
    with MockPlatformInterfaceMixin
    implements SecureDeviceContextPlatform {
  @override
  Future<bool?> isDebugMode() => Future<bool>.value(false);

  @override
  Future<bool?> isDevMode() => Future<bool>.value(false);

  @override
  Future<bool?> isEmulator() => Future<bool>.value(false);

  @override
  Future<bool?> isJailbreak() => Future<bool>.value(false);

  @override
  Future<List<SecureContext>?> contexts() => Future<List<SecureContext>>.value(
    <SecureContext>[SecureContext.emulator],
  );

  @override
  Future<RiskLevel?> riskLevel() => Future<RiskLevel>.value(RiskLevel.warning);

  @override
  Future<Map<String, dynamic>?> status() => Future<Map<String, dynamic>>.value(
    <String, dynamic>{'emulator': true, 'risk_level': 'warning'},
  );
}

void main() {
  final SecureDeviceContextPlatform initialPlatform =
      SecureDeviceContextPlatform.instance;

  test('$MethodChannelSecureDeviceContext is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSecureDeviceContext>());
  });

  test('is_dev_mode', () async {
    final SecureDeviceContext secureDeviceContextPlugin = SecureDeviceContext();
    final MockSecureDeviceContextPlatform fakePlatform =
        MockSecureDeviceContextPlatform();
    SecureDeviceContextPlatform.instance = fakePlatform;

    expect(await secureDeviceContextPlugin.isDevMode, false);
  });
}
