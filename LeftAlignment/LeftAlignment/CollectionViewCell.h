//
//  CollectionViewCell.h
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItem.h"

@class CollectionViewCell;

@protocol CollectionViewCellDelegate <NSObject>

- (void)collectionViewCell:(CollectionViewCell *)cell didSelectedFoodItem:(FoodItem *)foodItem;

@end

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) FoodItem *foodItem;

@property (weak, nonatomic) id<CollectionViewCellDelegate> delegate;

@end
