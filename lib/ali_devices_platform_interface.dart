import 'dart:ffi';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ali_devices_method_channel.dart';

abstract class AliDevicesPlatform extends PlatformInterface {
  /// Constructs a AliDevicesPlatform.
  AliDevicesPlatform() : super(token: _token);

  static final Object _token = Object();

  static AliDevicesPlatform _instance = MethodChannelAliDevices();

  /// The default instance of [AliDevicesPlatform] to use.
  ///
  /// Defaults to [MethodChannelAliDevices].
  static AliDevicesPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AliDevicesPlatform] when
  /// they register themselves.
  static set instance(AliDevicesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getDeviceUUID() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Int?> securityInit(String securityId) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getDeviceSecurityToken() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }


  Future<String?> getDeviceResult() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

}
