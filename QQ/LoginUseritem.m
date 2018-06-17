//
//  LoginUseritem.m
//  QQ
//
//  Created by 黄文海 on 2018/6/15.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "LoginUseritem.h"
#import "LoginImageButton.h"

@interface LoginUseritem ()
@property (strong) IBOutlet LoginImageButton *imageButton;
@end

@implementation LoginUseritem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)setHeadUrl:(NSString *)headUrl {
    _headUrl = headUrl;
    self.imageButton.image = [NSImage imageNamed:_headUrl];
}

- (IBAction)handleClick:(NSButton *)sender {
    self.handleClick(self);
}

@end
