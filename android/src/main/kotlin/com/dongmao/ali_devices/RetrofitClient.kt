package com.dongmao.ali_devices

import okhttp3.Cache
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.io.File
import java.util.concurrent.TimeUnit

object RetrofitClient {
 
    private const val BASE_URL = "http://tst_admin.dongmao-app.com"
 
    private var retrofit: Retrofit? = null
 
    val service: HttpService by lazy {
        getRetrofit().create(HttpService::class.java)
    }
 
    private fun getRetrofit(): Retrofit {
        if (retrofit == null) {
            retrofit = Retrofit.Builder()
                .baseUrl(BASE_URL)
                .client(getOkHttpClent())
                .addConverterFactory(GsonConverterFactory.create())
                //.addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .build()
        }
        return retrofit!!
    }
 
 
    private fun getOkHttpClent(): OkHttpClient {
        val builder = OkHttpClient().newBuilder()
 
//        val cacheFile = File(MyApplication.instance.cacheDir, "cache")
//        val cache = Cache(cacheFile, 1024 * 1024 * 50)// 50M 的缓存大小
 
        builder.run {
//            cache(cache)
            connectTimeout(60, TimeUnit.SECONDS)
            readTimeout(60, TimeUnit.SECONDS)
            writeTimeout(60, TimeUnit.SECONDS)
            retryOnConnectionFailure(true)//错误重连
        }
 
        return builder.build()
    }
 
}