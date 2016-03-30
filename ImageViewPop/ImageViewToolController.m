//
//  ImageViewToolController.m
//  ImageViewPop
//
//  Created by 温仲斌 on 16/3/24.
//  Copyright © 2016年 温仲斌. All rights reserved.
//

#import "ImageViewToolController.h"

#import "XWAnimation.h"

@interface ImageViewToolController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ImageViewToolController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setModalPresentationStyle:UIModalPresentationCustom];
        [self setTransitioningDelegate:self];
    }
    return self;
}

- (void)awakeFromNib {
    [self setModalPresentationStyle:UIModalPresentationCustom];
    [self setTransitioningDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - View controller transitioning delegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [XWAnimation new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [XWAnimation new];
}

- (CGRect)imageViewFrameForImage:(UIImage *)image {
    
    CGSize const screenSize = self.view.frame.size;
    CGFloat const screenRatio = screenSize.width / screenSize.height;
    CGFloat const imageRatio = image.size.width / image.size.height;
    
    CGFloat x = 0.0;
    CGFloat y = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    
    if (imageRatio > screenRatio) { // Top-bottom letterboxing
        width = screenSize.width;
        height = width / imageRatio;
        y = (screenSize.height - height) / 2.0;
    } else {                        // Left-right letterboxing
        height = screenSize.height;
        width = height * imageRatio;
        x = (screenSize.width - width) / 2.0;
    }
    
    return CGRectMake(x, y, width, height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
