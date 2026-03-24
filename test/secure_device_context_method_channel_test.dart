import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secure_device_context/secure_device_context_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final MethodChannelSecureDeviceContext platform =
      MethodChannelSecureDeviceContext();
  const MethodChannel channel = MethodChannel('secure_device_context');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async => false,
        );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('is_dev_mode', () async {
    expect(await platform.isDevMode(), false);
  });
}
