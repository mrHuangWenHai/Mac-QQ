//
//  StatusButton.m
//  QQ
//
//  Created by 黄文海 on 2018/6/16.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "StatusButton.h"

@implementation StatusButton

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        
    }
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
}

@end
