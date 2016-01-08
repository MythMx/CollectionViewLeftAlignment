//
//  FoodItem.m
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import "FoodItem.h"

@implementation FoodItem

+ (instancetype)foodItemsWithDict:(NSDictionary *)dict
{
    FoodItem *item = [[FoodItem alloc] init];
    item.title = dict[@"Food_Name"];
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = kFoodItemTitleFont;
    
    item.width = [item.title boundingRectWithSize:CGSizeMake(MAXFLOAT, kFoodItemHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size.width + 20;
    
    return item;
}

@end
