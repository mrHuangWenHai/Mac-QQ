//
//  ViewController.m
//  QQ
//
//  Created by 黄文海 on 2018/6/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "ViewController.h"
#import "SettingViewController.h"
#import <Quartz/Quartz.h>

@interface ViewController()
@property(nonatomic, strong)NSWindow* settingWindow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:NSTextDidChangeNotification object:nil];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear {
    [super viewWillAppear];
    [self.accountTextFiled becomeFirstResponder];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (void)textFieldChange:(NSNotification*)noti {
    if (self.passTextField.stringValue != nil && ![self.passTextField.stringValue isEqualToString:@""]) {
        self.enterButton.enabled = true;
    } else {
        self.enterButton.enabled = false;
    }
    
}

- (NSWindow*)settingWindow {
    if (!_settingWindow) {
        _settingWindow = [[NSWindow alloc] initWithContentRect:NSMakeRect(self.view.window.frame.origin.x, self.view.window.frame.origin.y, self.view.window.frame.size.width, 100) styleMask:NSWindowStyleMaskTitled backing:NSBackingStoreBuffered defer:true];
        NSStoryboard* board = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
        _settingWindow.contentViewController = (SettingViewController*)[board instantiateControllerWithIdentifier:@"settingVC"];
    }
    return _settingWindow;
}

- (IBAction)showFolder:(NSButton*)button {
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 0.5;
        context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        if (button.state == NSControlStateValueOn) {
            [self.settingWindow.animator setFrame:NSMakeRect(self.view.window.frame.origin.x, self.view.window.frame.origin.y - 80, self.view.window.frame.size.width, 100) display:true];
            [self.view.window addChildWindow:self.settingWindow ordered:NSWindowBelow];
        } else {
            [self.view.window removeChildWindow:self.settingWindow];
            
            [self.settingWindow.animator setFrame:NSMakeRect(self.view.window.frame.origin.x, self.view.window.frame.origin.y, self.view.window.frame.size.width, 100) display:false];
        }
    } completionHandler:^{
        
    }];
    
}

- (IBAction)closeLoginWindow:(id)sender {
    [NSApp terminate:sender];
}
- (IBAction)enter:(id)sender {
    NSLog(@"qqq");
}

@end
