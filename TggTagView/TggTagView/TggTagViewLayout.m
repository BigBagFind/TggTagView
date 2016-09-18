//
//  TggTagViewLayout.m
//  TggTagView
//
//  Created by 铁拳科技 on 16/9/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TggTagViewLayout.h"

@interface TggTagViewLayout ()

@property (nonatomic, weak) id<UICollectionViewDelegateFlowLayout> delegate;

@property (nonatomic, strong) NSMutableArray *itemAttributes;

@property (nonatomic, assign) CGFloat contentWidth;//滑动宽度 水平

@property (nonatomic, assign) CGFloat contentHeight;//滑动高度 垂直


@end

@implementation TggTagViewLayout


- (NSMutableArray *)itemAttributes {
    if (!_itemAttributes) {
        _itemAttributes = [NSMutableArray array];
    }
    return _itemAttributes;
}


- (void)prepareLayout {
    [super prepareLayout];
    
    self.itemSize = CGSizeMake(100.0f, 34.0f);
    [self.itemAttributes removeAllObjects];
    
    //滑动的宽度 = 左边
    self.contentWidth = self.sectionInset.left;
    
    //cell的高度 = 顶部 + 高度
    self.contentHeight = self.sectionInset.top + self.itemSize.height;
    
    CGFloat originX = self.sectionInset.left;
    CGFloat originY = self.sectionInset.top;
    
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger i = 0; i < itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        CGSize itemSize = [self itemSizeForIndexPath:indexPath];

        if (self.scrollDirection == UICollectionViewScrollDirectionVertical) {
            //垂直滚动
            if ((originX + itemSize.width + self.sectionInset.right / 2) > self.collectionView.frame.size.width) {
                originX = self.sectionInset.left;
                originY += itemSize.height + self.minimumLineSpacing;
                
                self.contentHeight += itemSize.height + self.minimumLineSpacing;
            }
        } else {
            self.contentWidth += itemSize.width + self.minimumInteritemSpacing;
        }
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = CGRectMake(originX, originY, itemSize.width, itemSize.height);
        
        [self.itemAttributes addObject:attributes];
        
        originX += itemSize.width + self.minimumInteritemSpacing;
    }
    
    self.contentHeight += self.sectionInset.bottom;
    //NSLog(@"%lf",self.contentHeight);
    
    if (self.contentHeight > 0) {
        self.CompleteBlock(self.contentHeight);
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.itemAttributes;
}


- (id<UICollectionViewDelegateFlowLayout>)delegate {
    if (!_delegate) {
        _delegate =  (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    }
    return _delegate;
}


- (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        self.itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    }
    return self.itemSize;
}


@end
