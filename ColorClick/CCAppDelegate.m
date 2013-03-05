//
//  CCAppDelegate.m
//  ColorClick
//
//  Created by kazuki on 13/03/05.
//  Copyright (c) 2013年 cybaron. All rights reserved.
//

#import "CCAppDelegate.h"

@implementation CCAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    [self.window makeKeyAndOrderFront:nil];
    return NO;
}
@end
