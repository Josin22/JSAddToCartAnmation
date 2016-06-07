//
//  JSGoodCell.m
//  JSAddToCartAnmation
//
//  Created by 乔同新 on 16/6/7.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "JSGoodCell.h"
#import "JSGoodModel.h"

@interface JSGoodCell()

@property (nonatomic, strong) UIImageView *goodsImageView;
@property (nonatomic, retain) UILabel     *goodsNameLabel;
@property (nonatomic, retain) UILabel     *goodsPriceLabel;
@property (nonatomic, strong) UIButton    *addCartButton;

@end

@implementation JSGoodCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initHomeGoodsUI];
       
    }
    return self;
}

- (void)initHomeGoodsUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    _goodsImageView = [[UIImageView alloc] init];
//    _goodsImageView.backgroundColor = XNColor(210, 210, 210, 1);
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:_goodsImageView];
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.height.mas_equalTo(self.width-10);
    }];
    
    _goodsNameLabel = [[UILabel alloc] init];
    _goodsNameLabel.numberOfLines = 2;
    _goodsNameLabel.font = XNFont(13);
    _goodsNameLabel.text = @"这是一款商品 这是一款商品 这是一款商品";
    _goodsNameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_goodsNameLabel];
    [_goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsImageView.mas_bottom).with.offset(0);
        make.left.mas_equalTo(3);
        make.right.mas_equalTo(-3);
    }];
    
    _goodsPriceLabel = [[UILabel alloc] init];
    _goodsPriceLabel.textColor = [UIColor redColor];
    _goodsPriceLabel.font  = XNFont(17);
    _goodsPriceLabel.text = @"￥20";
    [self.contentView addSubview:_goodsPriceLabel];
    _goodsPriceLabel.adjustsFontSizeToFitWidth = YES;
    [_goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-8);
        make.left.mas_equalTo(2);
        make.width.mas_equalTo(self.width/2-2);
    }];
    
    _addCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addCartButton setImage:[UIImage imageNamed:@"js_addcart"]
                    forState:UIControlStateNormal];
    [_addCartButton addTarget:self
                       action:@selector(addCartClick:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_addCartButton];
    [_addCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-5);
        make.right.mas_equalTo(-5);
    }];
    
}

- (void)setModel:(JSGoodModel *)model{
    
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:model.p_imageurl]
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                  if (cacheType == SDImageCacheTypeNone || cacheType == SDImageCacheTypeDisk) {
                                      _goodsImageView.image = image;
                                      _goodsImageView.alpha = 0;
                                      _goodsImageView.scale = 1.25;
                                      [UIView animateWithDuration:0.4
                                                       animations:^{
                                                           _goodsImageView.alpha = 1;
                                                           _goodsImageView.scale = 1;
                                                       }];
                                  } else {
                                      _goodsImageView.image = image;
                                      _goodsImageView.alpha = 1;
                                      _goodsImageView.scale = 1;
                                  }
                              }];
    _goodsNameLabel.text = model.p_name;
    
    _goodsPriceLabel.text = [NSString stringWithFormat:@"￥%.2f",model.p_price.floatValue];
}

- (void)addCartClick:(UIButton *)btn{
    
    if (self.goodClickBlock) {
        self.goodClickBlock(_goodsImageView);
    }
    
}

+ (CGFloat)getGoodCellHeight{
    
    return (((XNWindowWidth-15)/2)+65);
}

@end
