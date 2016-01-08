//
//  FoodItem.h
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFoodItemHeight 30
#define kFoodItemTitleFont [UIFont systemFontOfSize:15.0f]

@interface FoodItem : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) CGFloat width;

+ (instancetype)foodItemsWithDict:(NSDictionary *)dict;

@end
