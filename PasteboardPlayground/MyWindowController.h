//
//  MyWindowController.h
//  PasteboardPlayground
//
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyWindowController : NSWindowController<NSWindowDelegate,NSAlertDelegate>
@property(strong) AppDelegate* app;
@end

NS_ASSUME_NONNULL_END
