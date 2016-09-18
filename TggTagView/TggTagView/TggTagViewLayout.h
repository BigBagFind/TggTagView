//
//  TggTagViewLayout.h
//  TggTagView
//
//  Created by 铁拳科技 on 16/9/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef void(^Block)(CGFloat contentHeight);
@interface TggTagViewLayout : UICollectionViewFlowLayout


@property (nonatomic, copy) void(^CompleteBlock)(CGFloat contentHeight);



@end
