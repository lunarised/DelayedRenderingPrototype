//
//  AppDelegate.m
//  PasteboardPlayground
//
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)application{
    return YES;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.cH = [clipboardHandler new];
    self.pB = [NSPasteboard generalPasteboard];
}

- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return NO;
}


@end
