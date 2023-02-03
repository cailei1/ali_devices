#include "include/ali_devices/ali_devices_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "ali_devices_plugin.h"

void AliDevicesPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  ali_devices::AliDevicesPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
