import 'package:secure_device_context/src/extensions/list+indexable.dart';

/// Identifies specific security vulnerabilities or contexts detected on the device.
enum SecureContext {
  jailbreak('jailbreak'),
  emulator('emulator'),
  debugMode('debug_mode'),
  devMode('dev_mode');

  const SecureContext(this.value);

  final String value;

  static SecureContext? fromValue(String value) => SecureContext.values
      .firstWhereOrNull((SecureContext e) => e.value == value);
}
