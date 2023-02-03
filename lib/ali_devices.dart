import 'dart:ffi';

import 'ali_devices_platform_interface.dart';

class AliDevices {
  Future<String?> getPlatformVersion() {
    return AliDevicesPlatform.instance.getPlatformVersion();
  }

  Future<String?> getDeviceUUID() {
    return AliDevicesPlatform.instance.getDeviceUUID();
  }

  Future<Int?> securityInit(String securityId) {
    return AliDevicesPlatform.instance.securityInit(securityId);
  }

  Future<String?> getDeviceSecurityToken() {
    return AliDevicesPlatform.instance.getDeviceSecurityToken();
  }
}
