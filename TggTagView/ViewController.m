//
//  ViewController.m
//  TggTagView
//
//  Created by 铁拳科技 on 16/9/14.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "ViewController.h"
#import "TggTagView.h"
#import "TggTagViewLayout.h"

@interface ViewController ()

@property TggTagView *tagView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _tagView = [TggTagView new];
    _tagView.frame = CGRectMake(0, 150, 375, 300);
    [self.view addSubview:_tagView];
    _tagView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.1];
    
    NSArray *tagData = @[
                         @"爱疯七",
                         @"爱拍得云空气二256G",
                         @"爱剖得四",
                         @"麦克布克铺肉128G8G闪存Retina屏幕",
                         @"EarPods耳机1288元",
                         @"iPhone 7 Plus Black 258G",
                         @"iPhone 7亮黑色"
                         ];
    _tagView.tagArray = tagData;
    [_tagView reloadData];
    
    __weak __typeof(self)weakSelf = self;
    _tagView.layout.CompleteBlock = ^(CGFloat height) {
        NSLog(@"%lf",height);
        weakSelf.tagView.frame = CGRectMake(0, 150, 375, height);
    };
    
    

}

@end
