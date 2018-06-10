//
//  ViewController.h
//  QQ
//
//  Created by 黄文海 on 2018/6/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LoginAccountTextField.h"
#import "LoginPasswordTextField.h"

@interface ViewController : NSViewController

@property (strong) IBOutlet LoginAccountTextField *accountTextFiled;
@property (strong) IBOutlet LoginPasswordTextField *passTextField;
@property (strong) IBOutlet NSButton *enterButton;

@end

