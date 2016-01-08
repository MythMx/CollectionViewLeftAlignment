//
//  FoodItemGroup.h
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoodItem.h"

@interface FoodItemGroup : NSObject

@property (nonatomic, copy) NSString *type;

@property (nonatomic, strong) NSArray *foodItems;

+ (NSArray *)foodItemGroups;

@end
