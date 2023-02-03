import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ali_devices/ali_devices_method_channel.dart';

void main() {
  MethodChannelAliDevices platform = MethodChannelAliDevices();
  const MethodChannel channel = MethodChannel('ali_devices');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
