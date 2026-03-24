package id.nesd.secure_device_context_plugin

import android.content.Context
import id.nesd.secure_device_context.SecureDeviceContext
import id.nesd.secure_device_context_plugin.enums.SecureDeviceContextMethod
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/**
 * Evaluates method channel calls emitted from Dart, translating method names mapping against `SecureDeviceContextMethod` configurations. 
 * Resolves environmental queries regarding the device environment natively using `SecureDeviceContext`.
 */
class SecureDeviceContextPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    /** Bootstraps the plugin channel upon initialization context. */
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "secure_device_context")
        context = flutterPluginBinding.applicationContext
        channel.setMethodCallHandler(this)
    }

    /** Translates Dart invoke mappings to their respective functional targets within Android contexts. */
    override fun onMethodCall(call: MethodCall, result: Result) {
        val secureContext = SecureDeviceContext(context)
        val method = SecureDeviceContextMethod.values().find { it.value == call.method }
        when (method) {
            SecureDeviceContextMethod.IS_DEV_MODE -> {
                result.success(secureContext.isDevMode())
            }

            SecureDeviceContextMethod.IS_JAILBREAK -> {
                result.success(secureContext.isRooted())
            }

            SecureDeviceContextMethod.IS_EMULATOR -> {
                result.success(secureContext.isEmulator())
            }

            SecureDeviceContextMethod.IS_DEBUG_MODE -> {
                result.success(secureContext.isDebugMode())
            }

            SecureDeviceContextMethod.STATUS -> {
                result.success(secureContext.status)
            }

            SecureDeviceContextMethod.CONTEXTS -> {
                result.success(secureContext.contexts.map { it.value })
            }

            SecureDeviceContextMethod.RISK_LEVEL -> {
                result.success(secureContext.riskLevel.value)
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}

