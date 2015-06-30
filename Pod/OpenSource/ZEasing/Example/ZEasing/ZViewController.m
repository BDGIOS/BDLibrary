//
//  ZViewController.m
//  ZEasing
//
//  Created by zhuayi on 05/04/2015.
//  Copyright (c) 2014 zhuayi. All rights reserved.
//

#import "ZViewController.h"
#import "ZEasing.h"
@implementation ZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *aaa = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    aaa.backgroundColor = [UIColor blackColor];
    [self.view addSubview:aaa];
    CGFloat a = [ZEasing tween:0.1 fromValue:1.0 toValue:100 duration:0.2 tweenType:TweenTypeQuintic easeType:EaseTypeEaseOut] ;
    NSLog(@"aaa : %f", a);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
