//
//  JSAddToCartAnmationViewModel.h
//  JSAddToCartAnmation
//
//  Created by 乔同新 on 16/6/7.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSGoodModel,JSAddToCartAnmationVC;

@interface JSAddToCartAnmationViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *goodArrayData;

+ (void)showAddCartAnmationSview:(UIView *)sview
                       imageView:(UIImageView *)imageView
                        starPoin:(CGPoint)startPoint
                        endPoint:(CGPoint)endpoint
                     dismissTime:(float)dismissTime;

- (void)getData;

@end
