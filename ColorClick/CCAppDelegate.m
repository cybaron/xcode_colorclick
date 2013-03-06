//
//  CCAppDelegate.m
//  ColorClick
//
//  Created by kazuki on 13/03/05.
//  Copyright (c) 2013年 cybaron. All rights reserved.
//

#import "CCAppDelegate.h"

@interface CCAppDelegate()
- (void)globalMouseMoved:(NSEvent *)event;
@end


@implementation CCAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [super dealloc];
}

- (void)globalMouseMoved:(NSEvent *)event
{
    // 左下原点のマウス座標を取得
    CGEventRef eventRef = CGEventCreate(NULL);
    CGPoint    point    = CGEventGetLocation(eventRef);
    
    //CFEventRefの開放
    CFRelease(eventRef);

    // debug
    NSLog(@"globalMouseMoved: x = %f, y = %f", point.x, point.y);
    
    // キャプチャサイズ
    int size = 11;
    int center = floor(size / 2.0);
    
    // マウス座標を中心にした矩形を作成
    CGRect captureRect = CGRectMake(point.x - center, point.y - center, size, size);
    
    // 画面キャプチャ
    CGImageRef cgImageRef = CGWindowListCreateImage(captureRect, kCGWindowListOptionOnScreenOnly, kCGNullWindowID, kCGWindowImageBoundsIgnoreFraming);
    
    NSBitmapImageRep *bitmap = [[NSBitmapImageRep alloc] initWithCGImage:cgImageRef];
    NSImage *image = [[[NSImage alloc] init] autorelease];
    
    [image addRepresentation:bitmap];
    
    // Image Wellに設定
    self.imageView.image = image;

}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // マウス移動でイベント発生
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSMouseMovedMask handler:^(NSEvent *event) {
        // 自分のglobalMouseMoved:を呼ぶ
        [self globalMouseMoved:event];
    }];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    [self.window makeKeyAndOrderFront:nil];
    return NO;
}
@end
