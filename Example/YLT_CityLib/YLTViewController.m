//
//  YLTViewController.m
//  YLT_CityLib
//
//  Created by xphaijj on 11/30/2017.
//  Copyright (c) 2017 xphaijj. All rights reserved.
//

#import "YLTViewController.h"
#import <YLT_CityLib/YLT_CityLib.h>

@interface YLTViewController ()

@end

@implementation YLTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [YLT_CityView showWithConfig:^(YLT_CityConfig *config) {
        config.superView = self.view;
        config.contents = @[@"1234", @"12344"];
        config.levelCount = 3;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
