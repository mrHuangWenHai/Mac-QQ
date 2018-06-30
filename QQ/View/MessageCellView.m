//
//  MessageCellView.m
//  QQ
//
//  Created by 黄文海 on 2018/6/30.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "MessageCellView.h"

@implementation MessageCellView

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews {
    _headImageView = [[NSImageView alloc] initWithFrame:NSMakeRect(10, 10, 40, 40)];
    _headImageView.image = [NSImage imageNamed:@"2_02"];
    [self addSubview:_headImageView];
    
    _nameLabel = [[NSTextField alloc] initWithFrame:NSMakeRect(55, 10 + 40 - 22.5, 140, 22.5)];
    _nameLabel.editable = false;
    _nameLabel.bordered = false;
    _nameLabel.stringValue = @"test";
    _nameLabel.backgroundColor = [NSColor clearColor];
    _nameLabel.font = [NSFont fontWithName:@"Helvetica-Bold" size:17];
    [self addSubview:_nameLabel];
    
    _firstMessageLabel = [[NSTextField alloc] initWithFrame:NSMakeRect(55, 10, 140, 22.5)];
    _firstMessageLabel.editable = false;
    _firstMessageLabel.bordered = false;
    _firstMessageLabel.stringValue = @"hello world";
    _firstMessageLabel.backgroundColor = [NSColor clearColor];
    _firstMessageLabel.textColor = [NSColor grayColor];
    [self addSubview:_firstMessageLabel];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
}

@end
