//
//  ImageViewBac.m
//  ImageViewPop
//
//  Created by 温仲斌 on 16/3/24.
//  Copyright © 2016年 温仲斌. All rights reserved.
//

#import "ImageViewBac.h"

@implementation ImageViewBac{
    UIImageView *imageView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.backgroundColor = [UIColor blackColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
//        imageView.layer.mask = [CALayer layer];
        [self addSubview:imageView];
    }
    return self;
}


- (void)showImageView:(UIImageView *)showImageView withImage:(UIImage *)image {
    imageView.hidden = YES;
    imageView.image = image;
    self.alpha = 0;
    UIView *tempView = [showImageView snapshotViewAfterScreenUpdates:YES];
    [self addSubview:tempView];
    CGFloat W;
    CGFloat H;
    if (imageView.image.size.width > CGRectGetWidth(self.bounds)) {
        W = CGRectGetWidth(self.bounds);
        H = (W / imageView.image.size.width) * imageView.image.size.height;
    }else if (imageView.image.size.height > CGRectGetHeight(self.bounds)) {
        H = imageView.image.size.height;
        W =(H / imageView.image.size.height) * imageView.image.size.width;
    }else {
        W = imageView.image.size.width ;
        H = imageView.image.size.height;
    }
//    tempView.bounds = [imageView convertRect:CGRectMake(0, 0, W, H) toView:self];
    NSLog(@"H : %@  V : %@", @(H), @(W));
    //开始做动画
    [UIView animateWithDuration:.5f delay:0.0 usingSpringWithDamping:0.75 initialSpringVelocity:1 / 0.75 options:0 animations:^{
        tempView.center = [imageView convertPoint:self.center toView:self];
        tempView.bounds = CGRectMake(0, 0, W, H);
        self.alpha = 1;
    } completion:^(BOOL finished) {
        tempView.hidden = YES;
        imageView.hidden = NO;
    }];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
