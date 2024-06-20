//
//  clipboardHandler.h
//  PasteboardPlayground
//
//

#import <Cocoa/Cocoa.h>
#import "clipboardHandler.h"
#import "AppDelegate.h"
@interface ViewController : NSViewController

@property(strong) IBOutlet NSTextField* inputBox;
@property(strong) IBOutlet NSTextField* pasteBox;


@property(strong) IBOutlet NSTextField* textRender;
@property(strong) IBOutlet NSTextField* customRender;
@property(strong) AppDelegate* app;
- (IBAction) copyOverride:(id) sender;
- (IBAction) pasteOverride:(id)sender;
@end

