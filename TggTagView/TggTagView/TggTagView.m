//
//  TggTagView.m
//  TggTagView
//
//  Created by 铁拳科技 on 16/9/15.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TggTagView.h"
#import "TggTagCell.h"
#import "TggTagAttribute.h"
#import "TggTagViewLayout.h"


static NSString *identifier = @"TagViewCellReuseIdentifier";

@interface TggTagView () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;



@end


@implementation TggTagView


- (void)reloadData {
    [self.collectionView reloadData];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareView];
    }
    return self;
}


- (void)prepareView {
    
    TggTagViewLayout *layout = [[TggTagViewLayout alloc] init];
    layout.minimumLineSpacing = 16;
    layout.minimumInteritemSpacing = 16;
    layout.sectionInset = UIEdgeInsetsMake(16, 16, 16, 16);
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    [self addSubview:self.collectionView];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[TggTagCell class] forCellWithReuseIdentifier:identifier];
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    if (!self.tagAttribute) {
        self.tagAttribute = [TggTagAttribute new];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}


#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _tagArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TggTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.tagAttribute = self.tagAttribute;
    cell.title = _tagArray[indexPath.item];
    
    return cell;
}


#pragma mark - UICollectionView DelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    TggTagViewLayout *layout = (TggTagViewLayout *)collectionView.collectionViewLayout;
    CGSize maxSize = CGSizeMake(collectionView.frame.size.width - layout.sectionInset.left - layout.sectionInset.right, layout.itemSize.height);
    
    CGRect frame = [_tagArray[indexPath.item] boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:_tagAttribute.titleSize]} context:nil];
    
    return CGSizeMake(frame.size.width + _tagAttribute.tagSpace, layout.itemSize.height);
}










@end
