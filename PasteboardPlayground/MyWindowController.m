//
//  MyWindowController.m
//  PasteboardPlayground
//
//
#import "AppDelegate.h"
#import "MyWindowController.h"
#import "clipboardHandler.h"
@interface MyWindowController ()

@end

@implementation MyWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    self.window.delegate=self;
    self.app = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (BOOL)windowShouldClose:(NSNotification *)notification {
    NSPasteboardType customType = @"dyn.lab";
    
    //We do not need to send an alert as there is no data to remove from the clipboard
    if (![[self.app.pB types]containsObject:customType ])
    {
        return YES;
    }
    
    NSAlert *alert = [[NSAlert alloc] init] ;

    [alert addButtonWithTitle:@"Retain Clipboard Data"];
    [alert addButtonWithTitle:@"Delete Clipboard Data"];
    [alert setMessageText:@"Clear Clipboard Data"];
    [alert setInformativeText:@"Retaining Clipboard Data will allow for copied data to be used when the application is closed."];
    [alert setAlertStyle:NSAlertStyleInformational];
  
   NSModalResponse clickedButton = [alert runModal];
    
        if (clickedButton == 1000 ){
       
            //Write the file location to the clipboard for use on subsequent run
            
            NSURL *url = [NSURL fileURLWithPath:@"tempFile.txt"];
            NSData *data = [[url path] dataUsingEncoding:NSUTF8StringEncoding];
            [self.app.pB setData:data forType:customType];
                
        }
        if (clickedButton == 1001){
            
            //Clear the clipboard and delete the temporaryFile on disk
            NSString *FilePath = [[NSString alloc] initWithFormat:@"tempFile.txt"];
            NSString *deletThis = [NSHomeDirectory()stringByAppendingPathComponent:FilePath];
            NSURL *urlPath = [NSURL fileURLWithPath:deletThis];
            [[NSFileManager defaultManager] removeItemAtURL:urlPath error:nil];
            [self.app.pB clearContents];
        }
           
    return YES;
}
@end
