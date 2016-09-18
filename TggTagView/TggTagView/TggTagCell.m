//
//  TggTagCell.m
//  TggTagView
//
//  Created by 铁拳科技 on 16/9/18.
//  Copyright © 2016年 铁哥哥. All rights reserved.
//

#import "TggTagCell.h"

@interface TggTagCell ()

@property (nonatomic ,strong) UILabel *titleLabel;


@end

@implementation TggTagCell

- (void)setTitle:(NSString *)title {
    if (_title != title) {
        _title = title;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = self.bounds;
    
    self.backgroundColor = _tagAttribute.normalBackgroundColor;
    self.layer.borderColor = _tagAttribute.borderColor.CGColor;
    self.layer.cornerRadius = _tagAttribute.cornerRadius;
    self.layer.borderWidth = _tagAttribute.borderWidth;
    self.titleLabel.textColor = _tagAttribute.textColor;
    self.titleLabel.font = [UIFont systemFontOfSize:_tagAttribute.titleSize];
    self.titleLabel.text = _title;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.titleLabel.text = @"";
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}




@end
