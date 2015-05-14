//
//  ViewController.m
//  ios-segment
//
//  Created by apple on 15/5/14.
//  Copyright (c) 2015年 HanHe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define imgWH 40
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self segmentSort:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)segment_select:(UISegmentedControl *)sender {

    NSLog(@"你选择的是：%li",(long)[sender selectedSegmentIndex]);
}

-(void)segmentSort : (int)colCount
{
    //间隔计算
    CGFloat margin = (self.view.bounds.size.width - (imgWH * colCount)) / (colCount + 1);
    
    
    //其中i是要输出的个数
    for (int i = 0; i < 18; i++)
    {
        //计算x,y
        float x = (i % colCount * (imgWH + margin)) + margin;
        float y = (i / colCount * (imgWH+10)) + 80;
        
        NSLog(@">>> %i",(i / colCount));
        
        
        [self addImg:[NSString stringWithFormat:@"%i",i] :x :y];
    }
}

#pragma mark - 生成图片方法
-(void)addImg : (NSString*) name : (float)x : (float)y
{
    UIImageView *img = [[UIImageView alloc] init];
    img.image = [UIImage imageNamed:[NSString stringWithFormat:@"face%@.png",name]];
    img.frame = CGRectMake(x, y, imgWH, imgWH);
    
    [self.view addSubview:img];
}
@end
