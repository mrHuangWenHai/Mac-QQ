//
//  MessageViewController.m
//  QQ
//
//  Created by 黄文海 on 2018/6/30.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageCellView.h"
#import "ChatTextView.h"

@interface MessageViewController ()<NSTableViewDelegate, NSTableViewDataSource>
@property (strong) IBOutlet NSView *topView;
@property (strong) IBOutlet NSTextField *titleLabel;
@property (strong) IBOutlet NSTableView *messageList;
@property (strong) IBOutlet NSView *toolView;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.messageList.dataSource = self;
    self.messageList.delegate = self;
    self.messageList.rowHeight = 65;
    self.messageList.tableColumns.firstObject.width = 200;
    
    self.topView.wantsLayer = true;
    self.topView.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    self.toolView.wantsLayer = true;
    self.toolView.layer.backgroundColor = [NSColor colorWithRed:0.99 green:0.99 blue:0.99 alpha:1].CGColor;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 5;
}

- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    MessageCellView* messageCell = [tableView makeViewWithIdentifier:@"head" owner:self];
    if (!messageCell) {
        messageCell = [[MessageCellView alloc] init];
        messageCell.identifier = @"head";
    }
    return messageCell;
}

@end
