//
//  JSAddToCartUIService.m
//  JSAddToCartAnmation
//
//  Created by 乔同新 on 16/6/7.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "JSAddToCartUIService.h"
#import "JSGoodCell.h"
#import "JSAddToCartAnmationViewModel.h"
#import "JSAddToCartAnmationVC.h"

@implementation JSAddToCartUIService

#pragma mark - UICollectionView Delegate/Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.viewModel.goodArrayData.count;
    return count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JSGoodCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSGoodCell"
                                                                 forIndexPath:indexPath];
    
    return [self configureGoodCell:cell indexPath:indexPath];
}

- (JSGoodCell *)configureGoodCell:(JSGoodCell *)cell
                        indexPath:(NSIndexPath *)path{
    
    NSInteger row = path.row;
    
    __weak typeof(self)weakSelf = self;
    
    cell.goodClickBlock = ^(UIImageView *imageGoods){
        
        UIView *view = weakSelf.addCartVC.navigationController.view;
        
        CGPoint startPoint = [view convertPoint:imageGoods.center fromView:imageGoods];
        
        CGFloat width = XNWindowWidth/4;
        
        CGPoint endPoint = CGPointMake(width*2.5, XNWindowHeight - 25);
        
        [JSAddToCartAnmationViewModel showAddCartAnmationSview:view
                                                     imageView:imageGoods
                                                      starPoin:startPoint
                                                      endPoint:endPoint
                                                   dismissTime:0.55];
    };
    
    cell.model = self.viewModel.goodArrayData[row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((XNWindowWidth-15)/2,[JSGoodCell getGoodCellHeight]);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section
{
    return  UIEdgeInsetsMake(5, 5, 5, 5);
}
-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForFooterInSection:(NSInteger)section
{
    
    return CGSizeZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}



@end
