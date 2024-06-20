//
//  AppDelegate.h
//  PasteboardPlayground
//
//

#import <Cocoa/Cocoa.h>
#import "clipboardHandler.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property(strong) clipboardHandler* cH;
@property(strong) NSPasteboard* pB;

@end

