//
//  XWAnimation.m
//  ImageViewPop
//
//  Created by 温仲斌 on 16/3/24.
//  Copyright © 2016年 温仲斌. All rights reserved.
//

#import "XWAnimation.h"

#import "ImageViewToolController.h"

@implementation XWAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return .5f;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    if ([toViewController isKindOfClass:[ImageViewToolController class]]) {
        [self performPresent:transitionContext];
    } else {
        [self performDismiss:transitionContext];
    }
}

- (void)performPresent:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (void)performDismiss:(id<UIViewControllerContextTransitioning>)transitionContext {
}



@end
