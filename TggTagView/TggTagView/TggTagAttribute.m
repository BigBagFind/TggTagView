//
//  TggTagAttribute.m
//  TggTagView
//
//  Created by 铁拳科技 on 16/9/18.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TggTagAttribute.h"

@implementation TggTagAttribute



- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

/** 默认初始化 */
- (void)initialize {
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    
    UIColor *normalColor = [UIColor colorWithRed:b/255.0 green:r/255.0 blue:g/255.0 alpha:1.0];
    UIColor *normalBackgroundColor = [UIColor clearColor];
    UIColor *selectedBackgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    
    _borderWidth = 0.5f;
    _borderColor = normalColor;
    _cornerRadius = 8.0;
    _normalBackgroundColor = normalBackgroundColor;
    _selectedBackgroundColor = selectedBackgroundColor;
    _titleSize = 14;
    _textColor = normalColor;
    _tagSpace = 5;
}

@end
