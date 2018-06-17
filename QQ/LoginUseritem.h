//
//  LoginUseritem.h
//  QQ
//
//  Created by 黄文海 on 2018/6/15.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class LoginUseritem;
typedef void(^HandleClick)(LoginUseritem* login);

@interface LoginUseritem : NSCollectionViewItem
@property(nonatomic, copy)NSString* headUrl;
@property(nonatomic, copy)HandleClick handleClick;
@end
