//
//  TggTagCell.h
//  TggTagView
//
//  Created by 铁拳科技 on 16/9/18.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TggTagAttribute.h"

@interface TggTagCell : UICollectionViewCell


@property (nonatomic, strong) TggTagAttribute *tagAttribute;

@property (nonatomic, copy) NSString *title;




@end
