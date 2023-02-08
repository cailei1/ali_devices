package com.dongmao.ali_devices


data class BaseResp<T>(
    val code: Int, val msg: String, var data: T
)


