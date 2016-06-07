//
//  JSAddToCartAnmationVC.m
//  JSAddToCartAnmation
//
//  Created by 乔同新 on 16/6/7.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "JSAddToCartAnmationVC.h"
#import "JSAddToCartUIService.h"
#import "JSAddToCartAnmationViewModel.h"

@interface JSAddToCartAnmationVC()

@property (nonatomic, strong) UICollectionView             *collectionView;

@property (nonatomic, strong) JSAddToCartUIService         *serivce;

@property (nonatomic, strong) JSAddToCartAnmationViewModel *viewModel;

@end

@implementation JSAddToCartAnmationVC

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.viewModel getData];
    [self.collectionView reloadData];
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.title = @"加入购物车";
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self.view addSubview:self.collectionView];

    
}

- (JSAddToCartUIService *)serivce{
    if (!_serivce) {
        _serivce = [[JSAddToCartUIService alloc] init];
        _serivce.viewModel = self.viewModel;
        _serivce.addCartVC = self;
    }
    return _serivce;
}

- (JSAddToCartAnmationViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[JSAddToCartAnmationViewModel alloc] init];
    }
    return _viewModel;
}

- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                             collectionViewLayout:layOut];
        _collectionView.dataSource = self.serivce;
        _collectionView.delegate   = self.serivce;
        [_collectionView registerClass:NSClassFromString(@"JSGoodCell")
            forCellWithReuseIdentifier:@"JSGoodCell"];
        _collectionView.backgroundColor = XNColor(240, 240, 240, 1);
    }
    return _collectionView;
}

@end
