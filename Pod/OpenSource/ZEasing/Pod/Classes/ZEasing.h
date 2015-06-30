//
//  ZEasing.h
//  ZEasing
//
//  Created by zhuayi on 15/5/4.
//  Copyright (c) 2015年 zhuayi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, EaseType) {
    
    // 从0开始加速的缓动
    EaseTypeEaseIn,
    
    // 减速到0的缓动
    EaseTypeEaseOut,
    
    // 前半段从0开始加速，后半段减速到0的缓动
    EaseTypeEaseInOut
};


typedef NS_ENUM(NSInteger, TweenType) {
    
    // Linear 无缓动效果
    TweenTypeLinear,
    
    // Quadratic 二次方的缓动 t^2）；
    TweenTypeQuadratic,
    
    // Cubic 三次方的缓动 （t^3）
    TweenTypeCubic,
    
    // Quartic 四次方的缓动 （t^4）
    TweenTypeQuartic,
    
    // Quintic 五次方的缓动 （t^5）
    TweenTypeQuintic,
    
    // Sinusoidal 正弦曲线的缓动 （sin(t)）
    TweenTypeSinusoidal,
    
    // Exponential 指数曲线的缓动 （2^t）
    TweenTypeExponential,
    
    // Circular 圆形曲线的缓动 （sqrt(1-t^2)）
    TweenTypeCircular,
    
    // Elastic 指数衰减的正弦曲线缓动
    TweenTypeElastic,
    
    // Back 超过范围的三次方缓动（(s+1)*t^3 - s*t^2）
    TweenTypeBack,
    
    // Bounce 指数衰减的反弹缓动
    TweenTypeBounce
};



@interface ZEasing : NSObject

+ (CGFloat)tween:(CGFloat)currentTime
       fromValue:(CGFloat)fromValue
         toValue:(CGFloat)toValue
        duration:(CGFloat)duration
       tweenType:(TweenType)tweenType
        easeType:(EaseType)easeType;


@end
