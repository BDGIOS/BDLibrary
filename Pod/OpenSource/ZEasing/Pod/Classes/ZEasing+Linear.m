//
//  ZEasing+Linear.m
//  ZEasing
//
//  Created by zhuayi on 15/5/4.
//  Copyright (c) 2015年 zhuayi. All rights reserved.
//

#import "ZEasing+Linear.h"


@implementation ZEasing_Linear


+ (CGFloat)tween:(CGFloat)currentTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration {
    
    toValue = toValue - fromValue;
    return (currentTime >= duration) ? fromValue + toValue :toValue * currentTime / duration + fromValue;
}

@end
