//
//  SecondViewController.m
//  WeexDemo
//
//  Created by brant on 2018/4/8.
//  Copyright © 2018年 Brant. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Weex 打开的页面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label.text = self.url;
    [self.label sizeToFit];
    
    [self.view addSubview:self.label];
    self.label.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textColor = [UIColor redColor];
        _label.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _label;
}

@end
