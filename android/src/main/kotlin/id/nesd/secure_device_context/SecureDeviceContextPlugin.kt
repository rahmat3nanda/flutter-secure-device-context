package id.nesd.secure_device_context

import android.content.Context
import id.nesd.secure_device_context.enums.SecureDeviceContextMethod
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** SecureDeviceContextPlugin */
class SecureDeviceContextPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "secure_device_context")
        context = flutterPluginBinding.applicationContext
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        val secureContext = SecureDeviceContext(context)
        val method = SecureDeviceContextMethod.valueOf(call.method)
        when (method) {
            SecureDeviceContextMethod.IS_DEV_MODE -> {
                result.success(secureContext.isDevMode())
            }

            SecureDeviceContextMethod.IS_ROOTED -> {
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
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}

