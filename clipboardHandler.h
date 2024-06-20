

//
//  clipboardHandler.h
//  PasteboardPlayground
//
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>


NS_ASSUME_NONNULL_BEGIN

@interface clipboardHandler : NSObject <NSPasteboardTypeOwner>

- (void)pasteboard:(NSPasteboard *)sender provideDataForType:(NSPasteboardType)type;
- (void)pasteboardChangedOwner:(NSPasteboard *)sender;
@property (strong) NSString *inputString;

@end

NS_ASSUME_NONNULL_END
