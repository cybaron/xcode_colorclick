//
//  CCAppDelegate.h
//  ColorClick
//
//  Created by kazuki on 13/03/05.
//  Copyright (c) 2013年 cybaron. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CCAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSImageCell *imageView;
@property (assign) IBOutlet NSBox *colorBox;
@property (assign) IBOutlet NSTextField *colorLabel;

@end
