//
//  LoginWindowController.m
//  QQ
//
//  Created by 黄文海 on 2018/6/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "LoginWindowController.h"

@interface LoginWindowController ()

@end

@implementation LoginWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    NSButton* closeButton = [self.window standardWindowButton:NSWindowCloseButton];
    closeButton.hidden = true;
    NSButton* min = [self.window standardWindowButton:NSWindowMiniaturizeButton];
    min.hidden = true;
    [self.window standardWindowButton:NSWindowZoomButton].hidden = true;
    
    self.window.backgroundColor = [NSColor whiteColor];
    self.window.movableByWindowBackground = true;
    
}

@end
