//
//  clipboardHelper.h
//  PasteboardPlayground
//
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
NS_ASSUME_NONNULL_BEGIN

@interface clipboardHelper : NSObject
+ (BOOL) isDataRenderedOnPasteboard:(NSPasteboard *)pb ofType:(NSPasteboardType) type;
@end

NS_ASSUME_NONNULL_END
