package id.nesd.secure_device_context.enums

enum class SecureDeviceContextMethod(val value: String) {
    IS_DEV_MODE("is_dev_mode"),
    IS_ROOTED("is_rooted"),
    IS_EMULATOR("is_emulator"),
    IS_DEBUG_MODE("is_debug_mode"),
    STATUS("status"),
    CONTEXTS("contexts"),
    RISK_LEVEL("risk_level")
}