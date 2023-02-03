package com.dongmao.ali_devices

import ThreadPoolManager
import android.content.Context
import io.flutter.plugin.common.MethodChannel
import net.security.device.api.SecurityCode
import net.security.device.api.SecurityDevice
import net.security.device.api.SecurityInitListener

object SecurityManager {
    fun init(context: Context, userAppKey: String, securityInitListener: SecurityInitListener) {
        SecurityDevice.getInstance().init(context, userAppKey, securityInitListener)
    }

    fun getDeviceSecurityToken(result: MethodChannel.Result) {
        ThreadPoolManager.getInstance().addTask("deviceToken", object : Runnable {
            override fun run() {
                var securityToken = SecurityDevice.getInstance().deviceToken
                if (SecurityCode.SC_SUCCESS == securityToken.code) {
                    result.success(securityToken.token)
                }
            }

        })

    }

    fun getDeviceResult(){
        SecurityDevice.getInstance()
    }
}