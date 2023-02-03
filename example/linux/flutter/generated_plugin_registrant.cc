//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <ali_devices/ali_devices_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) ali_devices_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AliDevicesPlugin");
  ali_devices_plugin_register_with_registrar(ali_devices_registrar);
}
