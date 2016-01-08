//
//  ViewController.m
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "CollectionReusableView.h"
#import "LeftAlignmentFlowLayout.h"

#import "FoodItem.h"
#import "FoodItemGroup.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionViewCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *foodItemGroups;

@end

@implementation ViewController


static NSString * const headerIdentifier = @"CollectionReusableView";
static NSString * const cellIdentifier = @"CollectionViewCell";


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.foodItemGroups = [FoodItemGroup foodItemGroups];
    
    [self.collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
    LeftAlignmentFlowLayout *flowLayout = [[LeftAlignmentFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.collectionView setCollectionViewLayout:flowLayout animated:YES];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.foodItemGroups.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    FoodItemGroup *foodItemGroup = self.foodItemGroups[section];
    
    return foodItemGroup.foodItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    FoodItemGroup *foodItemGroup = self.foodItemGroups[indexPath.section];
    cell.foodItem = foodItemGroup.foodItems[indexPath.item];

    cell.delegate = self;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
    
    view.itemGroup = self.foodItemGroups[indexPath.section];
    
    view.backgroundColor = [UIColor grayColor];
    
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FoodItemGroup *foodItemGroup = self.foodItemGroups[indexPath.section];
    FoodItem *foodItem = foodItemGroup.foodItems[indexPath.item];
    
    return CGSizeMake(foodItem.width, kFoodItemHeight);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.bounds.size.width, 30);
}

- (void)collectionViewCell:(CollectionViewCell *)cell didSelectedFoodItem:(FoodItem *)foodItem
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:foodItem.title delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
