//
//  LeftAlignmentFlowLayout.m
//  LeftAlignment
//
//  Created by liu on 16/1/7.
//  Copyright © 2016年 vizz. All rights reserved.
//

#import "LeftAlignmentFlowLayout.h"

@implementation LeftAlignmentFlowLayout

- (instancetype)init
{
    if (self = [super init]) {
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return self;
}

- (void)prepareLayout
{
    [super prepareLayout];
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attributes in attributesArray) {
        
        if (attributes.representedElementCategory == UICollectionElementCategoryCell) {
            //每组的cell
            attributes.frame = [self layoutAttributesForItemAtIndexPath:attributes.indexPath].frame;
        } else if (attributes.representedElementCategory == UICollectionElementCategorySupplementaryView) {
            //每组的header
            attributes.frame = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:attributes.indexPath].frame;
        }
    }
    
    return attributesArray;
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *currentAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    //每组第一个item，显示在左上角
    if (indexPath.item == 0) {
        CGRect frame = currentAttributes.frame;
        frame.origin.x = self.sectionInset.top;
        frame.origin.y = self.sectionInset.left;
        return currentAttributes;
    }
    
    //前一个item的indexPath
    NSIndexPath *previousPath = [NSIndexPath indexPathForItem:indexPath.item - 1 inSection:indexPath.section];
    
    //前一个item的rect
    CGRect previousAttributesRect = [self layoutAttributesForItemAtIndexPath:previousPath].frame;
    
    //前一个item做大的X值
    CGFloat previousAttributesMaxX = CGRectGetMaxX(previousAttributesRect);
    
    //设置当前item默认的位置
    CGFloat currentAttributesX = previousAttributesMaxX + self.minimumInteritemSpacing;
    CGFloat currentAttributesY = previousAttributesRect.origin.y;
    CGFloat currentAttributesWidth = currentAttributes.frame.size.width;
    CGFloat currentAttributesHeight = currentAttributes.frame.size.height;
    
    //计算每行最大可以显示的宽度
    CGFloat lineMaxWidth = self.collectionView.bounds.size.width - self.sectionInset.left - self.sectionInset.right;
    
    //如果当前item宽度大于每行最大值，设置为每行最大值
    if (currentAttributesWidth > lineMaxWidth) {
        currentAttributesWidth = lineMaxWidth;
    }
    
    //假设当前item拼接前一个item后，最大的X值
    CGFloat expectedMaxX = currentAttributesX + currentAttributes.bounds.size.width + self.minimumInteritemSpacing;
    
    //如果超出了范围，调到下一行
    if (expectedMaxX > lineMaxWidth) {
        currentAttributesX = self.sectionInset.left;
        currentAttributesY = CGRectGetMaxY(previousAttributesRect) + self.minimumLineSpacing;
    }
    
    currentAttributes.frame = CGRectMake(currentAttributesX, currentAttributesY, currentAttributesWidth, currentAttributesHeight);
    
    return currentAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    return [super layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:indexPath];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewLayoutAttributes *supplementaryAttributes = [super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath];
    
//    supplementaryAttributes.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    return supplementaryAttributes;
}

@end
