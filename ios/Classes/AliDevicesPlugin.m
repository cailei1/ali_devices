#import "AliDevicesPlugin.h"
#if __has_include(<ali_devices/ali_devices-Swift.h>)
#import <ali_devices/ali_devices-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ali_devices-Swift.h"
#endif

@implementation AliDevicesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAliDevicesPlugin registerWithRegistrar:registrar];
}
@end
