//
//  JSAddToCartUIService.h
//  JSAddToCartAnmation
//
//  Created by 乔同新 on 16/6/7.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JSAddToCartAnmationViewModel,JSAddToCartAnmationVC;

@interface JSAddToCartUIService : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) JSAddToCartAnmationViewModel *viewModel;

@property (nonatomic, weak) JSAddToCartAnmationVC *addCartVC;

@end
