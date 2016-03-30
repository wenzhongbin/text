//
//  ViewController.m
//  ImageViewPop
//
//  Created by 温仲斌 on 16/3/24.
//  Copyright © 2016年 温仲斌. All rights reserved.
//

#import "ViewController.h"

#import "ImageViewBac.h"

#import "ImageViewToolController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.view addSubview:i];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tap:(id)sender {
    NSLog(@"点击");
//        ImageViewBac *i = [[ImageViewBac alloc]init];
//    [i showImageView:_image withImage:_image.image];
//    [self.view addSubview:i];
    ImageViewToolController *ima = [[ImageViewToolController alloc]init];
    [self presentViewController:ima animated:YES completion:nil];
}

@end
