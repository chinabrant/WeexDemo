//
//  WXRouterModule.m
//  WeexDemo
//
//  Created by brant on 2018/4/8.
//  Copyright © 2018年 Brant. All rights reserved.
//

#import "WXRouterModule.h"
#import "SecondViewController.h"
#import "AppDelegate.h"

@implementation WXRouterModule

WX_EXPORT_METHOD(@selector(pushUrl:))

- (void)pushUrl:(NSString *)url {
    dispatch_async(dispatch_get_main_queue(), ^{
        SecondViewController *vc = [[SecondViewController alloc] init];
        [((UINavigationController *) [UIApplication sharedApplication].keyWindow.rootViewController) pushViewController:vc animated:YES];
    });
    
}

@end
