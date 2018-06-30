//
//  LoginImageButton.m
//  QQ
//
//  Created by 黄文海 on 2018/6/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "LoginImageButton.h"

@interface LoginImageButton()
@property(nonatomic, strong)NSColor* defaultColor;
@property(nonatomic, strong)NSColor* mouseEnteredColor;
@property(nonatomic, assign)CGFloat width;
@property(nonatomic, assign)CGFloat mouseEnteredWidth;
@end

@implementation LoginImageButton

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        self.bordered = false;
        self.imageScaling = NSImageScaleAxesIndependently;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    _width = 1;
    self.layer.cornerRadius = CGRectGetWidth(dirtyRect)/2;
  //  self.layer.masksToBounds = true;
    NSTrackingArea* area = [[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingMouseEnteredAndExited | NSTrackingActiveInActiveApp owner:self userInfo:nil];
    [self addTrackingArea:area];
    [self changeColor:self.defaultColor withWidth:1];
}

- (void)mouseEntered:(NSEvent *)event {
    [self changeColor:self.mouseEnteredColor withWidth:self.mouseEnteredWidth];
}

- (void)mouseExited:(NSEvent *)event {
    [self changeColor:self.defaultColor withWidth:self.width];
}

- (NSColor*)defaultColor {
    if (!_defaultColor) {
        _defaultColor = [NSColor colorWithRed:0.72 green:0.75 blue:0.77 alpha:1];
    }
    return _defaultColor;
}

- (NSColor*)mouseEnteredColor {
    if (!_mouseEnteredColor) {
        _mouseEnteredColor = [NSColor colorWithRed:0.44 green:0.84 blue:0.95 alpha:1];
    }
    return _mouseEnteredColor;
}

- (void)changeColor:(NSColor*)color withWidth:(CGFloat)width {
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

@end
