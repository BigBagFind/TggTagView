//
//  TggTagView.h
//  TggTagView
//
//  Created by 铁拳科技 on 16/9/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TggTagViewLayout;
@class TggTagAttribute;

@interface TggTagView : UIView


/** 传入的标签数组 */
@property (nonatomic,strong) NSArray *tagArray;

/** 标签样式对象 */
@property (nonatomic,strong) TggTagAttribute *tagAttribute;


/** 刷新数据 */
- (void)reloadData;



@property (nonatomic, strong) TggTagViewLayout *layout;

@property (nonatomic, strong) UICollectionView *collectionView;





@end
