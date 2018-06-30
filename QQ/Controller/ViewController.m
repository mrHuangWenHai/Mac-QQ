//
//  ViewController.m
//  QQ
//
//  Created by 黄文海 on 2018/6/4.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "ViewController.h"
#import "SettingViewController.h"
#import <Quartz/Quartz.h>
#import "LoginUseritem.h"
#import "LoginImageButton.h"
#import "StatusButton.h"

@interface ViewController()<NSCollectionViewDataSource, NSCollectionViewDelegate>
@property(nonatomic, strong)NSWindow* settingWindow;
@property(nonatomic, strong)NSArray* headImageArray;
@property(nonatomic, strong)LoginImageButton* loginImageButton;
@property(nonatomic, assign)CGRect lastRect;
@property(nonatomic, strong)StatusButton* statusButton;
@property (strong) IBOutlet NSCollectionView *headCollectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange:) name:NSTextDidChangeNotification object:nil];
    
    self.headCollectionView.dataSource = self;
    self.headCollectionView.delegate = self;
    self.headImageArray = @[@"2_01", @"2_02", @"2_03", @"2_04", @"2_05"];
    self.headCollectionView.hidden = true;

    self.loginImageButton.image = [NSImage imageNamed:self.headImageArray[0]];
    self.loginImageButton.frame = NSMakeRect(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 + 10, 100, 100);
    [self.view addSubview:self.loginImageButton];
    
    self.statusButton = [[StatusButton alloc] initWithFrame:CGRectMake( CGRectGetWidth(self.loginImageButton.frame) / 2 - 10, CGRectGetHeight(self.loginImageButton.frame) - 16, 20, 20)];
    self.statusButton.image = [NSImage imageNamed:@"online"];
    self.statusButton.bordered = false;
    [self.loginImageButton addSubview:self.statusButton];
    
    self.lastRect = [self.view convertRect:NSMakeRect(0, 0, 40, 40) fromView:self.headCollectionView];
//    [self.headCollectionView registerNib:[[NSNib alloc] initWithNibNamed:@"LoginUseritem" bundle:nil] forItemWithIdentifier:@"LoginUseritem"];
}

- (void)viewWillAppear {
    [super viewWillAppear];
    [self.accountTextFiled becomeFirstResponder];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

- (void)textFieldChange:(NSNotification*)noti {
    if (self.passTextField.stringValue != nil && ![self.passTextField.stringValue isEqualToString:@""]) {
        self.enterButton.enabled = true;
    } else {
        self.enterButton.enabled = false;
    }
}

- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"enter"]) {
        [self.view.window close];
    }
}

- (NSWindow*)settingWindow {
    if (!_settingWindow) {
        _settingWindow = [[NSWindow alloc] initWithContentRect:NSMakeRect(self.view.window.frame.origin.x, self.view.window.frame.origin.y, self.view.window.frame.size.width, 100) styleMask:NSWindowStyleMaskTitled backing:NSBackingStoreBuffered defer:true];
        NSStoryboard* board = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
        _settingWindow.contentViewController = (SettingViewController*)[board instantiateControllerWithIdentifier:@"settingVC"];
    }
    return _settingWindow;
}

- (IBAction)showFolder:(NSButton*)button {
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 0.5;
        context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        if (button.state == NSControlStateValueOn) {
            [self.settingWindow.animator setFrame:NSMakeRect(self.view.window.frame.origin.x, self.view.window.frame.origin.y - 80, self.view.window.frame.size.width, 100) display:true];
            [self.view.window addChildWindow:self.settingWindow ordered:NSWindowBelow];
        } else {
            [self.view.window removeChildWindow:self.settingWindow];
            
            [self.settingWindow.animator setFrame:NSMakeRect(self.view.window.frame.origin.x, self.view.window.frame.origin.y, self.view.window.frame.size.width, 100) display:false];
        }
    } completionHandler:^{
        
    }];
    
}

- (IBAction)closeLoginWindow:(id)sender {
    [NSApp terminate:sender];
}

- (IBAction)enter:(id)sender {
    NSLog(@"qqq");
}

//MARK NSCollectionViewDataSource
- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    LoginUseritem* userItem = [collectionView makeItemWithIdentifier:@"LoginUseritem" forIndexPath:indexPath];
    userItem.headUrl = self.headImageArray[indexPath.item];
    __weak typeof(self) weakSelf = self;
    userItem.handleClick = ^(LoginUseritem* userItem) {
        [weakSelf showLoginAccountWithClickItem:userItem];
    };
    
    return userItem;
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.headImageArray.count;
}

- (void)showLoginAccountWithClickItem:(LoginUseritem*)userItem {
    
    CGRect lastRect = [self.view convertRect:userItem.view.frame fromView:self.headCollectionView];
    self.lastRect = lastRect;
    self.loginImageButton.frame = lastRect;
    self.loginImageButton.image = [NSImage imageNamed:userItem.headUrl];
    [self.view addSubview:self.loginImageButton];
    self.headCollectionView.hidden = true;
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 0.5;
        context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [self.loginImageButton.animator setFrame:NSMakeRect(self.view.frame.size.width / 2 - 50, self.view.frame.size.height / 2 + 10, 100, 100)];
    } completionHandler:^{
        
    }];
}

- (LoginImageButton*)loginImageButton {
    if (!_loginImageButton) {
        _loginImageButton = [[LoginImageButton alloc] init];
        _loginImageButton.action = @selector(showCollectionView);
    }
    return _loginImageButton;
}

- (void)showCollectionView {
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 0.5;
        context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [self.loginImageButton.animator setFrame:self.lastRect];
    } completionHandler:^{
        [self.loginImageButton removeFromSuperview];
        self.headCollectionView.hidden = false;
    }];
}

@end
