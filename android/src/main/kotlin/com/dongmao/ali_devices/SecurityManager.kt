package com.dongmao.ali_devices

import ThreadPoolManager
import android.content.Context
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import net.security.device.api.SecurityCode
import net.security.device.api.SecurityDevice
import net.security.device.api.SecurityInitListener
import retrofit2.Response

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

    fun getDeviceResult(result: MethodChannel.Result) {
        ThreadPoolManager.getInstance().addTask("deviceToken", object : Runnable {
            override fun run() {
                var securityToken = SecurityDevice.getInstance().deviceToken
                if (SecurityCode.SC_SUCCESS == securityToken.code) {
                    var resp: Response<BaseResp<DeviceUUID>?>? = RetrofitClient.service.getRequest(
                        "741c33a3d6698ce18392feb43c1e2cf6", securityToken.token
                    )?.execute()
                    val deviceId = resp?.body()?.data?.UDID
                    if (deviceId != null) {
                        Log.e("token", deviceId)
                    };
                    result.success(deviceId)
                }
            }

        })
    }
}