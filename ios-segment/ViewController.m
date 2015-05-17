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
#define marTop 80
#define topSpan 10
#define imgLen 16
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self segmentSort:2:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)segment_select:(UISegmentedControl *)sender {

    int count = (int)sender.selectedSegmentIndex + 2;
    
    [self segmentSort:count :NO];
}

-(void)segmentSort : (int)colCount : (BOOL) b
{
    //设置动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.5];
    
    //间隔计算
    CGFloat margin = (self.view.bounds.size.width - (imgWH * colCount)) / (colCount + 1);
    
    //其中i是要输出的个数
    for (int i = 0; i < imgLen; i++)
    {
        //计算x,y
        float x = (i % colCount * (imgWH + margin)) + margin;
        float y = (i / colCount * (imgWH + topSpan)) + marTop;

        if(b)
        {
            //保存图表都能显示（总个数为：16）
            int no = i % 16;
            [self addImg:[NSString stringWithFormat:@"%i",no] :x :y];
        }
        else
        {
            //非第一次创建
            //i+3前面还有三个控件
            UIImageView *uiv = self.view.subviews[i+3];
            
            if(uiv)
            {
                CGRect oldRect = uiv.frame;
                oldRect.origin = CGPointMake(x, y);
                uiv.frame = oldRect;
            }
        }
    }
    
    [UIView commitAnimations];
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
