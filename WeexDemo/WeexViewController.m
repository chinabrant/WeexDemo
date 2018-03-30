//
//  WeexViewController.m
//  WeexDemo
//
//  Created by brant on 2018/3/30.
//  Copyright © 2018年 Brant. All rights reserved.
//

#import "WeexViewController.h"
#import <WeexSDK.h>

@interface WeexViewController () 

@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;

@end

@implementation WeexViewController

- (void)dealloc {
    [_instance destroyInstance];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    _instance.onFailed = ^(NSError *error) {
        //process failure
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        //process renderFinish
    };
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"js"];
    
    [_instance renderWithURL:url options:@{@"bundleUrl":[url absoluteString]} data:nil];
}



@end
