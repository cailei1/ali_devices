import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ali_devices/ali_devices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  String _token = 'Unknown';
  final _aliDevicesPlugin = AliDevices();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initDevice();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
           'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('设备唯一id获取'),
        ),
        body: Center(
          child: Column(
            children: [
              // Text('Running on: $_platformVersion\n'),
              SizedBox(height: 50,),
              InkWell(
                  onTap: () async {
                    String? token =
                        await _aliDevicesPlugin.getDeviceResult();
                    _token = token!;
                    print(_token);
                    setState(() {});
                  },
                  child: Text("点击获取设备唯一id")),
              SizedBox(height: 30,),
              Text('Device id: $_token\n'),
            ],
          ),
        ),
      ),
    );
  }

  void initDevice() async {
    _aliDevicesPlugin.securityInit("c5ff29da0098abfbb0391f61d7190823");
  }
}
