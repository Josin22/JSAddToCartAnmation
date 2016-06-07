//
//  JSAddToCartAnmationViewModel.m
//  JSAddToCartAnmation
//
//  Created by 乔同新 on 16/6/7.
//  Copyright © 2016年 乔同新. All rights reserved.
//

#import "JSAddToCartAnmationViewModel.h"
#import "JSGoodModel.h"
#import "JSAddToCartAnmationVC.h"

@interface JSAddToCartAnmationViewModel()

@property (nonatomic, assign) NSInteger random;

@property (nonatomic, strong) NSArray *nameArray;

@property (nonatomic, strong) NSArray *priceArray;

@property (nonatomic, strong) NSArray *imageUrlArray;

@end


@implementation JSAddToCartAnmationViewModel


- (NSInteger)random{
    
    NSInteger from = 0;
    NSInteger to   = 4;
    
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
    
}

- (NSArray *)nameArray{
 
    if (!_nameArray) {
        _nameArray = [NSArray array];
        _nameArray = @[@"端午节粽子大有优惠 买一增一",
                       @"端午节粽子大有优惠 买20增0",
                       @"端午节粽子大有优惠 买⑩增7",
                       @"端午节粽子大有优惠 买8增11",
                       @"端午节粽子大有优惠 买21增一"];
    }
    return _nameArray;
}

- (NSArray *)priceArray{
    
    if (!_priceArray) {
        _priceArray = [NSArray array];
        _priceArray = @[@"123.00",
                        @"893.00",
                        @"24.00",
                        @"12.00",
                        @"112.00"];
    }
    return _priceArray;
}
- (NSArray *)imageUrlArray{
    
    if (!_imageUrlArray) {
        _imageUrlArray = [NSArray array];
        _imageUrlArray = @[@"http://pic.5tu.cn/uploads/allimg/1606/pic_5tu_big_2016052901023305535.jpg",
                           @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023303745.jpg",
                           @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_201605291711245481.jpg",
                           @"http://pic.5tu.cn/uploads/allimg/1605/pic_5tu_big_2016052901023285762.jpg",
                           @"http://pic.5tu.cn/uploads/allimg/1506/091630516760.jpg"];
    }
    return _imageUrlArray;
}


- (void)getData{

    NSMutableArray *data = [NSMutableArray array];
    for (int i = 0; i<20; i++) {
        JSGoodModel *model = [[JSGoodModel alloc] init];
        model.p_name = self.nameArray[self.random];
        model.p_price = self.priceArray[self.random];
        model.p_imageurl = self.imageUrlArray[self.random];
        [data addObject:model];
    }
    
    self.goodArrayData = data;
}

+ (void)showAddCartAnmationSview:(UIView *)sview
                       imageView:(UIImageView *)imageView
                        starPoin:(CGPoint)startPoint
                        endPoint:(CGPoint)endpoint
                     dismissTime:(float)dismissTime
{
    __block CALayer *layer;
    layer                               = [[CALayer alloc]init];
    layer.contents                      = imageView.layer.contents;
    layer.frame                         = imageView.frame;
    layer.opacity                       = 1;
    [sview.layer addSublayer:layer];
    UIBezierPath *path                  = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    //贝塞尔曲线控制点
    float sx                            = startPoint.x;
    float sy                            = startPoint.y;
    float ex                            = endpoint.x;
    float ey                            = endpoint.y;
    float x                             = sx + (ex - sx) / 3;
    float y                             = sy + (ey - sy) * 0.5 - 400;
    CGPoint centerPoint                 = CGPointMake(x, y);
    [path addQuadCurveToPoint:endpoint controlPoint:centerPoint];
    //设置位置动画
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path                      = path.CGPath;
    animation.removedOnCompletion       = NO;
    //设置大小动画
    CGSize finalSize                    = CGSizeMake(imageView.image.size.height*0.1, imageView.image.size.width*0.1);
    CABasicAnimation *resizeAnimation   = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    resizeAnimation.removedOnCompletion = NO;
    [resizeAnimation setToValue:[NSValue valueWithCGSize:finalSize]];
    //旋转
    CABasicAnimation* rotationAnimation;
    rotationAnimation                   = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue           = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.cumulative        = YES;
    rotationAnimation.duration          = 0.3;
    rotationAnimation.repeatCount       = 1000;
    //动画组
    CAAnimationGroup * animationGroup   = [[CAAnimationGroup alloc] init];
    animationGroup.animations           = @[animation,resizeAnimation,rotationAnimation];
    animationGroup.delegate             = self;
    animationGroup.duration             = 0.6;
    animationGroup.removedOnCompletion  = NO;
    animationGroup.fillMode             = kCAFillModeForwards;
    animationGroup.autoreverses         = NO;
    animationGroup.timingFunction       = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [layer addAnimation:animationGroup forKey:@"buy"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(dismissTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [layer removeFromSuperlayer];
        layer = nil;
    });
}
@end
