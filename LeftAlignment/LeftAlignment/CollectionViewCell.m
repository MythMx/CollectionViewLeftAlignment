//
//  CollectionViewCell.m
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()

@property (nonatomic, weak) UIButton *button;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupTitleButton];
    }
    return self;
}

- (void)setupTitleButton
{
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = kFoodItemTitleFont;
    [button addTarget:self action:@selector(selectedFoodItem) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    self.button = button;
}

- (void)setFoodItem:(FoodItem *)foodItem
{
    _foodItem = foodItem;
    
    [self.button setTitle:foodItem.title forState:UIControlStateNormal];
}

- (void)selectedFoodItem
{
    if ([self.delegate respondsToSelector:@selector(collectionViewCell:didSelectedFoodItem:)]) {
        [self.delegate collectionViewCell:self didSelectedFoodItem:self.foodItem];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.button.frame = self.contentView.bounds;
}

@end
