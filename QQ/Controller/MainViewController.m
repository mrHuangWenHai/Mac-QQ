//
//  MainViewController.m
//  QQ
//
//  Created by 黄文海 on 2018/6/29.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "MainViewController.h"
#import "SearchTextField.h"
#import "MessageViewController.h"
#import "FriendViewController.h"
#import "ApplicationViewController.h"

@interface MainViewController ()
@property (strong) IBOutlet NSView *toolBarView;
@property (strong) IBOutlet NSButton *messageButton;
@property (strong) IBOutlet NSButton *friendButton;
@property (strong) IBOutlet NSButton *applicationButton;
@property (strong) IBOutlet SearchTextField *searchField;
@property (strong, nonatomic) NSTabView* tabView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = true;
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;

    self.toolBarView.wantsLayer = true;
    self.toolBarView.layer.backgroundColor = [NSColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1].CGColor;
    
    [self.view addSubview:self.tabView];
}

- (IBAction)messageAction:(NSButton *)sender {
    sender.image = [NSImage imageNamed:@"message_blue"];
    self.friendButton.image = [NSImage imageNamed:@"friend_gray"];
    self.applicationButton.image = [NSImage imageNamed:@"application_gray"];
    [self.tabView selectTabViewItemAtIndex:0];

}

- (IBAction)friendAction:(NSButton *)sender {
    sender.image = [NSImage imageNamed:@"friend_blue"];
    self.messageButton.image = [NSImage imageNamed:@"message_gray"];
    self.applicationButton.image = [NSImage imageNamed:@"application_gray"];
    [self.tabView selectTabViewItemAtIndex:1];

}

- (IBAction)applicationAction:(NSButton *)sender {
    sender.image = [NSImage imageNamed:@"application_blue"];
    self.messageButton.image = [NSImage imageNamed:@"message_gray"];
    self.friendButton.image = [NSImage imageNamed:@"friend_gray"];
    [self.tabView selectTabViewItemAtIndex:2];
}

- (void)mouseDown:(NSEvent *)event {
    [super mouseDown:event];
    [self.searchField.window makeFirstResponder:nil];
    NSLog(@"huang");
}

- (NSTabView *)tabView {
    if (!_tabView) {
        _tabView = [[NSTabView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 54)];
        _tabView.tabPosition = NSTabPositionNone;
        _tabView.tabViewBorderType = NSTabViewBorderTypeNone;
        _tabView.wantsLayer = true;
        _tabView.layer.backgroundColor = [NSColor redColor].CGColor;
        
        MessageViewController* messageController = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"message"];
        NSTabViewItem* messageItem = [NSTabViewItem tabViewItemWithViewController:messageController];
        [_tabView addTabViewItem:messageItem];
        
        FriendViewController* friendController = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"friend"];
        NSTabViewItem* friendItem = [NSTabViewItem tabViewItemWithViewController:friendController];
        [_tabView addTabViewItem:friendItem];
        
        ApplicationViewController* applicationController = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"application"];
        NSTabViewItem* applicatItem = [NSTabViewItem tabViewItemWithViewController:applicationController];
        [_tabView addTabViewItem:applicatItem];
    
    }
    return _tabView;
}

@end
