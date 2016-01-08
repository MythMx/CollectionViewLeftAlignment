//
//  CollectionReusableView.m
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import "CollectionReusableView.h"

@interface CollectionReusableView()

@property (nonatomic, weak) UILabel *typeLabel;

@end

@implementation CollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel *typeLabel = [[UILabel alloc] init];
        typeLabel.font = [UIFont systemFontOfSize:16.0f];
        typeLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:typeLabel];
        self.typeLabel = typeLabel;
    }
    return self;
}

- (void)setItemGroup:(FoodItemGroup *)itemGroup
{
    _itemGroup = itemGroup;
    
    self.typeLabel.text = itemGroup.type;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.typeLabel.frame = CGRectMake(20, 0, self.bounds.size.width, self.bounds.size.height);
}


@end
