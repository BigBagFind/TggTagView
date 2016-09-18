//
//  ViewController.m
//  TggTagView
//
//  Created by 铁拳科技 on 16/9/14.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "ViewController.h"
#import "TggTagView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    TggTagView *tagView = [TggTagView new];
    tagView.frame = CGRectMake(0, 150, 375, 300);
    [self.view addSubview:tagView];
    tagView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1];
    
    NSArray *tagData = @[
                         @"爱疯七",
                         @"爱拍得云空气二256G",
                         @"爱剖得四",
                         @"麦克布克铺肉128G8G闪存Retina屏幕",
                         @"EarPods耳机1288元"
                         ];
    tagView.tagArray = tagData;
    [tagView reloadData];
    
    
}

@end
