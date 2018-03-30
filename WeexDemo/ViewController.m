//
//  ViewController.m
//  WeexDemo
//
//  Created by brant on 2018/3/30.
//  Copyright © 2018年 Brant. All rights reserved.
//

#import "ViewController.h"
#import "WeexViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openWeexPage:(id)sender {
    WeexViewController *vc = [[WeexViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
