//
//  BaseViewController.h
//  BaiduLibrary
//
//  Created by zhuayi on 14/10/20.
//  Copyright (c) 2014年 zhuayi inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppMacro.h"
#import "UIView+Util.h"

@interface BaseViewController : UIViewController

//  是否显示返回按钮
@property (nonatomic, assign) BOOL isShowBackButton;

@property (nonatomic, strong) UIView * navigationView;

@property (nonatomic, assign) BOOL isShowNavigationView;

@property (nonatomic, strong) UIButton * backButton;

/**
 *  是否不监听网络
 */
@property (nonatomic, assign) BOOL isNotMontorNetWork;

//返回
- (void)goBack;


// 网络不可用时
- (void) netWorkUnavailable;

// 网络可用时
- (void) netWorkAvailable;

@end
