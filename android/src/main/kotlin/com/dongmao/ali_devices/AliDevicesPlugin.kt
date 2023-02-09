package com.dongmao.ali_devices

import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import net.security.device.api.SecurityInitListener

/** AliDevicesPlugin */
class AliDevicesPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private var context: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "ali_devices")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if (call.method == "securityInit") {
            var securityId = call.argument<String>("securityId")
            context?.let {
                if (securityId != null) {
                    SecurityManager.init(it, securityId, object : SecurityInitListener {
                        override fun onInitFinish(code: Int) {
                            result.success(code)
                        }
                    })
                }
            }
        }else if(call.method == "getDeviceSecurityToken") {
           SecurityManager.getDeviceSecurityToken(result)
        }else if(call.method == "getDeviceResult"){
            SecurityManager.getDeviceResult(result)
        }
        else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
