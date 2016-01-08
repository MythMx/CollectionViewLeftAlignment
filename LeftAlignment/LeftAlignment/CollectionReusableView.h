//
//  CollectionReusableView.h
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodItemGroup.h"

@interface CollectionReusableView : UICollectionReusableView

@property (nonatomic, strong) FoodItemGroup *itemGroup;

@end
