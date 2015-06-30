//
//  ZEasing.m
//  ZEasing
//
//  Created by zhuayi on 15/5/4.
//  Copyright (c) 2015年 zhuayi. All rights reserved.
//

#import "ZEasing.h"
#import "ZEasing+Linear.h"
#import "ZEasing+Quadratic.h"
#import "ZEasing+Cubic.h"
#import "ZEasing+Quart.h"
#import "ZEasing+Quintic.h"

@implementation ZEasing

static ZEasing *sharedCLDelegate = nil;

+ (CGFloat)tween:(CGFloat)currentTime
       fromValue:(CGFloat)fromValue
         toValue:(CGFloat)toValue
        duration:(CGFloat)duration
    tweenType:(TweenType)tweenType easeType:(EaseType)easeType {
    
    switch (tweenType) {
        case TweenTypeLinear:
            return [ZEasing_Linear tween:currentTime fromValue:fromValue toValue:toValue duration:duration];
            break;
        
        case TweenTypeQuadratic:
            
            if (easeType == EaseTypeEaseIn) {
                return [ZEasing_Quadratic easeIn:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
            if (easeType == EaseTypeEaseOut) {
                return [ZEasing_Quadratic easeOut:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
            if (easeType == EaseTypeEaseInOut) {
                return [ZEasing_Quadratic easeInOut:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
        case TweenTypeCubic:
            
            if (easeType == EaseTypeEaseIn) {
                return [ZEasing_Cubic easeIn:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
            if (easeType == EaseTypeEaseOut) {
                return [ZEasing_Cubic easeOut:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
            if (easeType == EaseTypeEaseInOut) {
                return [ZEasing_Cubic easeInOut:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
        case TweenTypeQuartic:
            
            if (easeType == EaseTypeEaseIn) {
                return [ZEasing_Quartic easeIn:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
            if (easeType == EaseTypeEaseOut) {
                return [ZEasing_Quartic easeOut:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
            if (easeType == EaseTypeEaseInOut) {
                return [ZEasing_Quartic easeInOut:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
        case TweenTypeQuintic:
            
            if (easeType == EaseTypeEaseIn) {
                return [ZEasing_Quintic easeIn:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
            if (easeType == EaseTypeEaseOut) {
                return [ZEasing_Quintic easeOut:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
            if (easeType == EaseTypeEaseInOut) {
                return [ZEasing_Quintic easeInOut:currentTime fromValue:fromValue toValue:toValue duration:duration];
            }
            
        default:
            break;
    }
    return toValue;
}

@end
