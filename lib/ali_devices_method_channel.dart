import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ali_devices_platform_interface.dart';

/// An implementation of [AliDevicesPlatform] that uses method channels.
class MethodChannelAliDevices extends AliDevicesPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ali_devices');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getDeviceUUID() async {
    final uuid = await methodChannel.invokeMethod<String>('getDeviceUUID');
    return uuid;
  }

  @override
  Future<Int?> securityInit(String securityId) async {
    // TODO: implement securityInit
    final code =
        await methodChannel.invokeMethod("securityInit", <String, dynamic>{
      'securityId': securityId,
    });
    return code;
  }

  @override
  Future<String?> getDeviceSecurityToken() async {
    // TODO: implement getDeviceSecurityToken
    final token = await methodChannel.invokeMethod("getDeviceSecurityToken");
    return token;
  }
}
