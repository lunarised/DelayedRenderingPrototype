//
//  clipboardHandler.m
//  PasteboardPlayground
//
//

#import "clipboardHandler.h"

@implementation clipboardHandler

- (void) pasteboard:(NSPasteboard *)sender provideDataForType:(NSPasteboardType)type{
    NSPasteboardType customType = @"dyn.lab";
    
    //Grab the data responsibe for providing information for the render
    NSString *inputText = self.inputString;
    if (type == NSPasteboardTypeString){
        NSData *data =[inputText  dataUsingEncoding:NSUTF8StringEncoding];
        [sender setData:data forType:NSPasteboardTypeString];
    }
    
    else if(type == customType){
        
            //Delete our custom formatted file from disk since we want to rewrite the contents
        
            NSString *FilePath = [[NSString alloc] initWithFormat:@"tempFile.txt"];
            NSString *deletThis = [NSHomeDirectory()stringByAppendingPathComponent:FilePath];
            NSURL *urlPath = [NSURL fileURLWithPath:deletThis];
            [[NSFileManager defaultManager] removeItemAtURL:urlPath error:nil];
        
            //Writing a datetime to this so we can prove that the data truly is generated on the render
            //and that additional pastes do not rerender the custom datatype
            NSData *fileContents = [[NSDateFormatter localizedStringFromDate:[NSDate now] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle ]dataUsingEncoding:NSUTF8StringEncoding];
        
        
        
            [[NSFileManager defaultManager] createFileAtPath:@"tempFile.txt" contents:fileContents attributes:nil];

            NSURL *url = [NSURL fileURLWithPath:@"tempFile.txt"];
            NSData *data = [[url path] dataUsingEncoding:NSUTF8StringEncoding];
            [sender setData:data forType:customType];
    }
}

- (void) pasteboardChangedOwner:(NSPasteboard *)sender{
}

@end
