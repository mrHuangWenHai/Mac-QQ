//
//  LoginAccountTextField.m
//  QQ
//
//  Created by 黄文海 on 2018/6/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "LoginAccountTextField.h"
@interface LoginAccountTextField()<NSTextFieldDelegate>
@property(nonatomic, copy)NSString* phString;
@end

@implementation LoginAccountTextField

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    self.delegate = self;
    self.phString = self.placeholderString;
}

- (void)mouseDown:(NSEvent *)event {
    [self.currentEditor selectAll:nil];
    self.placeholderString = @"";
}

- (void)controlTextDidEndEditing:(NSNotification *)obj {
    self.placeholderString = @"请输入账号";
}

@end
