//
//  ZEasing+Quintic.h
//  ZEasing
//
//  Created by zhuayi on 15/5/4.
//  Copyright (c) 2015年 zhuayi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZEasing_Quintic : NSObject

+ (CGFloat)easeIn:(CGFloat)currentTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration;


+ (CGFloat)easeOut:(CGFloat)currentTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration;


+ (CGFloat)easeInOut:(CGFloat)currentTime fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue duration:(CGFloat)duration;

@end
