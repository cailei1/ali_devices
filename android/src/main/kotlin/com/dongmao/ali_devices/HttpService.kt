package com.dongmao.ali_devices

import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.GET
import retrofit2.http.Path
import retrofit2.http.Query


interface HttpService {


    @GET("v2/mobile/saf/device/get")
    open fun getRequest(@Query("deviceToken") deviceToken: String?): Call<BaseResp<String>?>?


}
