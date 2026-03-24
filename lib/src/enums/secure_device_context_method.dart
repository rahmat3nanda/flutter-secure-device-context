enum SecureDeviceContextMethod {
  isDevMode('is_dev_mode'),
  isJailbreak('is_jailbreak'),
  isEmulator('is_emulator'),
  isDebugMode('is_debug_mode'),
  status('status'),
  contexts('contexts'),
  riskLevel('risk_level');

  const SecureDeviceContextMethod(this.value);

  final String value;
}
