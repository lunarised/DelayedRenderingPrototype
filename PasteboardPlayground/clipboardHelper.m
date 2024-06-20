//
//  clipboardHelper.m
//  PasteboardPlayground
//
//

#import "clipboardHelper.h"
#import <Foundation/Foundation.h>
@implementation clipboardHelper

+ (BOOL) isDataRenderedOnPasteboard:(NSPasteboard *)pb ofType:(NSPasteboardType) type {
    NSData *output = [pb dataForType:type];
    NSString *a = [[NSString alloc] initWithData:output encoding:NSUTF8StringEncoding];
    if(a.length != 0){
        return YES;
    }
    return NO;
}



@end
