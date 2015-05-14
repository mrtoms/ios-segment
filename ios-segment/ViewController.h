//
//  ViewController.h
//  ios-segment
//
//  Created by apple on 15/5/14.
//  Copyright (c) 2015年 HanHe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)segment_select:(UISegmentedControl *)sender;

-(void)segmentSort : (int)colCount;

-(void)addImg : (NSString*) name : (float)x : (float)y;
@end

