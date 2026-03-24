import '../extensions/list+indexable.dart';

/// Represents the overall security risk level of the device.
enum RiskLevel {
  /// The device appears to be in a secure state with no risks detected.
  secure('secure'),

  /// The device has moderate risks, such as running on an emulator or with an attached debugger.
  warning('warning'),

  /// The device is in a highly insecure state, such as being jailbroken.
  critical('critical');

  const RiskLevel(this.value);

  final String value;

  static RiskLevel? fromValue(String value) =>
      RiskLevel.values.firstWhereOrNull((RiskLevel e) => e.value == value);
}
