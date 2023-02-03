import 'package:flutter_test/flutter_test.dart';
import 'package:ali_devices/ali_devices.dart';
import 'package:ali_devices/ali_devices_platform_interface.dart';
import 'package:ali_devices/ali_devices_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAliDevicesPlatform
    with MockPlatformInterfaceMixin
    implements AliDevicesPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AliDevicesPlatform initialPlatform = AliDevicesPlatform.instance;

  test('$MethodChannelAliDevices is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAliDevices>());
  });

  test('getPlatformVersion', () async {
    AliDevices aliDevicesPlugin = AliDevices();
    MockAliDevicesPlatform fakePlatform = MockAliDevicesPlatform();
    AliDevicesPlatform.instance = fakePlatform;

    expect(await aliDevicesPlugin.getPlatformVersion(), '42');
  });
}
