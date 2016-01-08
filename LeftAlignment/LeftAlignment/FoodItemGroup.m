//
//  FoodItemGroup.m
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import "FoodItemGroup.h"

@implementation FoodItemGroup

+ (NSArray *)foodItemGroups
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *groupArry = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *groups = [NSMutableArray array];
    
    for (NSDictionary *groupDict in groupArry) {
        
        FoodItemGroup *group = [[FoodItemGroup alloc] init];
        group.type = groupDict[@"Type"];
        
        NSArray *itemArray = groupDict[@"Symptoms"];
        NSMutableArray *items = [NSMutableArray array];
        
        for (NSDictionary *itemDict in itemArray) {
            FoodItem *item = [FoodItem foodItemsWithDict:itemDict];
            [items addObject:item];
        }
        
        group.foodItems = items;
        [groups addObject:group];
    }
    
    return groups;
}

@end
