//
//  MainWindowController.m
//  QQ
//
//  Created by 黄文海 on 2018/6/29.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "MainWindowController.h"
#import "SearchTextField.h"

@interface MainWindowController ()
@property (strong) IBOutlet NSToolbarItem *searchItem;
@property (strong) IBOutlet NSToolbar *toolBar;
@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    self.window.titlebarAppearsTransparent=YES;
    self.window.titleVisibility = NSWindowTitleHidden;
    self.window.movableByWindowBackground = true;
 //   searchBarItem.view = (NSView*)searchBarItem;
  //  [self.toolBar removeItemAtIndex:0];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
