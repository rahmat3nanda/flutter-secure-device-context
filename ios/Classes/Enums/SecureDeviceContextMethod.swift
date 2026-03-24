internal enum SecureDeviceContextMethod: String {
    case isDevMode = "is_dev_mode"
    case isJailbreak = "is_jailbreak"
    case isEmulator = "is_emulator"
    case isDebugMode = "is_debug_mode"
    case status
    case contexts
    case riskLevel = "risk_level"
}
