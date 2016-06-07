//
//  JSGoodCell.h
//  JSAddToCartAnmation
//
//  Created by 乔同新 on 16/6/7.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JSGoodModel;

typedef void(^JSGoodClickBlock)(UIImageView *imageView);

@interface JSGoodCell : UICollectionViewCell

@property (nonatomic, strong) JSGoodClickBlock goodClickBlock;

@property (nonatomic, strong) JSGoodModel *model;

+ (CGFloat)getGoodCellHeight;

@end
