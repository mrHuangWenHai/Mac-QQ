//
//  MessageCellView.h
//  QQ
//
//  Created by 黄文海 on 2018/6/30.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MessageCellView : NSTableCellView
@property(nonatomic, strong)NSImageView* headImageView;
@property(nonatomic, strong)NSTextField* nameLabel;
@property(nonatomic, strong)NSTextField* firstMessageLabel;
@end
