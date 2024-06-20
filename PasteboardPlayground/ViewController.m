//
//  ViewController.m
//  PasteboardPlayground
//
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "clipboardHelper.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.app = (AppDelegate*)[[NSApplication sharedApplication] delegate];
    // Do any additional setup after loading the view.
}

- (IBAction)pasteOverride:(id)sender{
    NSPasteboardType customType = @"dyn.lab";
    
    NSArray<NSPasteboardType> *renderableTypesArr = [[NSArray alloc] initWithObjects:customType, NSPasteboardTypeString, nil];

    //Determine the types that the pasteboard can currently render
    NSSet *availableRenderTypes = [NSSet setWithArray:[self.app.pB types]];
    //Determine the types that our application will support
    NSMutableSet *availableRenderableSet = [NSMutableSet setWithArray:renderableTypesArr];
    //Find the intersection which will be all renderable types
    [availableRenderableSet intersectSet:availableRenderTypes];
    
    
    
    if(![availableRenderTypes containsObject:customType]){
        NSString *FilePath = [[NSString alloc] initWithFormat:@"tempFile.txt"];
        NSString *deletThis = [NSHomeDirectory()stringByAppendingPathComponent:FilePath];
        NSURL *urlPath = [NSURL fileURLWithPath:deletThis];
        [[NSFileManager defaultManager] removeItemAtURL:urlPath error:nil];
    }
    
    //Do The Actual Render To The Clipboard
    for (NSPasteboardType renderType in availableRenderableSet) {
        if (![clipboardHelper isDataRenderedOnPasteboard:self.app.pB ofType:renderType]){
            [self.app.cH pasteboard:self.app.pB provideDataForType: renderType];
        }
    }
    
    
    //Do the paste operations
    
    //Read from the clipboard
    NSData *outpa = [self.app.pB dataForType:customType];
    NSData *outpFormatted = [self.app.pB dataForType:NSPasteboardTypeString];
    

    //Formatting from NSData to NSString
    NSString *outpString = [[NSString alloc] initWithData:outpa encoding:NSUTF8StringEncoding];
    NSString *outpStringFormatted = [[NSString alloc] initWithData:outpFormatted encoding:NSUTF8StringEncoding];
    
    //Read data from a file location stored on the clipboard
   // NSFileHandle *fH = [NSFileHandle fileHandleForReadingAtPath:outpString];
   // NSData *fileContents = [fH readDataToEndOfFile];
   // NSString *fileString = [[NSString alloc] initWithData:fileContents encoding:NSUTF8StringEncoding];
   
    //Write data to labels
    [_textRender setStringValue:outpStringFormatted];
    [_customRender setStringValue: outpString];
}

- (IBAction) copyOverride:(id) sender{
    NSPasteboardType customType = @"dyn.lab";
    //Lets dump the previous contents of the clipboard
    [self.app.pB clearContents];
    //Declare the types the clipboard can handle
    [self.app.pB declareTypes:[NSArray arrayWithObjects: NSPasteboardTypeString, customType, nil] owner:self.app.cH ];
    
    //Since we are adding a promise to the clipboard and no data, the material needed to render the data must
    //be held as state inside the application
    
    self.app.cH.inputString = [_inputBox stringValue];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    // Update the view, if already loaded.
}

@end

