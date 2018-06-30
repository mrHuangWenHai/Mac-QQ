//
//  SearchTextField.m
//  QQ
//
//  Created by 黄文海 on 2018/6/29.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "SearchTextField.h"
@interface SearchTextField()
@property(nonatomic, assign)BOOL isSelect;
@end

@implementation SearchTextField

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    self.layer.cornerRadius = CGRectGetHeight(dirtyRect)/2;
    self.layer.masksToBounds = true;
    
    self.layer.borderColor = [NSColor whiteColor].CGColor;
    self.layer.borderWidth = 2;
//    if (!self.isSelect) {
        [self addSubview:self.imageView];
 //   }

}

- (NSImageView*)imageView {
    if (!_imageView) {
        _imageView = [[NSImageView alloc] initWithFrame:CGRectMake(1, 1, 20, 20)];
        _imageView.image = [NSImage imageNamed:@"04"];
    }
    return _imageView;
}

- (void)mouseDown:(NSEvent *)event {
    [super mouseDown:event];
    self.isSelect = true;
    [self.imageView removeFromSuperview];
}

@end
